import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_chenji_ista_app/config/resource_mananger.dart';
import 'package:flutter_chenji_ista_app/res/colors.dart';
import 'package:flutter_chenji_ista_app/ui/page/message/message_eye/message_eye_page.dart';
import 'package:flutter_chenji_ista_app/utils/base_dialog.dart';
import 'package:flutter_chenji_ista_app/utils/flutter_screenutil.dart';
import 'package:flutter_chenji_ista_app/utils/header_index.dart';

/*
* 聊天页面头部悬浮GridView
* */
class ChatHeader extends StatelessWidget {
  Function sendMessage;
  ChatHeader(this.sendMessage);

  List<String> dataList = [
    MessageIcons.recommend,
    MessageIcons.eye,
    MessageIcons.give,
    MessageIcons.wechat
  ];

  List<String> titles = [
    "推荐",
    "对眼",
    "赠送",
    "微信",
  ];

  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: ScreenUtil.getInstance().setWidth(200),
      color: Colors.white,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4, childAspectRatio: 1),
        itemBuilder: (BuildContext context, int index) {
          return gridItem(index, context);
        },
        itemCount: titles.length,
        physics: new NeverScrollableScrollPhysics(),
      ),
    );
  }

  GestureDetector gridItem(int index, BuildContext context) {
    double margin = ScreenUtil.getInstance().setWidth(30);
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.only(top: margin, bottom: margin),
        child: Column(
          children: <Widget>[
            new Image.asset(
              dataList[index],
              height: ScreenUtil.getInstance().setWidth(80),
            ),
            Text(titles[index])
          ],
        ),
      ),
      onTap: () {
        if (index == 0) {
          //推荐
          sendMessage(index);
        } else if (index == 1) {
//          sendMessage(index);
          //对对眼
//          ShowEyeToEyeInvitation(context);
          Navigator.push(context, CustomRoute(EyeToEyePage()));
        } else {
          ShowDialog(context, index);
        }
      },
    );
  }

  void ShowDialog(BuildContext context, int index) {
    var title = (index == 2) ? "赠送爱心石给对方" : "获赠对方微信";
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) {
          return BaseDialog(
            title: title,
            content: (index == 2) ? LoveContainer() : WeChatContainer(),
            isCancel: true,
            confirmTextColor: Colors.red[400],
            confirmCallback: () {
              sendMessage(index);
            },
          );
        });
  }

  void ShowEyeToEyeInvitation(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) {
          return BaseDialog(
            content: Container(
              margin: EdgeInsets.only(bottom: 20),
              child: Column(
                children: <Widget>[
                  ClipOval(
                    child: new Image.asset(
                      ImageHelper.wrapAssets("icon_header.jpeg"),
                      height: 60,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 5, top: 5),
                    child: Text(
                      "聂小倩",
                      style: TextStyle(
                          color: Color(0xFF333333),
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 5, top: 20),
                    child: Text(
                      "对方邀请你参加三天对对眼",
                      style: TextStyle(
                          color: Color(0xFF333333),
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
            cancle: "拒绝",
            confirmContent: "接受",
            confirmTextColor: Color(0xFF333333),
            isCancel: true,
            height: 230,
            confirmCallback: () {},
          );
        });
  }

  Container LoveContainer() {
    return Container(
      margin: EdgeInsets.fromLTRB(30, 30, 30, 30),
      child: Row(
        children: <Widget>[
          Text(
            "爱心石",
            style: TextStyle(
                color: Color(0xFF666666),
                fontSize: 17,
                fontWeight: FontWeight.bold),
          ),
          Expanded(
            flex: 1,
            child: Container(
              margin: EdgeInsets.only(left: 15.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                border: Border.all(width: 1, color: Color(0x80DADADA)),
              ),
              child: Container(
                margin: EdgeInsets.only(left: 15.0),
                child: TextField(
                  controller: _textEditingController,
                  decoration:
                      InputDecoration(border: InputBorder.none, hintText: ""),
                  cursorColor: Colours.main_color,
                  onSubmitted: (value) {},
                  inputFormatters: [
                    WhitelistingTextInputFormatter(RegExp("[0-9]")),
                    LengthLimitingTextInputFormatter(5), //输入最大长度
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Container WeChatContainer() {
    return Container(
      margin: EdgeInsets.fromLTRB(15, 30, 15, 30),
      child: Row(
        children: <Widget>[
          ChooseExpanded("会员免费交换", 1000),
          ChooseExpanded("使用一枚爱心石", 1001),
        ],
      ),
    );
  }

  Expanded ChooseExpanded(String title, int index) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(left: 15.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            border: Border.all(width: 1, color: Colours.main_color)),
        child: FlatButton(
            onPressed: () {
              print(index);
            },
            child: Text(
              title,
              style: TextStyle(
                  color: Colours.main_color,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            )),
      ),
    );
  }
}
