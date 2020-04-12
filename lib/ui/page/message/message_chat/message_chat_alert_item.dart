/*
* 聊天中提示消息的item
* */
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_chenji_ista_app/config/resource_mananger.dart';
import 'package:flutter_chenji_ista_app/res/colors.dart';
import 'package:flutter_chenji_ista_app/ui/page/message/message_chat/message_chat_page.dart';

class AlertMessageItem extends StatelessWidget {
  AlertMessageEntity model;
  AlertMessageItem(this.model);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.fromLTRB(50, 10, 50, 10),
      decoration: BoxDecoration(
        color: Color(0xFFEDEDED),
        borderRadius: BorderRadius.all(Radius.circular(
          20.0,
        )),
      ),
      child: Text(
        model.alert,
        style: TextStyle(
          color: Color(0xFF666666),
          fontSize: 12,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

/*
* 索要微信提示框
* */
class WeChatMessageItem extends StatefulWidget {
  final Function refusedAction;
  final Function agreeAction;
  final WeChatMessageEntity entity;
  WeChatMessageItem({this.refusedAction, this.agreeAction, this.entity});

  WeChatMessageItemState createState() =>
      WeChatMessageItemState(this.refusedAction, this.agreeAction, this.entity);
}

class WeChatMessageItemState extends State<WeChatMessageItem> {
  Function refusedAction;
  Function agreeAction;
  WeChatMessageEntity entity;
  WeChatMessageItemState(this.refusedAction, this.agreeAction, this.entity);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.fromLTRB(50, 10, 50, 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(
            4.0,
          )),
          border: Border.all(width: 1, color: Color(0x80DADADA))),
      child: Column(
        children: <Widget>[
          //标题容器
          TitleContainer(),
          Container(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            height: 0.5,
            color: Color(0xFFDADADA),
          ),
          //拒绝同意按钮Row分布
          ButtonsRow(),
        ],
      ),
    );
  }

  /*
  * 标题容器
  * */
  Container TitleContainer() {
    return Container(
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
      child: Text(
        "对方想要看到你的微信",
        style: TextStyle(color: Color(0xFF333333)),
      ),
    );
  }

  /*
  * 拒绝同意按钮Row分布
  * */
  Row ButtonsRow() {
    return Row(
      children: <Widget>[
        Expanded(
          child: new FlatButton(
              onPressed: refusedAction,
              child: Text(
                "拒绝",
                style: TextStyle(color: Color(0xFF999999), fontSize: 14),
              )),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
          width: 1,
          color: Color(0xFFDADADA),
        ),
        Expanded(
          child: new FlatButton(
              onPressed: agreeAction,
              child: Text("同意",
                  style: TextStyle(color: Color(0xFF333333), fontSize: 14))),
        )
      ],
    );
  }
}

class RecommendSelfItem extends StatelessWidget {
  final Function refusedAction;
  final Function agreeAction;
  final ReCommendSelfEntity entity;
  RecommendSelfItem({this.refusedAction, this.agreeAction, this.entity});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.fromLTRB(50, 10, 50, 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(
            4.0,
          )),
          border: Border.all(width: 1, color: Color(0x80DADADA))),
      child: Column(
        children: <Widget>[
          //头像容器
          UserHeaderContainer(),
          //标题容器
          TitleContainer(),
          Container(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            height: 0.5,
            color: Color(0xFFDADADA),
          ),
          //拒绝同意按钮Row分布
          ButtonsRow(),
        ],
      ),
    );
  }

  /*
  * 头像容器
  * */
  Container UserHeaderContainer() {
    return Container(
        child: ClipOval(
      child: new Image.asset(
        ImageHelper.wrapAssets("icon_header.jpeg"),
        height: 60,
      ),
    ));
  }

  /*
  * 标题容器
  * */
  Container TitleContainer() {
    return Container(
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
      child: Text(
        "对方向你推荐了自己",
        style: TextStyle(color: Color(0xFF333333)),
      ),
    );
  }

  /*
  * 拒绝同意按钮Row分布
  * */
  Row ButtonsRow() {
    return Row(
      children: <Widget>[
        Expanded(
          child: new FlatButton(
              onPressed: refusedAction,
              child: Text(
                "忽略",
                style: TextStyle(color: Color(0xFF999999), fontSize: 14),
              )),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
          width: 1,
          color: Color(0xFFDADADA),
        ),
        Expanded(
          child: new FlatButton(
              onPressed: agreeAction,
              child: Text("去看看",
                  style: TextStyle(color: Color(0xFF333333), fontSize: 14))),
        )
      ],
    );
  }
}

class ExamineMessageItem extends StatelessWidget {
  final key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.fromLTRB(50, 10, 50, 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(
            4.0,
          )),
          border: Border.all(width: 1, color: Color(0x80DADADA))),
      child: Column(
        children: <Widget>[
          //标题容器
          TitleContainer(),
          //ExamineContainer()
          ExamineContainer(),
        ],
      ),
    );
  }

  /*
  * 标题容器
  * */
  Container TitleContainer() {
    return Container(
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
      child: Text(
        "对方已同意你的查看申请",
        style: TextStyle(color: Color(0xFF333333)),
      ),
    );
  }

  Container ExamineContainer() {
    return Container(
//      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.fromLTRB(30, 0, 30, 10),
      decoration: BoxDecoration(
        color: Color(0xFFEDEDED),
        borderRadius: BorderRadius.all(Radius.circular(
          100.0,
        )),
      ),
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 15.0),
            child: Text(
              "微信：",
              style: (TextStyle(color: Color(0xFF666666), fontSize: 13)),
            ),
          ),
          Expanded(
            child: Container(
              child: Text(
                "12343534",
                style: (TextStyle(color: Colours.main_color, fontSize: 13)),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 15.0),
            child: FlatButton(
              child: Text(
                "复制",
                style: TextStyle(color: Colours.main_color, fontSize: 14),
              ),
              onPressed: () {
                Clipboard.setData(ClipboardData(text: "12343534"));
              },
            ),
          ),
        ],
      ),
    );
  }
}
