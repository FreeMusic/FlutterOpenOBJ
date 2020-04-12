import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chenji_ista_app/config/resource_mananger.dart';
import 'package:flutter_chenji_ista_app/res/colors.dart';
import 'package:flutter_chenji_ista_app/ui/page/message/message_eye/make_appointment_alert.dart';

/*
* 约见页面
* */
class EyeAppoingMent extends StatefulWidget {
  EyeAppoingMentState createState() => EyeAppoingMentState();
}

class EyeAppoingMentState extends State<EyeAppoingMent> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return IntrinsicHeight(
      child: Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              TitleHeader(),
              Container(
                height: 1,
                color: Colours.background_color,
              ),
              OtherContainer(0),
              OtherContainer(1),
            ],
          )),
    );
  }

  Container TitleHeader() {
    return Container(
      margin: EdgeInsets.only(top: 15, bottom: 15),
      child: Text(
        "#经过2天的对对眼，是否相约TA见面呢#",
        style: TextStyle(
            color: Color(0xFF333333),
            fontWeight: FontWeight.bold,
            fontSize: 15),
      ),
    );
  }

  Container OtherContainer(int index) {
    return Container(
      margin: EdgeInsets.only(top: 15, bottom: 15, left: 20, right: 20),
      child: Row(
        mainAxisAlignment:
            index == 0 ? MainAxisAlignment.start : MainAxisAlignment.end,
        children: index == 0
            ? [UserHeader(), TextMessage(index)]
            : [
//                ButtonInkWell(0, "接受约见"),
//                ButtonInkWell(1, "拒绝约见"),
                ButtonInkWell(0, "发起约见"),
                UserHeader()
              ],
      ),
    );
  }

  Container UserHeader() {
    return Container(
      child: ClipOval(
        child: new Image.asset(
          ImageHelper.wrapAssets("icon_header.jpeg"),
          height: 40,
        ),
      ),
    );
  }

  Container TextMessage(int index) {
    return Container(
      margin:
          index == 0 ? EdgeInsets.only(left: 20) : EdgeInsets.only(right: 20),
      child: Text("#对方已做出选择",
          style: TextStyle(
              color: Color(0xFF666666),
              fontSize: 15,
              fontWeight: FontWeight.bold)),
    );
  }

  InkWell ButtonInkWell(int index, String title) {
    return InkWell(
      onTap: () {
        if (title == "发起约见") {
          AppointmentAction(context);
        }
      },
      child: Container(
        height: 30.0,
        width: 80.0,
        alignment: Alignment.center,
        margin: EdgeInsets.only(left: 0.0, right: 15.0),
        decoration: BoxDecoration(
            color: index == 1 ? Colors.white : Colours.main_color,
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
            border: Border.all(
                width: index == 0 ? 2 : 0, color: Colours.main_color)),
        child: Text(
          title,
          style: TextStyle(
              color: index == 1 ? Colours.main_color : Colors.white,
              fontSize: 13.0),
        ),
      ),
    );
  }

/*
* 发起约见的点击事件
* */
  void AppointmentAction(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) {
          return AppointmentAlert();
        });
  }
}
