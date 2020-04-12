import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_chenji_ista_app/ui/page/message/message_chat/message_chat_alert_item.dart';
import 'package:flutter_chenji_ista_app/ui/page/message/message_chat/message_chat_header_item.dart';
import 'package:flutter_chenji_ista_app/ui/page/message/message_chat/message_chat_moretools.dart';
import 'package:flutter_chenji_ista_app/ui/page/message/message_chat/message_chat_page_view.dart';
import 'package:flutter_chenji_ista_app/ui/page/message/message_chat/message_chat_toolbar.dart';
import 'package:flutter_chenji_ista_app/ui/widget/my_app_bar.dart';
import 'package:flutter_chenji_ista_app/utils/header_index.dart';
import 'package:flutter_chenji_ista_app/utils/refresh_normal_header.dart';

/*
* 用户聊天页面
* */
class ChatPage extends StatefulWidget {
  ChatPageState createState() => ChatPageState();
}

class ChatPageState extends State<ChatPage> {
  //消息列表
  List _messagelist;
  //消息输入框
  TextEditingController _textEditingController;
  //滑动控制器
  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _messagelist = [
      ExamineMessageEntity("普京"),
      ReCommendSelfEntity("普京"),
      WeChatMessageEntity("普京", true),
      AlertMessageEntity("对方向您赠送了一个大地瓜"),
      MessageEntity(true, "你好，普京", "特朗普"),
      MessageEntity(false, "你好，特朗普", "普京"),
    ];
    _textEditingController = TextEditingController();
    _textEditingController.addListener(() {
      setState(() {});
    });
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    super.dispose();
    _textEditingController.dispose();
    _scrollController.dispose();
  }

  /*
  * 发送消息
  * */
  void sendMessage(Object model) {
    setState(() {
      _messagelist.insert(0, model);
    });
    _scrollController.animateTo(0.0,
        duration: Duration(milliseconds: 300), curve: Curves.linear);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: BrightnessLightBar(),
      backgroundColor: Colours.background_color,
      body: SafeArea(
        child: ChatContent(),
      ),
    );
  }

  /*
  * 导航栏
  * */
  AppBar BrightnessLightBar() {
    return YQAppBar(
      text: "普京",
      style: YQAppBarStyle.light,
      context: context,
      action: <Widget>[
        new IconButton(
            icon: new Image.asset(
              ImageHelper.homeAssets(HomeIcons.more),
              height: ScreenUtil.getInstance().setWidth(55),
            ),
            onPressed: userOption())
      ],
    );
  }

  /*
  * 聊天模块
  * */
  Column ChatContent() {
    return Column(
      children: <Widget>[
        Divider(
          height: 0.5,
        ),
        //聊天页面头部信息
        ChatHeader((int index) {
          if (index == 0) {
            //推荐了自己
            sendMessage(AlertMessageEntity("您向对方推荐了自己"));
          } else if (index == 1) {
            //邀请对方对对眼
            sendMessage(AlertMessageEntity("您已邀请对方参加对对眼"));
          } else if (index == 2) {
            //赠送爱心
            sendMessage(AlertMessageEntity("您向对方赠送了10点爱心"));
          } else if (index == 3) {
            //索要微信
            sendMessage(AlertMessageEntity("您已发起了索要对方微信的请求"));
          }
        }),
        //消息体
        MessageContent(),
        //聊天输入框以及发送按钮封装
        ChatToolBar(_textEditingController, () {
          sendMessage(MessageEntity(true, _textEditingController.text, "特朗普"));
        }),
      ],
    );
  }

  /*
  * 消息体
  * */
  Expanded MessageContent() {
    return Expanded(
      flex: 1,
      child: EasyRefresh.custom(
        scrollController: _scrollController,
        reverse: true,
        //下拉刷新的自动以动画
        footer: ChatFooter(),
        slivers: <Widget>[
          MessageSliverList(),
        ],
        onLoad: loadMore(),
      ),
    );
  }

  SliverList MessageSliverList() {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        Object model = _messagelist[index];
        if (model.runtimeType.toString() == "MessageEntity") {
          //正常聊天消息体的每一个item
          return ChatContentItem(
            entity: model,
          );
        } else if (model.runtimeType.toString() == "AlertMessageEntity") {
          //提示消息
          return AlertMessageItem(model);
        } else if (model.runtimeType.toString() == "WeChatMessageEntity") {
          WeChatMessageEntity entity = _messagelist[index];
          //索要微信提示消息
          return WeChatMessageItem(
            refusedAction: () {
              if (entity.interaction) {
                sendMessage(AlertMessageEntity("你已拒绝对方看到您的微信"));
                entity.interaction = false;
              }
            },
            agreeAction: () {
              if (entity.interaction) {
                entity.interaction = false;
                sendMessage(AlertMessageEntity("你已同意对方看到您的微信"));
              }
            },
          );
        } else if (model.runtimeType.toString() == "ReCommendSelfEntity") {
          //对方向你推荐了自己的消息
          return RecommendSelfItem(
            refusedAction: () {
              setState(() {
                _messagelist.remove(model);
              });
            },
            agreeAction: () {},
          );
        } else if (model.runtimeType.toString() == "ExamineMessageEntity") {
          //对方已同意你的微信查看申请
          return ExamineMessageItem();
        }
      }, childCount: _messagelist.length),
    );
  }

  /*
  * 加载更多消息
  * */
  Function loadMore() {
    return () async {
      await Future.delayed(Duration(seconds: 2), () {
        setState(() {
          _messagelist.addAll([
            MessageEntity(true, "我是特朗普", "特朗普"),
            MessageEntity(false, "我是普京", "普京"),
          ]);
        });
      });
    };
  }

  Function userOption() {
    return () {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (_) {
            return ChatMoreToolsView(
              style: ShowChatMoreToolsStyle.chat,
              sendFunction: () {
                sendMessage(AlertMessageEntity("已屏蔽对方，你将无法收到对方任何信息"));
              },
            );
          });
    };
  }
}

class MessageEntity {
  bool own;
  String message;
  String name;

  MessageEntity(this.own, this.message, this.name);
}

class AlertMessageEntity {
  String alert;

  AlertMessageEntity(this.alert);
}

class WeChatMessageEntity {
  String name;
  bool interaction;

  WeChatMessageEntity(this.name, this.interaction);
}

class ReCommendSelfEntity {
  String name;

  ReCommendSelfEntity(this.name);
}

class ExamineMessageEntity {
  String name;

  ExamineMessageEntity(this.name);
}
