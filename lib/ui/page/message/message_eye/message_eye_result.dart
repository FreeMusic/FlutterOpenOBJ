import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_chenji_ista_app/config/resource_mananger.dart';
import 'package:flutter_chenji_ista_app/res/colors.dart';
import 'package:flutter_chenji_ista_app/ui/page/home/home_page_recommend/home_page_recommend_userinfo.dart';
import 'package:flutter_chenji_ista_app/ui/page/message/message_eye/platform_conventions_page.dart';
import 'package:flutter_chenji_ista_app/ui/widget/my_app_bar.dart';
import 'package:flutter_chenji_ista_app/utils/flutter_screenutil.dart';
import 'package:flutter_chenji_ista_app/utils/header_index.dart';
import 'package:flutter_chenji_ista_app/utils/line_util.dart';
/*
* 约见的结果， 包含成功和失败
* */

class AppointMentResult extends StatefulWidget {
  @override
  _AppointMentResultState createState() => _AppointMentResultState();
}

class _AppointMentResultState extends State<AppointMentResult> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BrightnessLightBar(),
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        children: <Widget>[
          TitleContainer(),
          CircleContainer(),
          StyleContainer(),
          StatementContainer(),
          RiskAlertContainer(),
          DealResultContainer(),
          WeChatContainer()
        ],
      )),
    );
  }

  Container TitleContainer() {
    return Container(
      margin: EdgeInsets.only(top: UIAdapter.adapter.width(60)),
      child: SuccessTitleRow(),
    );
  }

  Row SuccessTitleRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Image.asset(
          MessageIcons.wholeheart,
          height: UIAdapter.adapter.width(80),
        ),
        TitleTextContainer("恭喜成功约见!"),
        new Image.asset(
          MessageIcons.wholeheart,
          height: UIAdapter.adapter.width(80),
        )
      ],
    );
  }

  Container TitleTextContainer(String text) {
    return Container(
      child: Text(
        text,
        style: TextStyle(
            color: Colours.main_color,
            fontWeight: FontWeight.bold,
            fontSize: UIAdapter.adapter.width(45)),
      ),
    );
  }

  Container CircleContainer() {
    double width = ScreenUtil.getInstance().screenWidth / 1.5;
    double height = width * (112 / 212);
    return Container(
      margin: EdgeInsets.only(top: UIAdapter.adapter.width(100)),
      child: Stack(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Image.asset(
                MessageIcons.circle,
                width: width,
                height: height,
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: UIAdapter.adapter.width(18)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ClipOval(
                  child: new Image.asset(
                    MessageIcons.header,
                    width: ScreenUtil.getInstance().screenWidth / 3 -
                        UIAdapter.adapter.width(20),
                  ),
                ),
                ClipOval(
                  child: new Image.asset(
                    MessageIcons.header,
                    width: ScreenUtil.getInstance().screenWidth / 3 -
                        UIAdapter.adapter.width(20),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(
                top: (height - UIAdapter.adapter.width(150)) / 2),
            child: Center(
              child: Image.asset(
                MessageIcons.wholeheart,
                height: UIAdapter.adapter.width(150),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container StyleContainer() {
    return Container(
      margin: EdgeInsets.only(top: UIAdapter.adapter.width(80)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          MyText("见面方式：", Colours.gray_33, 38),
          MyText("自主约见", Colours.main_color, 38)
        ],
      ),
    );
  }

  Container StatementContainer() {
    return Container(
      margin: EdgeInsets.only(top: UIAdapter.adapter.width(30)),
      child: MyText("请解锁对方微信并自行联系", Colours.gray_66, 32),
    );
  }

  Container RiskAlertContainer() {
    return Container(
      margin: EdgeInsets.only(top: UIAdapter.adapter.width(300)),
      child: FlatButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (BuildContext context) {
              return PlatformConventionsPage();
            }));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              MyText("查看", Colours.gray_66, 30),
              MyText("《见面风险提示说明》", Colours.main_color, 30),
            ],
          )),
    );
  }

  Container DealResultContainer() {
    return Container(
//      margin: EdgeInsets.only(bottom: UIAdapter.adapter.width(80)),
      child: ClipRRect(
        borderRadius:
            BorderRadius.all(Radius.circular(UIAdapter.adapter.width(180))),
        child: Container(
          //设置了color属性 就不要设置decoration了，会产生冲突
          decoration: new BoxDecoration(
            gradient: const LinearGradient(
                colors: [Color(0xFFFEB48D), Color(0xFFFB64AD)]),
          ),
          child: FlatButton(
              onPressed: () {
                //跳转至用户详情页面
                Navigator.push(context, RotateScaleRouter(HomeUserInfoPage()));
              },
              child: Text(
                "看TA主页",
                style: TextStyle(color: Colors.white),
              )),
          width: ScreenUtil.getInstance().screenWidth -
              UIAdapter.adapter.width(100),
        ),
      ),
    );
  }

  Container WeChatContainer() {
    return Container(
      child: FlatButton(
        onPressed: () {},
        child: MyText("解锁微信", Colours.main_color, 32),
      ),
    );
  }

  Text MyText(String title, Color textColor, double font) {
    return Text(
      title,
      style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.bold,
          fontSize: UIAdapter.adapter.width(font)),
    );
  }

  /*
  * 导航栏
  * */
  AppBar BrightnessLightBar() {
    return YQAppBar(
      text: "约见成功",
      style: YQAppBarStyle.light,
      context: context,
    );
  }
}
