import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_chenji_ista_app/ui/widget/my_app_bar.dart';
import 'package:flutter_chenji_ista_app/utils/header_index.dart';
import 'package:flutter_chenji_ista_app/utils/line_util.dart';

/*
* 发起对对眼页面
* */
class InitiateEyePage extends StatefulWidget {
  InitiateEyePageState createState() => InitiateEyePageState();
}

class InitiateEyePageState extends State<InitiateEyePage> {
  List<String> titles = ["年龄：", "身高：", "收入："];
  List<String> contents = ["设置年龄范围 >", "设置身高范围 >", "设置年收入 >"];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: BrightnessLightBar(),
      body: Column(
        children: <Widget>[RefreshExpanded(), EyeToEyeButton()],
      ),
    );
  }

  Expanded RefreshExpanded() {
    return Expanded(
      child: EasyRefresh.custom(
        slivers: <Widget>[
          SliverList(
              delegate: SliverChildListDelegate([
            TitleContainer(),
          ])),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return ItemContainer(index);
            }, childCount: titles.length),
          ),
        ],
      ),
      flex: 1,
    );
  }

  GestureDetector ItemContainer(int index) {
    return GestureDetector(
        child: Container(
      height: UIAdapter.adapter.width(160),
      color: Colors.white,
      child: Stack(
        children: <Widget>[
          Positioned(
              left: UIAdapter.adapter.width(50),
              top: UIAdapter.adapter.width(30),
              bottom: UIAdapter.adapter.width(30),
              child: Center(
                child: Text(
                  titles[index],
                  style: TextStyle(
                      color: Color(0xFF666666),
                      fontWeight: FontWeight.bold,
                      fontSize: UIAdapter.adapter.width(32)),
                ),
              )),
          LineUtil.share().linePositioned(),
          Positioned(
              right: UIAdapter.adapter.width(50),
              top: UIAdapter.adapter.width(30),
              bottom: UIAdapter.adapter.width(30),
              child: Center(
                child: Text(
                  contents[index],
                  style: TextStyle(
                      color: Color(0xFF999999),
                      fontWeight: FontWeight.bold,
                      fontSize: UIAdapter.adapter.width(32)),
                ),
              )),
        ],
      ),
    ));
  }

  Container TitleContainer() {
    return Container(
      color: Colours.background_color,
      child: Container(
        margin: EdgeInsets.only(top: UIAdapter.adapter.width(30)),
        padding: EdgeInsets.only(
            top: UIAdapter.adapter.width(30),
            bottom: UIAdapter.adapter.width(30),
            left: UIAdapter.adapter.width(40)),
        color: Colors.white,
        child: Text(
          "设置您的要求",
          style: TextStyle(
              color: Color(0xFF333333),
              fontSize: UIAdapter.adapter.width(40),
              fontWeight: FontWeight.bold),
        ),
      ),
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
                "发起匹配",
                style: TextStyle(color: Colors.white),
              )),
          width: ScreenUtil.getInstance().screenWidth -
              UIAdapter.adapter.width(180),
        ),
      ),
    );
  }

  void InitiateEye() {
    print("发起对对眼匹配");
  }

  /*
  * 导航栏
  * */
  AppBar BrightnessLightBar() {
    return YQAppBar(
      text: "发起对对眼",
      style: YQAppBarStyle.light,
      context: context,
    );
  }
}
