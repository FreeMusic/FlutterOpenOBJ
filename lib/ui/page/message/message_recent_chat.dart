import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chenji_ista_app/config/resource_mananger.dart';
import 'package:flutter_chenji_ista_app/model/message_model/message_model.dart';
import 'package:flutter_chenji_ista_app/res/colors.dart';
import 'package:flutter_chenji_ista_app/ui/page/message/message_chat/message_chat_page.dart';
import 'package:flutter_chenji_ista_app/utils/flutter_screenutil.dart';
import 'package:flutter_chenji_ista_app/utils/line_util.dart';

/*
* 普通消息的item
* */
class CustomerMessageItem extends StatefulWidget {
  CustomerMessageItem(this.index, this.systemlist);
  final int index;

  final List<SystemMessageModel> systemlist;
  CustomerMessageItemState createState() =>
      CustomerMessageItemState(index, systemlist);
}

class CustomerMessageItemState extends State<CustomerMessageItem> {
  final int index;
  List<SystemMessageModel> list;
  CustomerMessageItemState(this.index, this.list);

  double itemHeight = ScreenUtil.getInstance().setWidth(160);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque, //增大点击区域
      child: Container(
        height: itemHeight,
        child: Stack(
          children: <Widget>[
            /*头像*/
            HeaderImage(),
            /*标题*/
            TitlePositioned(),
            /*内容介绍*/
            ContentPositioned(),
            //最近聊天时间
            TimePositioned(),
            //最近聊天消息数量
            MessageCountPositioned(),
            LineUtil.share().linePositioned(),
          ],
        ),
      ),

      //聊天item的点击事件
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (BuildContext context) {
          return ChatPage();
        }));
      },
    );
  }

  /*头像*/
  Positioned HeaderImage() {
    return Positioned(
      child: ClipOval(
        child: Image.asset(ImageHelper.wrapAssets("icon_header.jpeg")),
      ),
      left: ScreenUtil.getInstance().setWidth(50),
      height: ScreenUtil.getInstance().setWidth(110),
      top: (itemHeight - ScreenUtil.getInstance().setWidth(110)) / 2,
    );
  }

  /*标题*/
  Positioned TitlePositioned() {
    return Positioned(
      child: Text(
        "特朗普",
        style: TextStyle(
            color: Color(0xFF666666),
            fontWeight: FontWeight.bold,
            fontSize: ScreenUtil.getInstance().setWidth(40)),
      ),
      left: ScreenUtil.getInstance().setWidth(220),
      top: ScreenUtil.getInstance().setWidth(20),
    );
  }

  /*内容介绍*/
  Positioned ContentPositioned() {
    return Positioned(
      child: Text(
        "普京，你在吗？",
        style: TextStyle(
            color: Color(0xFF999999),
            fontWeight: FontWeight.normal,
            fontSize: ScreenUtil.getInstance().setWidth(35)),
      ),
      left: ScreenUtil.getInstance().setWidth(220),
      bottom: ScreenUtil.getInstance().setWidth(20),
    );
  }

  /*最近聊天时间*/
  Positioned TimePositioned() {
    return Positioned(
      child: Text(
        "10分钟前",
        style: TextStyle(
            color: Color(0xFF999999),
            fontWeight: FontWeight.normal,
            fontSize: ScreenUtil.getInstance().setWidth(35)),
      ),
      right: ScreenUtil.getInstance().setWidth(40),
      top: ScreenUtil.getInstance().setWidth(20),
    );
  }

  /*最近聊天消息数量*/
  Positioned MessageCountPositioned() {
    return Positioned(
      child: ClipOval(
        child: Container(
          child: Center(
            child: Text(
              "3",
              style: TextStyle(
                  color: Colours.white,
                  fontWeight: FontWeight.normal,
                  fontSize: ScreenUtil.getInstance().setWidth(35)),
            ),
          ),
          color: Colours.main_color,
          height: ScreenUtil.getInstance().setWidth(50),
          width: ScreenUtil.getInstance().setWidth(50),
        ),
      ),
      right: ScreenUtil.getInstance().setWidth(80),
      bottom: ScreenUtil.getInstance().setWidth(20),
    );
  }
}
