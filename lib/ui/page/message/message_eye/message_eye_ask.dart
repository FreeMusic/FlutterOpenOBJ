import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chenji_ista_app/config/resource_mananger.dart';
import 'package:flutter_chenji_ista_app/res/colors.dart';
import 'package:flutter_chenji_ista_app/utils/header_index.dart';

/*
* 三天对对眼话题栏目
* */
class EyeToEyeAskItem extends StatefulWidget {
  final Function sendMessage;
  const EyeToEyeAskItem({this.sendMessage});
  EyeToEyeAskItemState createState() => EyeToEyeAskItemState();
}

class EyeToEyeAskItemState extends State<EyeToEyeAskItem> {
  List<Widget> list = [];
  //消息输入框
  TextEditingController _textEditingController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.sendMessage.toString());
    setState(() {
      list = [
        TpoicHeader(),
        line(1),
        AskAnAnswerItem(
          self: false,
          answer: "浙江温州姜娜皮革厂倒闭了",
          sendMessage: widget.sendMessage,
        ),
        AskAnAnswerItem(
          self: true,
          answer: "浙江温州姜娜皮革厂倒闭了浙江温州姜娜皮革厂倒闭了",
        ),
//        AskInputTextFiled(),
        line(10),
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return IntrinsicHeight(
      child: Container(
        color: Colors.white,
        child: Column(
          children: list,
        ),
      ),
    );
  }

  Container line(double height) {
    return Container(
      height: height,
      color: Colours.background_color,
    );
  }

  Container TpoicHeader() {
    return Container(
        height: 50,
        margin: EdgeInsets.only(left: 20),
        child: Row(
          children: <Widget>[
            new Image.asset(
              MessageIcons.topic,
              height: 20,
            ),
            Container(
                margin: EdgeInsets.only(left: 10),
                child: Text(
                  "今日话题1：你如何看待女生约会迟到？",
                  style: TextStyle(
                      color: Color(0xFF333333),
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ))
          ],
        ));
  }
}

/*
* 问答聊天部分
* */
class AskAnAnswerItem extends StatefulWidget {
  final bool self;
  final String answer;
  final Function sendMessage;
  const AskAnAnswerItem({this.self, this.answer, this.sendMessage});

  AskAnAnswerItemState createState() => AskAnAnswerItemState();
}

class AskAnAnswerItemState extends State<AskAnAnswerItem> {
  //消息输入框
  TextEditingController _textEditingController;
  bool interface;
  FocusNode _commentFocus = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _textEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(bottom: 15, top: 15, left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment:
                widget.self ? MainAxisAlignment.end : MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
                widget.self ? [Message(), Header()] : [Header(), Message()],
          ),
          Container(
            height: widget.self ? 0 : 20,
            margin: EdgeInsets.only(left: 50),
            child: FlatButton(
              child: Text(
                "追问",
                style: TextStyle(color: Colours.main_color),
              ),
              onPressed: () {
                print("追问````");
                widget.sendMessage;
                print(widget.sendMessage.toString());
              },
            ),
          ),
        ],
      ),
    );
  }

  Container Header() {
    return Container(
      child: ClipOval(
        child: new Image.asset(
          ImageHelper.wrapAssets("icon_header.jpeg"),
          height: 40,
        ),
      ),
    );
  }

  Container Message() {
    return Container(
      child: MessageText(),
      margin:
          widget.self ? EdgeInsets.only(right: 20) : EdgeInsets.only(left: 20),
    );
  }

  Container MessageText() {
    return Container(
      constraints: BoxConstraints(
        maxWidth: ScreenUtil.getInstance().screenWidth * 0.65,
      ),
      margin: EdgeInsets.only(top: 10),
      child: Text(
        widget.answer,
        style: TextStyle(
            color: Color(0xFF666666),
            fontSize: 15,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}

class AskInputTextFiled extends StatefulWidget {
  InputTextFiledState createState() => InputTextFiledState();
}

class InputTextFiledState extends State<AskInputTextFiled> {
  //消息输入框
  TextEditingController _textEditingController;
  bool interface;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _textEditingController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _textEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.white,
      height: 80,
      child: Container(
        margin: EdgeInsets.only(right: 20, left: 20, bottom: 20),
        child: Row(
          children: <Widget>[
            //聊天输入框
            InputTextFiled(),
            //发送消息的按钮
            SendMessageButton(),
            Container(
              margin: EdgeInsets.only(left: 15),
              child: ClipOval(
                child: new Image.asset(
                  ImageHelper.wrapAssets("icon_header.jpeg"),
                  height: 40,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  /*
  * 聊天输入框
  * */
  Expanded InputTextFiled() {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(3.0)),
            border: Border.all(width: 1, color: Colours.background_color)),
        child: TextField(
          controller: _textEditingController,
          enableInteractiveSelection: interface,
          decoration: InputDecoration(
              border: InputBorder.none, hintText: "快和TA交换你的想法吧~"),
          cursorColor: Colours.main_color,
          onSubmitted: (value) {
            if (_textEditingController.text.isNotEmpty) {
              setState(() {
                interface = false;
              });
            }
          },
        ),
      ),
    );
  }

  /*
  * 发送消息的按钮
  * */
  InkWell SendMessageButton() {
    return InkWell(
      onTap: () {
        if (_textEditingController.text.isNotEmpty) {
//          _textEditingController.text = "";
        }
      },
      child: Container(
        width: 70,
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: _textEditingController.text.isEmpty
              ? Colours.background_color
              : Colours.main_color,
        ),
        child: Text(
          "完成",
          style: TextStyle(
              color: _textEditingController.text.isEmpty
                  ? Color(0xFF666666)
                  : Colours.white,
              fontSize: 13.0),
        ),
      ),
    );
  }
}
