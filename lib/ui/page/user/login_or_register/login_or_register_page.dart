import 'package:flutter/material.dart';
import 'package:flutter_chenji_ista_app/api/network.dart';
import 'package:flutter_chenji_ista_app/config/constant.dart';
import 'package:flutter_chenji_ista_app/config/resource_mananger.dart';
import 'package:flutter_chenji_ista_app/model/user_bean_entity.dart';
import 'package:flutter_chenji_ista_app/res/colors.dart';
import 'package:flutter_chenji_ista_app/res/strings.dart';
import 'package:flutter_chenji_ista_app/res/styles.dart';
import 'package:flutter_chenji_ista_app/ui/page/user/login_or_register/register_page.dart';
import 'package:flutter_chenji_ista_app/ui/widget/base_stateful_widget.dart';
import 'package:flutter_chenji_ista_app/ui/widget/edit_textview.dart';
import 'package:flutter_chenji_ista_app/ui/widget/roundbutton.dart';
import 'package:flutter_chenji_ista_app/ui/widget/tab_navigator.dart';
import 'package:flutter_chenji_ista_app/utils/flutter_screenutil.dart';
import 'package:flutter_chenji_ista_app/utils/sp_util.dart';

import 'login_page.dart';

class OrLoginPage extends BaseWidget {
  @override
  BaseWidgetState<BaseWidget> getState() {
    // TODO: implement getState
    return _OrLoginPageState();
  }
}

class _OrLoginPageState extends BaseWidgetState<OrLoginPage> {
  TextEditingController _controllerPhone = new TextEditingController();

  bool isStrlength11 = false;

  @override
  void initState() {
//    输入框监听
    _controllerPhone.addListener(() {
      print("controller的监听方法：" + _controllerPhone.text);
      setState(() {
        if (_controllerPhone.text.length == 11) {
          isStrlength11 = true;
        } else {
          isStrlength11 = false;
        }
      });
    });
  }

  void _userLogin() async {
    String userphone = _controllerPhone.text;
    if (userphone.isEmpty || userphone.length < 11) {
      showToast(userphone.isEmpty ? "请输入手机号～" : "手机号至少11位～");
      return;
    }
    if (!Strings.isPhone(userphone)) {
      showToast("手机号格式有误");
      return;
    }

    NetWork.getInstans().isRegisterUser(
      userphone,
      (LoginOrRegisterModel isRegisterEntity) {
        SpUtil.putString(Constant.keyUserPhone, userphone);
        print("=============>>>>>>>>>>>>>>>>=============>>>>>>>>>>>>>>>>" +
            SpUtil.getString(Constant.keyUserPhone));
//        startAct(LoginPage());
//        startAct(RegisterPage());
//        1已注册, 0未注册
        if (isRegisterEntity.data == 1) {
          startAct(LoginPage());
        } else {
          startAct(RegisterPage());
        }
      },
      (error) {
        showToast(error);
      },
    );
  }

  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            child: Row(
              children: <Widget>[
                GestureDetector(
                  child: Container(
                    width: 30,
                    height: 30,
//                  color: Colours.button_color_red,
                    margin: EdgeInsets.only(
                        left: 10, top: 20 + ScreenUtil.statusBarHeight),
                    padding: EdgeInsets.only(left: 10),
                    alignment: Alignment.topLeft,
                    child: FlatButton(
                      child: new Image.asset(
                        ImageHelper.userAssets(UserIcons.login_or_register_goleft),
                        height: 15,
                        width: 15,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  onTap: () {},
                ),
                Container(
                  width: 30,
                  height: 30,
                  margin: EdgeInsets.only(
                      left: 10,
                      top: 20 + ScreenUtil.statusBarHeight,
                      right: 20),
                  alignment: Alignment.topLeft,
//                color: Colours.button_color_red,
                  child: new Image.asset(
                    ImageHelper.wrapAssets(UserIcons.login_or_register_left_love),
                    height: 30,
                    width: 30,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(
                left: 20, top: 70 + ScreenUtil.statusBarHeight, right: 20),
            child: new Column(
              children: <Widget>[
                new Container(
                  child: Text(
                    '手机号码登录注册',
                    style: TextStyle(
                        color: Colours.gray_00,
                        fontStyle: FontStyle.normal,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  alignment: Alignment.topLeft,
                ),
                Gaps.vGap15,
                new LoginItem(
                  textInputType: TextInputType.phone,
                  controller: _controllerPhone,
                  hintText: "输入手机号码",
                ),
                Gaps.vGap50,
                new RoundButton(
                  text: "下一步",
                  onPressed: () {
                    _userLogin();
                  },
                  bgColor: isStrlength11
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
                    onPressed: () {
                      _showDialog();
                    },
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
                    onPressed: () {
                      _showDialog();
                    },
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
      resizeToAvoidBottomPadding: true, //输入框抵住键盘
    );
  }

  @override
  void onCreate() {}

  @override
  void onDestroy() {}

  void _showDialog() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AgreementDialog(
            title: '图形验证码',
            negativeText: '取消',
            positiveText: '确定',
            onCloseEvent: () {
              print('Dialog对话框关闭');
              Navigator.pop(context); //关闭对话框
            },
//            确定的点击事件
            onPositivePressEvent: () {},
          );
        });
  }
}

class AgreementDialog extends Dialog {
  String title;
  String negativeText;
  String positiveText;
  Function onCloseEvent;
  Function onPositivePressEvent;
  TextEditingController controllerImageCode;

  AgreementDialog({
    Key key,
    @required this.title,
    this.negativeText,
    this.positiveText,
    this.onPositivePressEvent,
    this.controllerImageCode,
    @required this.onCloseEvent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.all(25.0),
      child: new Material(
        type: MaterialType.transparency,
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Container(
              decoration: ShapeDecoration(
                color: Color(0xffffffff),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                ),
              ),
              margin: const EdgeInsets.all(12.0),
              child: new Column(
                children: <Widget>[
                  new Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: new Row(
                      children: <Widget>[
                        new Expanded(
                          child: new Text(
                            title,
                            style: new TextStyle(
                              fontSize: 16.0,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        new Expanded(child: Container()),
                        new GestureDetector(
//                          onTap: this.onCloseEvent,
                          onTap: this.onCloseEvent,
                          child: new Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: new Icon(
                              Icons.close,
                              color: Color(0xff666666),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  _scrollView(),
                  DividerH.divider,
                  this._buildBottomButtonGroup(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

//  以结婚为目的的严肃的相亲平台，平台上不允许有任何非正常价值观的用户存在。"
//  "以结婚为目的的严肃的相亲平台，平台上不允许有任何非正常价值观的用户存在。"
//  "以结婚为目的的严肃的相亲平台，平台上不允许有任何非正常价值观的用户存在。"
//  "以结婚为目的的严肃的相亲平台，平台上不允许有任何非正常价值观的用户存在。"
//  "以结婚为目的的严肃的相亲平台，平台上不允许有任何非正常价值观的用户存在。"
//  "以结婚为目的的严肃的相亲平台，平台上不允许有任何非正常价值观的用户存在。"
//  "以结婚为目的的严肃的相亲平台，平台上不允许有任何非正常价值观的用户存在。"
//  "以结婚为目的的严肃的相亲平台，平台上不允许有任何非正常价值观的用户存在。"
//  "以结婚为目的的严肃的相亲平台，平台上不允许有任何非正常价值观的用户存在。"
//  "以结婚为目的的严肃的相亲平台，平台上不允许有任何非正常价值观的用户存在。
  Widget _scrollView() {
    return new Container(
      height: 100,

    );
  }

  Widget _buildBottomButtonGroup() {
    var widgets = <Widget>[];
    if (negativeText != null && negativeText.isNotEmpty) {
      widgets.add(_buildBottomCancelButton());
    }
    widgets.add(_buildBottomLine());

    if (positiveText != null && positiveText.isNotEmpty) {
      widgets.add(_buildBottomPositiveButton());
    }
    return new Flex(
      direction: Axis.horizontal,
      children: widgets,
    );
  }

  Widget _buildBottomCancelButton() {
    return new Flexible(
      fit: FlexFit.tight,
      child: new FlatButton(
        onPressed: onCloseEvent,
        child: new Text(
          negativeText,
          style: TextStyle(fontSize: 14.0, color: Colours.divider),
        ),
      ),
    );
  }

  Widget _buildBottomLine() {
    return new Container(
      height: 25,
      width: 1,
      color: Colours.divider,
    );
  }

  Widget _buildBottomPositiveButton() {
    return new Flexible(
      fit: FlexFit.tight,
      child: new FlatButton(
        onPressed: onPositivePressEvent,
        child: new Text(
          positiveText,
          style: TextStyle(
            color: Colours.button_color_red,
            fontSize: 14.0,
          ),
        ),
      ),
    );
  }
}
