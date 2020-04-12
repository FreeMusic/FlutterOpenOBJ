import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_chenji_ista_app/res/colors.dart';
import 'package:flutter_chenji_ista_app/ui/page/message/message_eye/message_eye_appointment.dart';
import 'package:flutter_chenji_ista_app/ui/page/message/message_eye/message_eye_ask.dart';
import 'package:flutter_chenji_ista_app/ui/widget/my_app_bar.dart';
import 'package:flutter_chenji_ista_app/utils/header_index.dart';

/*
* 对眼进行中模块
* */
class EyeToEyePage extends StatefulWidget {
  EyeToEyePageState createState() => EyeToEyePageState();
}

class EyeToEyePageState extends State<EyeToEyePage> {
  //滑动控制器
  ScrollController _scrollController;
  //消息输入框
  TextEditingController _textEditingController;
  FocusNode _commentFocus = FocusNode();
  int _index = 1;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _textEditingController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
    _textEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: BrightnessLightBar(),
      backgroundColor: Colours.background_color,
      body: SafeArea(
          child: Column(
        children: <Widget>[
          /*对对眼头部按钮*/
          EyeToEyeHeader(),
          Container(
            color: Colours.background_color,
            height: 10,
          ),
          Expanded(
            flex: 1,
            child: EasyRefresh.custom(
              scrollController: _scrollController,
              slivers: <Widget>[
                //第一天到第二天的对对眼问答
                EyeToEyeAsk(),
              ],
            ),
          ),
//          Expanded(
//            flex: 1,
//            child: TextField(
//              controller: _textEditingController,
//              focusNode: _commentFocus,
//              decoration: InputDecoration(
//                hintText: "123213",
////                  contentPadding:
////                      EdgeInsets.only(left: 10, top: 17, bottom: 17),
//              ),
//            ),
//          ),
        ],
      )),
    );
  }

  /*
  * 第一天到第二天的对对眼问答
  * */
  SliverList EyeToEyeAsk() {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return GestureDetector(
          child: _index == 3 ? EyeAppoingMent() : EyeToEyeAskItem(),
          onTap: () {},
        );
      }, childCount: _index == 3 ? 1 : 3),
    );
  }

  /*对对眼头部按钮*/
  Container EyeToEyeHeader() {
    return Container(
      color: Colors.white,
      height: 60,
      child: Row(
        children: <Widget>[
          HeaderButton(1),
          LineContainer(2),
          HeaderButton(2),
          LineContainer(2),
          HeaderButton(3),
        ],
      ),
    );
  }

  Expanded LineContainer(double height) {
    return Expanded(
        child: Container(
      color: Colours.main_color,
      height: height,
    ));
  }

  Expanded HeaderButton(int index) {
    return Expanded(
        child: FlatButton(
            onPressed: () {
              setState(() {
                _index = index;
              });
            },
            child: Stack(
              children: <Widget>[
                Container(
                  child: Center(
                    child: new Image.asset(
                      index == 1
                          ? MessageIcons.currentIndex
                          : MessageIcons.round,
                      height: index == 1 ? 35 : index == 3 ? 0 : 25,
                    ),
                  ),
                  margin: EdgeInsets.only(bottom: index == 1 ? 0 : 5),
                ),
                Container(
                  child: Center(
                    child: Text(
                      index == 3 ? "见面" : "$index",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: index == 1 ? Colors.white : Color(0xFF666666)),
                    ),
                  ),
                  margin: EdgeInsets.only(bottom: index == 1 ? 8 : 5),
                )
              ],
            )));
  }

  /*
  * 导航栏
  * */
  AppBar BrightnessLightBar() {
    return YQAppBar(
      text: "对眼进行中",
      style: YQAppBarStyle.light,
      context: context,
    );
  }
}
