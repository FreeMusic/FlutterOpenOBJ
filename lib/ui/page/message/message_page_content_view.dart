import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chenji_ista_app/model/message_model/message_model.dart';
import 'package:flutter_chenji_ista_app/utils/flutter_screenutil.dart';
import 'package:flutter_chenji_ista_app/utils/header_index.dart';
import 'package:flutter_chenji_ista_app/utils/line_util.dart';

class GuideAndQuestion extends StatelessWidget {
  double height = ScreenUtil.getInstance().setWidth(180);
  double grideViewHeight = ScreenUtil.getInstance().setWidth(140);
  double itemWidth = ScreenUtil.getInstance().screenWidth / 2;

  List<String> titles = ["新手指南", "常见问题"];
  List<String> images = [MessageIcons.guide, MessageIcons.questions];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: height,
      child: Stack(
        children: <Widget>[
          GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: itemWidth / 2 / grideViewHeight),
            itemBuilder: (context, index) {
              return GuideAndQuestionItem(index);
            },
            itemCount: images.length,
            physics: new NeverScrollableScrollPhysics(),
          ),
          GrayPositioned()
        ],
      ),
    );
  }

  Container GuideAndQuestionItem(int index) {
    double imageWidth = ScreenUtil.getInstance().setWidth(80);
    return Container(
      child: Stack(
        children: <Widget>[
          new Positioned(
            child: new Image.asset(images[index]),
            width: imageWidth,
            left: ScreenUtil.getInstance().setWidth(130),
            top: (grideViewHeight - imageWidth) / 2,
          ),
          new Positioned(
            child: Text(
              titles[index],
              style: TextStyle(
                  color: Color(0xFF666666),
                  fontSize: ScreenUtil.getInstance().setWidth(35),
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            right: ScreenUtil.getInstance().setWidth(130),
            top: (grideViewHeight - ScreenUtil.getInstance().setWidth(35)) / 2,
          )
        ],
      ),
      height: grideViewHeight,
    );
  }

  Positioned GrayPositioned() {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      height: height - grideViewHeight,
      child: Container(
        color: Colours.background_color,
      ),
    );
  }
}

/*
* 通知消息的item
* */
class SystemMessageItem extends StatefulWidget {
  SystemMessageItem(this.index, this.systemlist);
  final int index;

  final List<SystemMessageModel> systemlist;
  SystemMessageItemState createState() =>
      SystemMessageItemState(index, systemlist);
}

class SystemMessageItemState extends State<SystemMessageItem> {
  final int index;
  List<SystemMessageModel> list;
  SystemMessageItemState(this.index, this.list);

  double itemHeight = ScreenUtil.getInstance().setWidth(160);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: itemHeight,
      child: Stack(
        children: <Widget>[
          /*头像*/
          HeaderImage(),
          /*标题*/
          TitlePositioned(),
          /*内容介绍*/
          ContentPositioned(),
          LeftArrow(),
          //linePainter
          LineUtil.share().linePositioned(),
        ],
      ),
    );
  }

  /*头像*/
  Positioned HeaderImage() {
    return Positioned(
      child: ClipOval(
        child: Image.asset(list[index].imageName),
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
        list[index].title,
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
        list[index].content,
        style: TextStyle(
            color: Color(0xFF999999),
            fontWeight: FontWeight.normal,
            fontSize: ScreenUtil.getInstance().setWidth(35)),
      ),
      left: ScreenUtil.getInstance().setWidth(220),
      bottom: ScreenUtil.getInstance().setWidth(20),
    );
  }

  Positioned LeftArrow() {
    return Positioned(
      child: ClipOval(
        child: Icon(Icons.arrow_forward_ios),
      ),
      right: ScreenUtil.getInstance().setWidth(30),
      height: ScreenUtil.getInstance().setWidth(110),
      top: (itemHeight - ScreenUtil.getInstance().setWidth(110)) / 2,
    );
  }
}
