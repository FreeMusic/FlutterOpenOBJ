import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_chenji_ista_app/ui/page/message/message_chat/message_chat_page.dart';
import 'package:flutter_chenji_ista_app/utils/header_index.dart';
import 'package:flutter_chenji_ista_app/utils/line_util.dart';

/*
推荐页面--用户详情头部
* */
class RecommendUserHeader extends StatefulWidget {
  RecommendUserHeaderState createState() => RecommendUserHeaderState();
}

class RecommendUserHeaderState extends State<RecommendUserHeader> {
  double leftMargin = ScreenUtil.getInstance().setWidth(60);
  double headerHeight = ScreenUtil.getInstance().setWidth(980);
  double pictureHeight = ScreenUtil.getInstance().setWidth(700);
  double contentHeight;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SliverAppBar(
      pinned: true,
      elevation: 0,
      expandedHeight: headerHeight,
      brightness: Brightness.light,
      backgroundColor: Colors.white,
      flexibleSpace: HeaderFlexibleSpaceBar(),
      leading: GestureDetector(
        child: Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
        onTap: () => Navigator.pop(context),
      ),
    );
  }

  FlexibleSpaceBar HeaderFlexibleSpaceBar() {
    return FlexibleSpaceBar(
      background: Container(child: Stack(
        children: <Widget>[
          HeaderContainer(),
          //打招呼按钮
          HelloPositioned(),
        ],
      ),),
    );
  }

  Container HeaderContainer(){
    return Container(
      child: Column(
        children: <Widget>[
          //头部背景图
          HeaderPositioned(),
          NameAndVipContainer(),
          //个人签名
          SignPositoned(),
          InfoContainer(),
          //提示信息
          AlertPositioned(),
          Container(
            color: Colours.background_color,
            height: 1,
            margin: EdgeInsets.only(left: 30, right: 30),
          )
        ],
      ),
    );
  }

  /*头部背景图*/
  Container HeaderPositioned() {
    return new Container(
      //头部背景图
      child: Image.network(
        'http://img1.mukewang.com/5c18cf540001ac8206000338.jpg',
        fit: BoxFit.cover,
      ),
      height: pictureHeight,
      width: ScreenUtil.getInstance().screenWidth,
    );
  }

  Container NameAndVipContainer(){
    return Container(
      child: Row(
        children: <Widget>[
          NamePositioned(),
          isVipPositioned()
        ],
      ),
    );
  }

  /*名字*/
  Container NamePositioned() {
    return new Container(
      margin: EdgeInsets.only(left: ScreenUtil.getInstance().setWidth(80), top: ScreenUtil.getInstance().setWidth(20)),
      
      child: Text(
        '聂小琴',
        style: TextStyle(
            color: Color(0xFF333333),
            fontSize: ScreenUtil.getInstance().setWidth(45),
            fontWeight: FontWeight.bold),
      ),
    );
  }

  /*是否vip图标*/
  Container isVipPositioned() {
    return new Container(
      margin: EdgeInsets.only(left: ScreenUtil.getInstance().setWidth(20), top: ScreenUtil.getInstance().setWidth(20)),
      child: ImageHelper.homeImage(HomeIcons.isVip),
      height: ScreenUtil.getInstance().setWidth(50),
    );
  }

  /*打招呼按钮*/
  Positioned HelloPositioned() {
    return new Positioned(
      child: RoundButton(
        text: "打招呼",
        width: ScreenUtil.getInstance().setWidth(180),
        height: ScreenUtil.getInstance().setWidth(75),
        bgColor: Colours.transparent,
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (BuildContext context) {
            return ChatPage();
          }));
        },
      ),
      right: 30,
      top: pictureHeight+ScreenUtil.getInstance().setWidth(60),
    );
  }

  /*个性签名*/
  Container SignPositoned() {
    return Container(child: Row(children: <Widget>[
      Container(
        margin: EdgeInsets.only(left: ScreenUtil.getInstance().setWidth(80), top: ScreenUtil.getInstance().setWidth(20)),
        child: Text(
          "“系好安全带，坐稳了，准备开车~”",
          style: TextStyle(
              color: Color(0xFF333333),
              fontSize: ScreenUtil.getInstance().setWidth(35),
              fontWeight: FontWeight.bold

          ),
        ),
      )
    ],),);
  }

  Container InfoContainer(){
    return Container(
      margin: EdgeInsets.only(left: ScreenUtil.getInstance().setWidth(80), top: ScreenUtil.getInstance().setWidth(20)),
      child: Row(children: <Widget>[
        AgePositioned(),
        HousePositioned(),
        CarPositioned()
      ],),
    );
  }

  Container AgePositioned() {
    double ageHeight = ScreenUtil.getInstance().setWidth(40);
    return Container(
      child: new ClipRRect(
        borderRadius: BorderRadius.circular(ageHeight / 2),
        child: Container(
          child: Text(
            '25岁',
            style: TextStyle(
              color: Colors.white,
              fontSize: ScreenUtil.getInstance().setWidth(30),
            ),
            textAlign: TextAlign.center,
          ),
          color: Colours.main_color,
          height: ageHeight,
          width: ScreenUtil.getInstance().setWidth(100),
        ),
      ),
    );
  }

  Container HousePositioned() {
    return new Container(
      margin: EdgeInsets.only(left: ScreenUtil.getInstance().setWidth(20)),
      child: Image.asset(
        ImageHelper.homeAssets(HomeIcons.house),
        height: ScreenUtil.getInstance().setWidth(44),
      ),
    );
  }

  Container CarPositioned() {
    return new Container(
      margin: EdgeInsets.only(left: ScreenUtil.getInstance().setWidth(20)),
      child: Image.asset(
        ImageHelper.homeAssets(HomeIcons.car),
        height: ScreenUtil.getInstance().setWidth(44),
      ),
    );
  }

  Container AlertPositioned() {
    return Container(
      margin: EdgeInsets.only(left: ScreenUtil.getInstance().setWidth(80), top: ScreenUtil.getInstance().setWidth(20),bottom: ScreenUtil.getInstance().setWidth(40)),
      child: Row(children: <Widget>[
        Container(
          child: Text(
            '提示：TA经常出没于杭州~~',
            style: TextStyle(
                color: Color(0xFF333333),
                fontSize: ScreenUtil.getInstance().setWidth(32),
              fontWeight: FontWeight.bold
            ),
          ),
        )
      ],),
    );
  }
}
