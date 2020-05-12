import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chenji_ista_app/res/colors.dart';

class ChatToolBar extends StatefulWidget {
  TextEditingController textEditingController;
  Function sendMesssage;
  ChatToolBar(this.textEditingController, this.sendMesssage);

  ChatToolBarState createState() =>
      ChatToolBarState(textEditingController, sendMesssage);
}

class ChatToolBarState extends State<ChatToolBar> {
  TextEditingController _textEditingController;
  Function sendMesssage;
  ChatToolBarState(this._textEditingController, this.sendMesssage);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 8.0, bottom: 8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colours.background_color,
            borderRadius: BorderRadius.all(Radius.circular(30.0))),
        child: Row(
          children: <Widget>[
            //聊天输入框
            InputTextFiled(),
            //发送消息的按钮
            SendMessageButton(),
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
      flex: 1,
      child: Container(
        padding: EdgeInsets.all(5.0),
        margin: EdgeInsets.only(left: 15.0, right: 5.0, top: 5.0, bottom: 5.0),
        decoration: BoxDecoration(
            color: Colours.background_color,
            borderRadius: BorderRadius.all(Radius.circular(30.0))),
        child: TextField(
          controller: _textEditingController,
          decoration: InputDecoration(
              border: InputBorder.none, hintText: "好的开场白让你更有机会~"),
          cursorColor: Colours.main_color,
          onSubmitted: (value) {
            if (_textEditingController.text.isNotEmpty) {
              sendMesssage();
              _textEditingController.text = "";
            }
          },
        ),
      ),
    );
  }

//  /*
//  * 匿名按钮
//  * */
//  FlatButton AnonymousButton (){
//    return FlatButton(
//      onPressed: (){},
//      color: Colours.background_color,
//      child: Text(
//        "匿名",
//        style: TextStyle(color: Color(0xFF999999), fontSize: 14),
//      ),
//    );
//  }
  /*
  * 发送消息的按钮
  * */
  InkWell SendMessageButton() {
    return InkWell(
      onTap: () {
        if (_textEditingController.text.isNotEmpty) {
          sendMesssage();
          _textEditingController.text = "";
        }
      },
      child: Container(
        height: 30.0,
        width: 60.0,
        alignment: Alignment.center,
        margin: EdgeInsets.only(left: 5.0, right: 5.0),
        decoration: BoxDecoration(
            color: _textEditingController.text.isEmpty
                ? Colors.grey
                : Colours.main_color,
            borderRadius: BorderRadius.all(Radius.circular(15.0))),
        child: Text(
          "发送",
          style: TextStyle(color: Colors.white, fontSize: 13.0),
        ),
      ),
    );
  }
}
