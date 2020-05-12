import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_chenji_ista_app/config/resource_mananger.dart';
import 'package:flutter_chenji_ista_app/res/colors.dart';
import 'package:flutter_chenji_ista_app/ui/page/message/message_eye/message_eye_result.dart';
import 'package:flutter_chenji_ista_app/utils/flutter_screenutil.dart';
import 'package:flutter_chenji_ista_app/utils/line_util.dart';

/*
* 发起约见的弹窗
* */
class AppointmentAlert extends StatefulWidget {
  AppointmentAlertState createState() => AppointmentAlertState();
}

class AppointmentAlertState extends State<AppointmentAlert> {
  double width =
      ScreenUtil.getInstance().screenWidth - UIAdapter.adapter.width(100);
  List<AppointmentModel> list = [
    AppointmentModel("3天体验", "9.9", "19.9"),
    AppointmentModel("一个月", "199.9", "399.9"),
    AppointmentModel("连续包月", "129.9", "399.9"),
  ];
  int _selectIndex = 2;

  _confirmDialog() {
    _dismissDialog();
  }

  _dismissDialog() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WillPopScope(
        child: GestureDetector(
          onTap: () => _dismissDialog(),
          child: Material(
            type: MaterialType.transparency,
            child: Center(
              child: IntrinsicHeight(
                  child: Container(
                width: width,
                child: ContentColumn(),
                decoration: BoxDecoration(
                    color: Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.circular(6.0)),
              )),
            ),
          ),
        ),
        onWillPop: () async {
          return true;
        });
  }

  Column ContentColumn() {
    return Column(
      children: <Widget>[
        TitleContainer(),
        HeaderLoveHeaderRow(),
        ReChargeContainer(),
        VipContainer(),
        GoToVipContainer(),
        SpendOnContainer()
      ],
    );
  }

  Container TitleContainer() {
    return Container(
      margin: EdgeInsets.only(top: UIAdapter.adapter.width(50)),
      child: Text(
        "发起约见",
        style: TextStyle(
            color: Color(0xFF333333),
            fontSize: UIAdapter.adapter.width(40),
            fontWeight: FontWeight.bold),
      ),
    );
  }

  Container HeaderLoveHeaderRow() {
    double imageHeight = (width - UIAdapter.adapter.width(60)) / 3;
    return Container(
      margin: EdgeInsets.only(
          left: UIAdapter.adapter.width(100),
          right: UIAdapter.adapter.width(100),
          top: UIAdapter.adapter.width(70)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ClipOval(
            child: Image.asset(
              ImageHelper.wrapAssets("icon_header.jpeg"),
              width: imageHeight * 0.5,
            ),
          ),
          Image.asset(
            MessageIcons.sendlove,
            width: imageHeight,
          ),
          ClipOval(
            child: Image.asset(
              ImageHelper.wrapAssets("icon_header.jpeg"),
              width: imageHeight * 0.5,
            ),
          ),
        ],
      ),
    );
  }

  Container ReChargeContainer() {
    return Container(
      margin: EdgeInsets.only(top: UIAdapter.adapter.width(50)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ReChargeContainerItem(0),
          ReChargeContainerItem(1),
          ReChargeContainerItem(2),
        ],
      ),
    );
  }

  GestureDetector ReChargeContainerItem(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectIndex = index;
        });
      },
      child: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(
                left: index != 0 ? UIAdapter.adapter.width(30) : 0,
                top: UIAdapter.adapter.width(30)),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3.0),
                color: _selectIndex == index ? Color(0x1AFE548B) : Colors.white,
                border: Border.all(
                    width: 1,
                    color: _selectIndex == index
                        ? Colours.main_color
                        : Colours.background_color)),
            child: Column(
              children: <Widget>[
                ItemTitleContainer(index),
                ActualAmountContainer(index),
                AmountContainer(index)
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              left: index == 0 ? 0 : UIAdapter.adapter.width(30),
              top: UIAdapter.adapter.width(15),
            ),
            decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.all(Radius.circular(index == 0 ? 20 : 3)),
                color: index == 0 ? Colours.main_color : Color(0xFF7A2BFD)),
            child: index == 1 ? null : TextContainer(index),
          )
        ],
      ),
    );
  }

  Container TextContainer(int index) {
    return Container(
      margin: EdgeInsets.fromLTRB(
          UIAdapter.adapter.width(10),
          UIAdapter.adapter.width(5),
          UIAdapter.adapter.width(10),
          UIAdapter.adapter.width(5)),
      child: Text(
        index == 0 ? "每人仅限1次" : "推荐",
        style: TextStyle(
            color: Colors.white, fontSize: UIAdapter.adapter.width(22)),
      ),
    );
  }

  Container ItemTitleContainer(int index) {
    return Container(
      margin: EdgeInsets.fromLTRB(
          UIAdapter.adapter.width(30),
          UIAdapter.adapter.width(30),
          UIAdapter.adapter.width(30),
          UIAdapter.adapter.width(30)),
      child: Text(
        list[index].title,
        style: TextStyle(
            color: Colours.gray_66,
            fontWeight: FontWeight.bold,
            fontSize: UIAdapter.adapter.width(30)),
      ),
    );
  }

  Container ActualAmountContainer(int index) {
    return Container(
      margin: EdgeInsets.only(bottom: UIAdapter.adapter.width(30)),
      child: Row(
        children: <Widget>[
          Text(
            "￥",
            style: TextStyle(
                color: Colours.main_color,
                fontWeight: FontWeight.bold,
                fontSize: UIAdapter.adapter.width(30)),
          ),
          Text(
            list[index].actualAmount,
            style: TextStyle(
                color: Colours.main_color,
                fontWeight: FontWeight.bold,
                fontSize: UIAdapter.adapter.width(50)),
          )
        ],
      ),
    );
  }

  Container AmountContainer(int index) {
    return Container(
      margin: EdgeInsets.only(bottom: UIAdapter.adapter.width(30)),
      child: Text(
        "￥" + list[index].amount,
        style: TextStyle(
            decoration: TextDecoration.lineThrough,
            color: Colours.gray_99,
            fontWeight: FontWeight.bold,
            fontSize: UIAdapter.adapter.width(26)),
      ),
    );
  }

  Container VipContainer() {
    return Container(
      child: FlatButton(
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Image.asset(
                MessageIcons.round,
                height: UIAdapter.adapter.width(30),
              ),
              Container(
                child: Text(
                  "开通会员立省20元，连续包月更优惠",
                  style: TextStyle(
                      color: Colours.gray_66,
                      fontSize: UIAdapter.adapter.width(30)),
                ),
                margin: EdgeInsets.only(left: UIAdapter.adapter.width(30)),
              )
            ],
          )),
    );
  }

  Container GoToVipContainer() {
    return Container(
      width:
          ScreenUtil.getInstance().screenWidth - UIAdapter.adapter.width(160),
      decoration: BoxDecoration(
          gradient: const LinearGradient(
              colors: [Color(0xFFFEB48D), Color(0xFFFB64AD)]),
          borderRadius: BorderRadius.all(Radius.circular(50))),
      child: FlatButton(
        child: Text(
          "开通会员免费约见",
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {},
      ),
    );
  }

  Container SpendOnContainer() {
    return Container(
      margin: EdgeInsets.only(
          top: UIAdapter.adapter.width(25),
          bottom: UIAdapter.adapter.width(25)),
      width:
          ScreenUtil.getInstance().screenWidth - UIAdapter.adapter.width(160),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(50)),
          border: Border.all(width: 1, color: Colours.main_color)),
      child: FlatButton(
        child: Text(
          "非会员花费2爱心石约见",
          style: TextStyle(color: Colours.main_color),
        ),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (BuildContext context) {
            return AppointMentResult();
          }));
        },
      ),
    );
  }
}

class AppointmentModel {
  String title;
  String actualAmount;
  String amount;

  AppointmentModel(this.title, this.actualAmount, this.amount);
}
