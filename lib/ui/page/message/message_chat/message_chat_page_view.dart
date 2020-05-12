import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_chenji_ista_app/config/resource_mananger.dart';
import 'package:flutter_chenji_ista_app/ui/page/message/message_chat/message_chat_page.dart';
import 'package:flutter_chenji_ista_app/utils/flutter_screenutil.dart';

/*
* 聊天页面 每条消息的每个item
* */
class ChatContentItem extends StatelessWidget {
  final MessageEntity entity;
  const ChatContentItem({this.entity});

  @override
  Widget build(BuildContext context) {
    if (entity == null || entity.own == null) {
      return Container();
    }

    return Container(
      margin: EdgeInsets.all(
        10.0,
      ),
      child: Row(
        mainAxisAlignment:
            entity.own ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: entity.own
            ? [ChatContent(), UserHeader()]
            : [UserHeader(), ChatContent()],
      ),
    );
  }

  /*
  * 用户头像以及聊天内容
  * */
  Column ChatContent() {
    return Column(
      crossAxisAlignment:
          entity.own ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          entity.name,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 13.0,
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            top: 5.0,
          ),
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: entity.own ? Color(0xFFFF832B) : Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(
              4.0,
            )),
          ),
          constraints: BoxConstraints(
            maxWidth: ScreenUtil.getInstance().screenWidth * 0.65,
          ),
          child: Text(
            entity.message ?? '',
            overflow: TextOverflow.clip,
            style: TextStyle(
                fontSize: 16.0,
                color: entity.own ? Colors.white : Color(0xFF666666)),
          ),
        )
      ],
    );
  }

  /*
  * 用户头像
  * */
  Card UserHeader() {
    return Card(
      margin: entity.own
          ? EdgeInsets.only(left: 10.0)
          : EdgeInsets.only(right: 10.0),
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      elevation: 0.0,
      child: Container(
        height: 40.0,
        width: 40.0,
        child: Image.asset(ImageHelper.wrapAssets("icon_header.jpeg")),
      ),
    );
  }
}
