import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chenji_ista_app/ui/page/message/message_eye/eyetoeye_three_days/initiate_eye_page.dart';
import 'package:flutter_chenji_ista_app/ui/page/message/message_eye/message_eye_page.dart';
import 'package:flutter_chenji_ista_app/utils/header_index.dart';
import 'package:flutter_chenji_ista_app/utils/line_util.dart';
import 'package:flutter_chenji_ista_app/utils/refresh_normal_header.dart';

/*
* 我的三天对对眼
* */
class MyEyeToEyePage extends StatefulWidget {
  MyEyeToEyePageState createState() => MyEyeToEyePageState();
}

class MyEyeToEyePageState extends State<MyEyeToEyePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
        child: Column(
      children: <Widget>[RefreshExpanded(), EyeToEyeButton()],
    ));
  }

  Expanded RefreshExpanded() {
    return Expanded(
      child: EasyRefresh.custom(
        header: NormalHeader(),
        footer: NormalFooter(),
        slivers: <Widget>[
          //用户列表
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return MyEyeToEyeItem();
            }, childCount: 30),
          ),
        ],
      ),
      flex: 1,
    );
  }

  Container EyeToEyeButton() {
    return Container(
      margin: EdgeInsets.only(bottom: UIAdapter.adapter.width(80)),
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
                InitiateEye();
              },
              child: Text(
                "发起新对眼",
                style: TextStyle(color: Colors.white),
              )),
          width: ScreenUtil.getInstance().screenWidth -
              UIAdapter.adapter.width(180),
        ),
      ),
    );
  }

  void InitiateEye() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return InitiateEyePage();
    }));
  }
}

/*
* 我得对对眼item
* */
class MyEyeToEyeItem extends StatefulWidget {
  MyEyeToEyeItemState createState() => MyEyeToEyeItemState();
}

class MyEyeToEyeItemState extends State<MyEyeToEyeItem> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: () {
        Navigator.push(context, CustomRoute(EyeToEyePage()));
      },
      child: Container(
        height: UIAdapter.adapter.width(160),
        color: Colours.background_color,
        child: Container(
          color: Color(0xFFFFFFFF),
          margin: EdgeInsets.only(top: UIAdapter.adapter.width(20)),
          child: Stack(
            children: <Widget>[
              Positioned(
                bottom: UIAdapter.adapter.width(20),
                child: Row(
                  children: <Widget>[
                    HeaderContainer(20),
                    EyeContainer(),
                    HeaderContainer(10),
                  ],
                ),
              ),
              DaysContainer()
            ],
          ),
        ),
      ),
    );
  }

  Container HeaderContainer(double margin) {
    return Container(
      margin: EdgeInsets.only(left: margin),
      child: ClipOval(
        child: new Image.asset(
          ImageHelper.wrapAssets("icon_header.jpeg"),
          height: UIAdapter.adapter.width(80),
        ),
      ),
    );
  }

  Container EyeContainer() {
    return Container(
      margin: EdgeInsets.only(
        left: UIAdapter.adapter.width(20),
      ),
      child: new Image.asset(
        MessageIcons.eyetoeye,
        height: UIAdapter.adapter.width(60),
      ),
    );
  }

  Positioned DaysContainer() {
    return Positioned(
        right: UIAdapter.adapter.width(40),
        bottom: UIAdapter.adapter.width(54),
        child: Container(
          margin: EdgeInsets.only(right: UIAdapter.adapter.width(40)),
          child: Text(
            "第一天  >",
            style: TextStyle(
                color: Color(0xFF666666),
                fontWeight: FontWeight.bold,
                fontSize: UIAdapter.adapter.width(32)),
          ),
        ));
  }
}
