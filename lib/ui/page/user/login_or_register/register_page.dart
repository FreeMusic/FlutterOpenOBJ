import 'package:flutter/material.dart';
import 'package:flutter_chenji_ista_app/api/network.dart';
import 'package:flutter_chenji_ista_app/config/constant.dart';
import 'package:flutter_chenji_ista_app/model/base_bean_entity.dart';
import 'package:flutter_chenji_ista_app/model/user_bean_entity.dart';
import 'package:flutter_chenji_ista_app/res/colors.dart';
import 'package:flutter_chenji_ista_app/res/strings.dart';
import 'package:flutter_chenji_ista_app/res/styles.dart';
import 'package:flutter_chenji_ista_app/ui/page/user/user_widget/login_register_widget.dart';
import 'package:flutter_chenji_ista_app/ui/widget/base_stateful_widget.dart';
import 'package:flutter_chenji_ista_app/ui/widget/edit_textview.dart';
import 'package:flutter_chenji_ista_app/ui/widget/roundbutton.dart';
import 'package:flutter_chenji_ista_app/ui/widget/tab_navigator.dart';
import 'package:flutter_chenji_ista_app/utils/flutter_screenutil.dart';
import 'package:flutter_chenji_ista_app/utils/object_util.dart';
import 'package:flutter_chenji_ista_app/utils/sp_util.dart';
import 'package:flutter_chenji_ista_app/utils/timer_util.dart';

import 'login_page.dart';
import 'login_page.dart';

class RegisterPage extends BaseWidget {
  @override
  BaseWidgetState<BaseWidget> getState() {
    return _RegisterPageState();
  }
}

class _RegisterPageState extends BaseWidgetState<RegisterPage> {
  TextEditingController _controllerCode = new TextEditingController();
  TextEditingController _controllerPwd = new TextEditingController();

  String userPhone = SpUtil.getString(Constant.keyUserPhone);
  String userPwd = "";
  String captchaCode = "";

  bool isPwdlength_6_12 = false;
  TimerUtil _timerUtil;
  int _count = 30;
  String againStr = "获取验证码";

  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: ClampingScrollPhysics(),
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Stack(
              children: <Widget>[
                GestureDetector(
                  child: Container(
                    width: 30,
                    height: 30,
//                      color: Colours.button_color_red,
                    margin: EdgeInsets.only(
                        left: 10, top: 15 + ScreenUtil.statusBarHeight),
                    alignment: Alignment.topLeft,
                    child: FlatButton(
                      child: Icon(Icons.keyboard_arrow_left),
                      onPressed: null,
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                Container(
                  margin: EdgeInsets.only(
                      left: 20, top: 60 + ScreenUtil.statusBarHeight),
                  child: Text(
                    '输入6位短信验证并设置账户密码',
                    style: TextStyle(
                        color: Colours.gray_00,
                        fontStyle: FontStyle.normal,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(
                      left: 20, top: 100 + ScreenUtil.statusBarHeight),
                  child: Text('已发送 +86 $userPhone'),
                ),
                Container(
                  margin: EdgeInsets.only(
                      left: 20,
                      top: 140 + ScreenUtil.statusBarHeight,
                      right: 20),
                  child: LoginItem(
                    textInputAction: TextInputAction.next,
                    controller: _controllerCode,
                    hintText: "输入六位短信验证码",
                  ),
                ),
                Positioned(
                  child: FlatButton(
                    onPressed: () {
                      _controllerCode.text = "";
                      _showDialogSms();
                    },
                    child: Text(
                      againStr,
                    ),
                    color: Colours.transparent,
                  ),
                  top: 140,
                  right: 30,
                ),
                Container(
                  margin: EdgeInsets.only(
                      left: 20,
                      top: 200 + ScreenUtil.statusBarHeight,
                      right: 20),
                  child: LoginItem(
                    controller: _controllerPwd,
                    textInputAction: TextInputAction.done,
                    inputType: "[a-zA-Z]|[0-9]",
                    hasSuffixIcon: true,
                    hintText: "设置密码",
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      left: 20,
                      top: 320 + ScreenUtil.statusBarHeight,
                      right: 20),
                  child: RoundButton(
                    text: "注册并登录",
                    onPressed: () {
                      print("============== userphone >>>>>> " + userPhone);
                      print("============== captchaCode >>>>>> " + captchaCode);
                      print("============== userPwd >>>>>> " + userPwd);
                      if (ObjectUtil.isEmpty(captchaCode)) {
                        showToast("请输入短信验证码");
                        return;
                      }

                      if (ObjectUtil.isEmpty(userPwd)) {
                        showToast("请设置密码");
                        return;
                      }

                      Map<String, String> params = {
                        "username": userPhone,
                        "password": userPwd,
                        "captcha": captchaCode,
                        "uuid": SpUtil.getString(Constant.uuidimageUrl),
                      };
//                      NetWork.getInstans().registerUsers(params, (RegisterModel model) {
//                        if (model.code == 0) {
//                          gotoLogin(userPhone, userPwd);
//                        } else {
//                          showToast(model.msg);
//                        }
//                      }, (error) {
//                        showToast(error.toString());
//                      });
                    },
                    bgColor: isPwdlength_6_12
                        ? Colours.transparent
                        : Colours.button_white_defult,
                  ),
                ),

              ],
            ),
          )
        ],
      ),
    );
  }

  void _doCountDown() {
    _timerUtil = new TimerUtil(mTotalTime: 30 * 1000);
    _timerUtil.setOnTimerTickCallback((int tick) {
      double _tick = tick / 1000;
      setState(() {
        _count = _tick.toInt();
        againStr = "再次获取" + '$_count';
      });
      if (_tick == 0) {
        againStr = "获取验证码";
      }
    });
    _timerUtil.startCountDown();
  }

  @override
  void onCreate() {
    Future.delayed(new Duration(milliseconds: 500), () {
      _showDialogSms();
    });

//    输入框监听
    _controllerCode.addListener(() {
      captchaCode = _controllerCode.text;
      print("短信验证码：" + captchaCode);

      setState(() {
        if (!ObjectUtil.isEmpty(captchaCode) && !ObjectUtil.isEmpty(userPwd)) {
          isPwdlength_6_12 = true;
        } else {
          isPwdlength_6_12 = false;
        }
        print("===============再次密码 code   $isPwdlength_6_12");
      });
    });

    _controllerPwd.addListener(() {
      userPwd = _controllerPwd.text;
      print("controller的监听方法：" + userPwd);
      if (ObjectUtil.isEmpty(captchaCode)) {
        showToast("请输入短信验证码");
        print("请输入短信验证码");
      }
      setState(() {
        if (!ObjectUtil.isEmpty(captchaCode) && !ObjectUtil.isEmpty(userPwd)) {
          isPwdlength_6_12 = true;
        } else {
          isPwdlength_6_12 = false;
        }
        print("===============再次密码 code   $isPwdlength_6_12");
      });
    });
  }

  @override
  void onDestroy() {}

  void _showDialogSms() {
    TextEditingController controllerImageCode = new TextEditingController();

    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return SmsCodeDialog(
            title: '图形验证码',
            negativeText: '取消',
            positiveText: '确定',
            onCloseEvent: () {
              print('Dialog对话框关闭');
              Navigator.pop(context); //关闭对话框
            },
            controllerImageCode: controllerImageCode,
//            确定的点击事件
            onPositivePressEvent: () {
              if (ObjectUtil.isEmpty(controllerImageCode.text.toString())) {
                showToast("请输入图形验证码");
                return;
              }

              SpUtil.putString(
                  Constant.imageStr, controllerImageCode.text.toString());
              print(
                  "=============>>>>>>>>>>>>>>>>=============>>>>>>>>>>>>>>>>" +
                      controllerImageCode.text.toString());
              print(
                  "=============>>>>>>>>>>>>>>>>=============>>>>>>>>>>>>>>>>" +
                      userPhone);
              print(
                  "=============>>>>>>>>>>>>>>>>=============>>>>>>>>>>>>>>>> 随机字符串    " +
                      SpUtil.getString(Constant.uuidimageUrl));

              Map<String, String> params = {
                "mobile": userPhone,
                "captcha": controllerImageCode.text.toString(),
                "uuid": SpUtil.getString(Constant.uuidimageUrl),
              };
//              NetWork.getInstans().smsCaptchas(params, (BaseModel model) {
//                //成功
//                if (model.code == 0) {
//                  _doCountDown();
//                  Navigator.pop(context); //关闭对话框
//                } else {
//                  showToast(model.msg);
//                }
//              }, (error) {
//                showToast(error);
//              });
            },
          );
        });
  }

//  登录
  void gotoLogin(userPhone, userPwd) {
    Map<String, String> params = {
      "username": userPhone,
      "password": userPwd,
    };
//    NetWork.getInstans().loginUsers(params, (LoginModel model) {
//      if (model.code == 0) {
//        //成功
//        startActFinish(TabMainNavigator());
//        SpUtil.putString(Constant.keyUserToken, model.data);
//        SpUtil.putBool(Constant.isLogin, true);
//      } else {
//        showToast(model.msg);
//      }
//    }, (error) {
//      showToast(error);
//    });
  }
}
