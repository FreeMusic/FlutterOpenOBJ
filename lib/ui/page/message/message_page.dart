import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chenji_ista_app/config/resource_mananger.dart';
import 'package:flutter_chenji_ista_app/model/message_model/message_model.dart';
import 'package:flutter_chenji_ista_app/ui/page/message/message_page_banner.dart';
import 'package:flutter_chenji_ista_app/ui/page/message/message_page_content_view.dart';
import 'package:flutter_chenji_ista_app/ui/page/message/message_recent_chat.dart';
import 'package:flutter_chenji_ista_app/ui/widget/my_app_bar.dart';
import 'package:flutter_chenji_ista_app/utils/flutter_screenutil.dart';

/*
* 消息中心模块
* */
class MessagePage extends StatefulWidget {
  MessagePageState createState() => MessagePageState();
}

class MessagePageState extends State<MessagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: <Widget>[
          //轮播图
          BannerList(),
          //通知和匿名提问
          notifiAndAsk(),
          //聊天消息
          chatMessage(),
        ],
      ),
    );
  }

  //AppBar
  MyAppBar MainAppBar() {
    return MyAppBar(
      brightness: Brightness.light,
      title: Text(
        '消息中心',
        style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: ScreenUtil.getInstance().setWidth(50)),
      ),
      backgroundColor: Colors.white,
    );
  }

  /*轮播图*/
  SliverList BannerList() {
    return SliverList(
      //轮播图
      delegate: SliverChildListDelegate([
        MessagePageBanner(),
        GuideAndQuestion(),
      ]),
    );
  }

  /*通知和匿名提问*/
  SliverList notifiAndAsk() {
    List<SystemMessageModel> systemlist = [
      SystemMessageModel(MessageIcons.notifi, "通知", "平台消息通知"),
      SystemMessageModel(MessageIcons.ask, "匿名提问", "匿名提问消息通知"),
    ];
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return SystemMessageItem(index, systemlist);
      }, childCount: systemlist.length),
    );
  }

  /*聊天消息*/
  SliverList chatMessage() {
    List<SystemMessageModel> systemlist = [
      SystemMessageModel(MessageIcons.notifi, "通知", "平台消息通知"),
      SystemMessageModel(MessageIcons.ask, "匿名提问", "匿名提问消息通知"),
    ];
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return CustomerMessageItem(index, systemlist);
      }, childCount: 10),
    );
  }
}
