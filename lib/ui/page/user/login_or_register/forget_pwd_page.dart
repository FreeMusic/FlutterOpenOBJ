import 'package:flutter/material.dart';
import 'package:flutter_chenji_ista_app/api/network.dart';
import 'package:flutter_chenji_ista_app/config/constant.dart';
import 'package:flutter_chenji_ista_app/model/base_bean_entity.dart';
import 'package:flutter_chenji_ista_app/model/user_bean_entity.dart';
import 'package:flutter_chenji_ista_app/res/colors.dart';
import 'package:flutter_chenji_ista_app/res/strings.dart';
import 'package:flutter_chenji_ista_app/ui/page/user/login_or_register/login_page.dart';
import 'package:flutter_chenji_ista_app/ui/page/user/user_widget/login_register_widget.dart';
import 'package:flutter_chenji_ista_app/ui/widget/base_stateful_widget.dart';
import 'package:flutter_chenji_ista_app/ui/widget/edit_textview.dart';
import 'package:flutter_chenji_ista_app/ui/widget/roundbutton.dart';
import 'package:flutter_chenji_ista_app/ui/widget/tab_navigator.dart';
import 'package:flutter_chenji_ista_app/utils/flutter_screenutil.dart';
import 'package:flutter_chenji_ista_app/utils/object_util.dart';
import 'package:flutter_chenji_ista_app/utils/sp_util.dart';
import 'package:flutter_chenji_ista_app/utils/timer_util.dart';

class ForgetPwdPage extends BaseWidget {
  @override
  BaseWidgetState<BaseWidget> getState() {
    return _ForgetPwdPageState();
  }
}

class _ForgetPwdPageState extends BaseWidgetState<ForgetPwdPage> {
  TextEditingController _controllerPhone = new TextEditingController();
  TextEditingController _controllerCode = new TextEditingController();
  TextEditingController _controllerPwd = new TextEditingController();
  TextEditingController _controllerPwd2 = new TextEditingController();

  String userPhone;
  String captchaCode;
  String userPwd;
  String userPwd2;

  bool isPwdlength_6_12 = false;
  TimerUtil _timerUtil;
  int _count = 30;
  String againStr = "获取验证码";

  @override
  void onCreate() {
    _controllerPhone.addListener(() {
      userPhone = _controllerPhone.text;
      print("手机号：" + userPhone);
      setState(() {
        if (!ObjectUtil.isEmpty(userPhone) &&
            !ObjectUtil.isEmpty(captchaCode) &&
            !ObjectUtil.isEmpty(userPwd) &&
            !ObjectUtil.isEmpty(userPwd2)) {
          isPwdlength_6_12 = true;
        } else {
          isPwdlength_6_12 = false;
        }
        print("===============手机号 phone   $isPwdlength_6_12");
      });
    });

    _controllerCode.addListener(() {
      captchaCode = _controllerCode.text;
      print("短信验证码：" + captchaCode);

      if (ObjectUtil.isEmpty(userPhone)) {
        showToast("请输入短信验证码");
        print("请输入短信验证码");
      }

      setState(() {
        if (!ObjectUtil.isEmpty(userPhone) &&
            !ObjectUtil.isEmpty(captchaCode) &&
            !ObjectUtil.isEmpty(userPwd) &&
            !ObjectUtil.isEmpty(userPwd2)) {
          isPwdlength_6_12 = true;
        } else {
          isPwdlength_6_12 = false;
        }
        print("===============短信 code   $isPwdlength_6_12");
      });
    });

    _controllerPwd.addListener(() {
      userPwd = _controllerPwd.text;

      print("密码：" + userPwd);

      if (ObjectUtil.isEmpty(captchaCode)) {
        showToast("请输入短信验证码");
        print("请输入短信验证码");
      }
      setState(() {
        if (!ObjectUtil.isEmpty(userPhone) &&
            !ObjectUtil.isEmpty(captchaCode) &&
            !ObjectUtil.isEmpty(userPwd) &&
            !ObjectUtil.isEmpty(userPwd2)) {
          isPwdlength_6_12 = true;
        } else {
          isPwdlength_6_12 = false;
        }
        print("===============密码 code   $isPwdlength_6_12");
      });
    });

    _controllerPwd2.addListener(() {
      userPwd2 = _controllerPwd2.text;
      print("再次输入密码：" + userPwd2);
      if (ObjectUtil.isEmpty(userPwd)) {
        showToast("再次输入密码");
        print("再次输入密码");
      }

      setState(() {
        if (!ObjectUtil.isEmpty(userPhone) &&
            !ObjectUtil.isEmpty(captchaCode) &&
            !ObjectUtil.isEmpty(userPwd) &&
            !ObjectUtil.isEmpty(userPwd2)) {
          isPwdlength_6_12 = true;
        } else {
          isPwdlength_6_12 = false;
        }
        print("===============再次密码 code   $isPwdlength_6_12");
      });
    });
  }

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
                    '忘记密码',
                    style: TextStyle(
                        color: Colours.gray_00,
                        fontStyle: FontStyle.normal,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      left: 20,
                      top: 110 + ScreenUtil.statusBarHeight,
                      right: 20),
                  child: LoginItem(
                    controller: _controllerPhone,
                    inputType: "[0-9]",
                    textInputType: TextInputType.phone,
                    hintText: "请输入注册手机号",
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      left: 20,
                      top: 160 + ScreenUtil.statusBarHeight,
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
                  top: 155 + ScreenUtil.statusBarHeight,
                  right: 30,
                ),
                Container(
                  margin: EdgeInsets.only(
                      left: 20,
                      top: 210 + ScreenUtil.statusBarHeight,
                      right: 20),
                  child: LoginItem(
                    controller: _controllerPwd,
                    textInputAction: TextInputAction.done,
                    inputType: "[a-zA-Z]|[0-9]",
                    hasSuffixIcon: true,
                    hintText: "请输入新密码",
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      left: 20,
                      top: 260 + ScreenUtil.statusBarHeight,
                      right: 20),
                  child: LoginItem(
                    controller: _controllerPwd2,
                    textInputAction: TextInputAction.done,
                    inputType: "[a-zA-Z]|[0-9]",
                    hasSuffixIcon: true,
                    hintText: "请再次输入新密码",
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      left: 20,
                      top: 420 + ScreenUtil.statusBarHeight,
                      right: 20),
                  child: RoundButton(
                    text: "找回密码",
                    onPressed: () {
                      _findPwd();
                    },
                    bgColor: isPwdlength_6_12
                        ? Colours.transparent
                        : Colours.button_white_defult,
                  ),
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  margin: EdgeInsets.only(top: ScreenUtil.screenHeightDp - 60),
                  height: 30,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "注册即表示同意",
                        style: TextStyle(fontSize: 12),
                      ),
                      Flexible(
                        child: new FlatButton(
                          onPressed: () {},
                          child: new Text(
                            "《是TA用户协议》",
                            style: TextStyle(fontSize: 12),
                          ),
                          textColor: Colours.button_color_red,
                        ),
                      ),
                      Text(
                        "和",
                        style: TextStyle(fontSize: 12),
                      ),
                      Flexible(
                        child: new FlatButton(
                          onPressed: () {},
                          child: new Text(
                            "《是TA隐私权政策》",
                            style: TextStyle(fontSize: 12),
                          ),
                          textColor: Colours.button_color_red,
                        ),
                      ),
                    ],
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

  _findPwd() {
    print("============== userphone >>>>>> " + userPhone);
    print("============== captchaCode >>>>>> " + captchaCode);
    print("============== userPwd >>>>>> " + userPwd);

    if (ObjectUtil.isEmpty(userPhone)) {
      showToast("请输入注册手机号");
      return;
    }
    if (!Strings.isPhone(userPhone)) {
      showToast("请输入正确手机号");
      return;
    }
    if (ObjectUtil.isEmpty(captchaCode)) {
      showToast("请输入短信验证码");
      return;
    }

    if (ObjectUtil.isEmpty(userPwd)) {
      showToast("请输入新密码");
      return;
    }

    if (ObjectUtil.isEmpty(userPwd2)) {
      showToast("请再次输入新密码");
      return;
    }
    if (userPwd != userPwd2) {
      showToast("两次密码输入不一致");
      return;
    }

    Map<String, String> params = {
      "username": userPhone,
      "password": userPwd,
      "captcha": captchaCode,
      "uuid": SpUtil.getString(Constant.uuidimageUrl),
    };
//    NetWork.getInstans().updatePassword(params, (BaseModel model) {
//      if (model.code == 0) {
//        showToast("修改成功，请重新登录");
//        startAct(LoginPage());
//      } else {
//        showToast(model.msg);
//      }
//    }, (error) {
//      showToast(error.toString());
//    });
  }
}
