import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_chenji_ista_app/config/resource_mananger.dart';
import 'package:flutter_chenji_ista_app/ui/page/message/message_chat/message_chat_page.dart';
import 'package:flutter_chenji_ista_app/utils/base_dialog.dart';
import 'package:flutter_chenji_ista_app/utils/flutter_screenutil.dart';

/*
* 展示ChatMoreToolsView的页面跳转类型
* */
enum ShowChatMoreToolsStyle {
  chat, //聊天页面的
  dynamic //动态页面的
}

class ChatMoreToolsView extends StatelessWidget {
  final ShowChatMoreToolsStyle style;
  final Function sendFunction;
  final ChatPage page;

  const ChatMoreToolsView({Key key, this.style, this.sendFunction, this.page})
      : super(key: key);

  _dismissDialog(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    return WillPopScope(
      child: GestureDetector(
        onTap: () => _dismissDialog(context),
        child: Material(
          type: MaterialType.transparency,
          child: Container(
            margin: EdgeInsets.only(
                bottom: 10, top: ScreenUtil.getInstance().screenHeight - 160),
            decoration: BoxDecoration(
                color: Color(0xFFFFFFFF),
                borderRadius: BorderRadius.circular(12.0)),
            child: ChatMoreToolsViewRow(context),
          ),
        ),
      ),
    );
  }

  Row ChatMoreToolsViewRow(BuildContext context) {
    return Row(
      children: <Widget>[
        ChatMoreToolsGesture(0, context),
        ChatMoreToolsGesture(1, context),
      ],
    );
  }

  Expanded ChatMoreToolsGesture(int index, BuildContext context) {
    List<String> titles = ["举报", "屏蔽"];
    List<String> images = [HomeIcons.report, HomeIcons.shield];
    return Expanded(
      child: GestureDetector(
        child: Container(
          margin: EdgeInsets.only(top: 10, bottom: 5),
          child: Column(
            children: <Widget>[
              new Image.asset(
                images[index],
                height: 30,
              ),
              Text(titles[index])
            ],
          ),
        ),
        onTap: () {
          tapAction(index, context);
        },
      ),
    );
  }

  void tapAction(int index, BuildContext context) {
    if (this.style == ShowChatMoreToolsStyle.chat) {
      if (index == 0) {
        _dismissDialog(context);
        print("聊天页面的举报用户");
        //聊天页面的举报用户
        reportUser(context);
      } else if (index == 1) {
        _dismissDialog(context);
        print("聊天页面的屏蔽用户");
        sendFunction();
      }
    } else if (this.style == ShowChatMoreToolsStyle.dynamic) {}
  }

  void reportUser(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) {
          return BaseDialog(
            title: "举报用户",
            content: ReportContainer(),
            height: 240,
          );
        });
  }

  Container ReportContainer() {
    return Container(
      child: Column(
        children: <Widget>[ReportReson(), CredentialsContainer()],
      ),
    );
  }

  Container ReportReson() {
    return Container(
      margin: EdgeInsets.only(left: 15, top: 10),
      child: Row(
        children: <Widget>[
          Text(
            "举报原因",
            style: TextStyle(
                color: Color(0xFF666666),
                fontWeight: FontWeight.bold,
                fontSize: 15),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 15, right: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  border: Border.all(width: 1, color: Color(0xFFDADADA))),
              child: FlatButton(
                onPressed: () {
                  print("选择举报原因");
                },
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Text("不遵守平台规范",
                          style: TextStyle(
                              color: Color(0xFF666666),
                              fontWeight: FontWeight.bold,
                              fontSize: 14)),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Container CredentialsContainer() {
    return Container(
        margin: EdgeInsets.only(left: 15, right: 20, top: 10, bottom: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "举报凭证",
              style: TextStyle(
                  color: Color(0xFF666666),
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 15, right: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    border: Border.all(width: 1, color: Color(0xFFDADADA))),
                child: GestureDetector(
                  onTap: () {
                    print("选择举报原因");
                  },
                  child: Container(
                      margin: EdgeInsets.only(left: 10),
                      height: 60,
                      child: Text("+上传凭证",
                          style: TextStyle(
                              color: Color(0xFF666666),
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                          textAlign: TextAlign.center)),
                ),
              ),
            )
          ],
        ));
  }
}
