import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_chenji_ista_app/utils/header_index.dart';
import 'package:flutter_chenji_ista_app/utils/line_util.dart';
import 'package:flutter_chenji_ista_app/utils/refresh_normal_header.dart';

/*
* 三天对对眼--对眼角模块
* */
class OthersEyeToEyePage extends StatefulWidget {
  OthersEyeToEyePageState createState() => OthersEyeToEyePageState();
}

class OthersEyeToEyePageState extends State<OthersEyeToEyePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
        child: EasyRefresh.custom(
      header: NormalHeader(),
      footer: NormalFooter(),
      slivers: <Widget>[
        //用户列表
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return OthersEyeToeyeItem();
          }, childCount: 10),
        ),
      ],
      onRefresh: () async {
        await Future.delayed(Duration(seconds: 2), () {});
      },
      onLoad: () async {
        await Future.delayed(Duration(seconds: 2), () {
          setState(() {});
        });
      },
    ));
  }
}

/*
* 三天对对眼--对眼角模块--Item
* */
class OthersEyeToeyeItem extends StatefulWidget {
  OthersEyeToeyeItemState createState() => OthersEyeToeyeItemState();
}

class OthersEyeToeyeItemState extends State<OthersEyeToeyeItem> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return IntrinsicHeight(
      child: Container(
        color: Color(0xFFFFFFFF),
        child: Stack(
          children: <Widget>[
            MainColumn(),
            Positioned(
              right: UIAdapter.adapter.width(40),
              top: UIAdapter.adapter.width(80),
              child: new Image.asset(
                MessageIcons.faile,
                height: UIAdapter.adapter.width(100),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column MainColumn() {
    return Column(
      children: <Widget>[
        line(10, 0),
        TopoicHeader(),
        line(1, 20),
        ChatMessage(
          isLeft: true,
          message: "女生出门就是会慢点",
        ),
        ChatMessage(
          isLeft: false,
          message: "我觉得要么是时间观念不行，要么就是绿茶",
        ),
        EyeToEyeHeader(),
      ],
    );
  }

  Container TopoicHeader() {
    return Container(
        height: UIAdapter.adapter.width(100),
        margin: EdgeInsets.only(left: UIAdapter.adapter.width(40)),
        color: Color(0xFFFFFFFF),
        child: Row(
          children: <Widget>[
            new Image.asset(
              MessageIcons.topic,
              height: UIAdapter.adapter.width(40),
            ),
            Container(
                margin: EdgeInsets.only(left: UIAdapter.adapter.width(20)),
                child: Text(
                  "今日话题：你如何看待女生约会迟到？",
                  style: TextStyle(
                      color: Color(0xFF333333),
                      fontWeight: FontWeight.bold,
                      fontSize: UIAdapter.adapter.width(32)),
                ))
          ],
        ));
  }

  Container line(double height, double margin) {
    return Container(
      height: height,
      color: Colours.background_color,
      margin: EdgeInsets.only(bottom: margin),
    );
  }

  /*对对眼头部按钮*/
  Container EyeToEyeHeader() {
    return Container(
      color: Colors.white,
      height: UIAdapter.adapter.width(120),
      child: Row(
        children: <Widget>[
          HeaderColumn(1),
          LineContainer(2),
          HeaderColumn(2),
          LineContainer(2),
          HeaderColumn(3),
        ],
      ),
    );
  }

  Expanded LineContainer(double height) {
    return Expanded(
        child: Container(
      color: Colours.main_color,
      height: height,
      margin: EdgeInsets.only(bottom: UIAdapter.adapter.width(66)),
    ));
  }

  Column HeaderColumn(int index) {
    return Column(
      children: <Widget>[HeaderButton(index), HeaderTextContainer(index)],
    );
  }

  Container HeaderButton(int index) {
    return Container(
        margin: EdgeInsets.fromLTRB(UIAdapter.adapter.width(40), 0,
            UIAdapter.adapter.width(40), UIAdapter.adapter.width(10)),
        child: ClipOval(
          child: Container(
            width: UIAdapter.adapter.width(50),
            height: UIAdapter.adapter.width(50),
            color: Colours.main_color,
            child: Center(
              child: Text(
                "$index",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ));
  }

  Container HeaderTextContainer(int index) {
    return Container(
      child: Text(
        "DAY$index",
        textAlign: TextAlign.center,
        style: TextStyle(color: Colours.main_color),
      ),
    );
  }
}

class ChatMessage extends StatefulWidget {
  final bool isLeft; //true 左边的消息 false 右边的消息
  final String message;
  const ChatMessage({this.isLeft, this.message});

  ChatMessageState createState() => ChatMessageState();
}

class ChatMessageState extends State<ChatMessage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.fromLTRB(UIAdapter.adapter.width(40), 0,
          UIAdapter.adapter.width(40), UIAdapter.adapter.width(40)),
      child: Column(
        children: <Widget>[
          RowContainer(),
          MessageContainer(),
        ],
      ),
    );
  }

  Container RowContainer() {
    return Container(
      child: Row(
          mainAxisAlignment:
              widget.isLeft ? MainAxisAlignment.start : MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: widget.isLeft
              ? [
                  HeaderContainer(),
                  NameAndJobContainer(),
                  AgeContainer(),
                  labelContainer()
                ]
              : [
                  labelContainer(),
                  AgeContainer(),
                  NameAndJobContainer(),
                  HeaderContainer(),
                ]),
    );
  }

  Container HeaderContainer() {
    return Container(
      child: ClipOval(
        child: new Image.asset(
          ImageHelper.wrapAssets("icon_header.jpeg"),
          height: UIAdapter.adapter.width(80),
        ),
      ),
    );
  }

  Container NameAndJobContainer() {
    return Container(
      margin: widget.isLeft
          ? EdgeInsets.only(left: UIAdapter.adapter.width(40))
          : EdgeInsets.only(right: UIAdapter.adapter.width(40)),
      child: Column(
        children: <Widget>[
          new Text(
            "巴扎黑",
            style: TextStyle(
                color: Color(0xFF666666),
                fontSize: UIAdapter.adapter.width(28),
                fontWeight: FontWeight.bold),
          ),
          new Text(
            "策划",
            style: TextStyle(
                color: Color(0xFF666666),
                fontSize: UIAdapter.adapter.width(26)),
          ),
        ],
      ),
    );
  }

  Container AgeContainer() {
    return Container(
      margin: widget.isLeft
          ? EdgeInsets.only(left: UIAdapter.adapter.width(40))
          : EdgeInsets.only(right: UIAdapter.adapter.width(40)),
      color: Colours.main_color,
      child: new ClipOval(
//        borderRadius: BorderRadius.circular(40 / 2),
        child: Container(
          child: Text(
            '25岁',
            style: TextStyle(
              color: Colors.white,
              fontSize: ScreenUtil.getInstance().setWidth(30),
            ),
            textAlign: TextAlign.center,
          ),
          color: Colours.main_color,
          width: ScreenUtil.getInstance().setWidth(100),
        ),
      ),
    );
  }

  Expanded labelContainer() {
    return Expanded(
      child: Container(
        margin: widget.isLeft
            ? EdgeInsets.only(left: ScreenUtil.getInstance().screenWidth / 2.5)
            : EdgeInsets.only(left: 0),
        child: Text(
          "TA说#",
          style: TextStyle(
              color: Color(0xFF333333),
              fontWeight: FontWeight.bold,
              fontSize: UIAdapter.adapter.width(28)),
          textAlign: TextAlign.left,
        ),
      ),
    );
  }

  Container MessageContainer() {
    return Container(
      margin: EdgeInsets.all(UIAdapter.adapter.width(40)),
      child: Container(
        margin: EdgeInsets.all(UIAdapter.adapter.width(40)),
        child: Text(
          widget.message,
          style: TextStyle(
              color: Color(0xFF999999), fontSize: UIAdapter.adapter.width(28)),
          textAlign: TextAlign.left,
        ),
      ),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colours.background_color),
      ),
      constraints: BoxConstraints(
        maxWidth:
            ScreenUtil.getInstance().screenWidth - UIAdapter.adapter.width(80),
      ),
    );
  }
}
