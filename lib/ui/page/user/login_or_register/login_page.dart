import 'package:flutter/material.dart';
import 'package:flutter_chenji_ista_app/api/network.dart';
import 'package:flutter_chenji_ista_app/config/constant.dart';
import 'package:flutter_chenji_ista_app/config/resource_mananger.dart';
import 'package:flutter_chenji_ista_app/model/user_bean_entity.dart';
import 'package:flutter_chenji_ista_app/res/colors.dart';
import 'package:flutter_chenji_ista_app/res/strings.dart';
import 'package:flutter_chenji_ista_app/res/styles.dart';
import 'package:flutter_chenji_ista_app/ui/page/user/login_or_register/forget_pwd_page.dart';
import 'package:flutter_chenji_ista_app/ui/widget/base_stateful_widget.dart';
import 'package:flutter_chenji_ista_app/ui/widget/edit_textview.dart';
import 'package:flutter_chenji_ista_app/ui/widget/roundbutton.dart';
import 'package:flutter_chenji_ista_app/ui/widget/tab_navigator.dart';
import 'package:flutter_chenji_ista_app/utils/flutter_screenutil.dart';
import 'package:flutter_chenji_ista_app/utils/object_util.dart';
import 'package:flutter_chenji_ista_app/utils/sp_util.dart';

class LoginPage extends BaseWidget {
  @override
  BaseWidgetState<BaseWidget> getState() {
    return _LoginPagePageState();
  }
}

class _LoginPagePageState extends BaseWidgetState<LoginPage> {
  TextEditingController _controllerUser = new TextEditingController();
  TextEditingController _controllerPwd = new TextEditingController();

  String userPhone = "";
  String userPwd = "";

  bool isPwdlength_6_12 = false;

  @override
  void onCreate() {
//    输入框监听
    _controllerUser.addListener(() {
      userPhone = _controllerUser.text;
      print("controller的监听方法：" + userPhone);

      setState(() {
        if (!ObjectUtil.isEmpty(userPhone) && !ObjectUtil.isEmpty(userPwd)) {
          isPwdlength_6_12 = true;
        } else {
          isPwdlength_6_12 = false;
        }
        print("===============    $isPwdlength_6_12");
      });
    });

    _controllerPwd.addListener(() {
      userPwd = _controllerPwd.text;
      print("controller的监听方法：" + userPwd);
      if (ObjectUtil.isEmpty(userPhone)) {
        showToast("请输入手机号码");
      }

      setState(() {
        if (!ObjectUtil.isEmpty(userPhone) && !ObjectUtil.isEmpty(userPwd)) {
          isPwdlength_6_12 = true;
        } else {
          isPwdlength_6_12 = false;
        }
        print("===============    $isPwdlength_6_12");
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
//                    color: Colours.button_color_red,
                    margin: EdgeInsets.only(
                        left: 10, top: 10 + ScreenUtil.statusBarHeight),
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
                  alignment: Alignment.topRight,
                  margin: EdgeInsets.only(
                      top: 10 + ScreenUtil.statusBarHeight, right: 30),
                  child: FlatButton(
                    child: Text(
                      "忘记密码",
                      style: TextStyle(color: Colours.gray_99),
                    ),
                    onPressed: () {
                      startAct(ForgetPwdPage());
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(
                      20, 10 + ScreenUtil.statusBarHeight, 20, 20),
                  child: Column(
                    children: <Widget>[
                      Gaps.vGap40,
                      Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            '密码登录',
                            style: TextStyle(
                                color: Colours.gray_00,
                                fontStyle: FontStyle.normal,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          )),
                      LoginItem(
//                            textInputAction: TextInputAction.next,
                        textInputType: TextInputType.phone,
                        controller: _controllerUser,
                        hintText: "输入手机号",
                      ),
                      Gaps.vGap10,
                      LoginItem(
                        controller: _controllerPwd,
                        textInputAction: TextInputAction.done,
                        inputType: "[a-zA-Z]|[0-9]",
                        hasSuffixIcon: true,
                        hintText: "输入密码",
                      ),
                      Gaps.vGap50,
                      RoundButton(
                        text: "登录",
                        onPressed: () {
                          print("============== userphone >>>>>> " + userPhone);
                          print("============== userPwd >>>>>> " + userPwd);
                          if (ObjectUtil.isEmpty(userPhone)) {
                            showToast("请输入手机号");
                            return;
                          }

                          if (!Strings.isPhone(userPhone)) {
                            showToast("请输入正确手机号");
                          }

                          if (ObjectUtil.isEmpty(userPwd)) {
                            showToast("请输入密码");
                            return;
                          }

                          gotoLogin(userPhone, userPwd);
                        },
                        bgColor: isPwdlength_6_12
                            ? Colours.transparent
                            : Colours.button_white_defult,
                      ),
                    ],
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

  @override
  void onDestroy() {}

//  登录
  void gotoLogin(userPhone, userPwd) {
    Map<String, String> params = {
      "username": userPhone,
      "password": userPwd,
    };
//    NetWork.getInstans().loginUsers(params, (LoginModel model) {
//      if (model.code == 0) {
//        //成功
//        startAct(TabMainNavigator());
//        SpUtil.putString(Constant.keyUserToken, model.data);
//        SpUtil.putBool(Constant.isLogin, true);
////        登录成功后 保存 头像
//        SpUtil.putString(Constant.userlogoUrl, ImageHelper.userlogo);
//      } else {
//        showToast(model.msg);
//      }
//    }, (error) {
//      showToast(error);
//    });
  }
}
