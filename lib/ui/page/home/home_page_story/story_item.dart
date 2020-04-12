import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chenji_ista_app/config/resource_mananger.dart';
import 'package:flutter_chenji_ista_app/res/colors.dart';
import 'package:flutter_chenji_ista_app/utils/flutter_screenutil.dart';

/*
* 脱单故事Item
* */
class StoryItem extends StatefulWidget {
  StoryItemState createState() => StoryItemState();
}

class StoryItemState extends State<StoryItem> {
  double height = ScreenUtil.getInstance().setWidth(800);
  static double leftMargn = ScreenUtil.getInstance().setWidth(60);
  static double allLeft = leftMargn + ScreenUtil.getInstance().setWidth(135);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: height,
      child: Stack(
        children: <Widget>[
          //用户头像
          userHeader(),
          //用户姓名
          userName(),
          //用户年龄
          userAge(),
          //打赏按钮
          exceptionalButton(),
          //对用户的操作（举报或者屏蔽）
          userOptions(),
          //用户的时间以及位置
          userTime(),
          //用户的动态的内容
          userContent(),
          //赞 评论 以及分享
          userCommits(),
        ],
      ),
    );
  }

  /*用户头像*/
  Positioned userHeader() {
    return Positioned(
      child: new ClipOval(
        child: new Image.asset(
          ImageHelper.wrapAssets("icon_header.jpeg"),
          width: ScreenUtil.getInstance().setWidth(110),
        ),
      ),
      left: leftMargn,
      top: ScreenUtil.getInstance().setWidth(40),
    );
  }

  //用户姓名
  Positioned userName() {
    return Positioned(
      child: Text(
        "鲁班",
        style: TextStyle(
            color: Color(0xFF333333),
            fontSize: ScreenUtil.getInstance().setSp(40)),
      ),
      top: ScreenUtil.getInstance().setWidth(40),
      left: allLeft,
    );
  }

  //用户年龄
  Positioned userAge() {
    double ageHeight = ScreenUtil.getInstance().setWidth(40);
    return Positioned(
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
      left: allLeft,
      top: ScreenUtil.getInstance().setWidth(100),
    );
  }

  /*
  * 打赏按钮
  * */
  Positioned exceptionalButton() {
    double exceptionalButtonWidth = ScreenUtil.getInstance().setWidth(50);
    return Positioned(
      child: new ClipOval(
        child: new FlatButton(
            color: Color(0xFFFFE236),
            textColor: Colors.white,
            onPressed: () {
              print('dsdsfdsf');
            },
            child: Text(
              '赏',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: exceptionalButtonWidth * 0.6),
            )),
      ),
      height: exceptionalButtonWidth,
      width: exceptionalButtonWidth,
      left: allLeft + ScreenUtil.getInstance().setWidth(130),
      top: ScreenUtil.getInstance().setWidth(40),
    );
  }

  //对用户的操作（举报或者屏蔽）
  Positioned userOptions() {
    return Positioned(
      child: FlatButton(
        onPressed: () {},
        child: new Image.asset(ImageHelper.homeAssets(HomeIcons.more)),
      ),
      right: leftMargn / 3,
      top: ScreenUtil.getInstance().setWidth(40),
      height: ScreenUtil.getInstance().setWidth(50),
    );
  }

  /*
  * 用户的时间
  * */
  Positioned userTime() {
    return Positioned(
      child: Text(
        '1小时前',
        style: TextStyle(
            color: Color(0xFF999999),
            fontSize: ScreenUtil.getInstance().setWidth(30)),
      ),
      right: ScreenUtil.getInstance().setWidth(150),
      top: ScreenUtil.getInstance().setWidth(40),
    );
  }

  /*
  * 用户的动态的内容
  * */
  Positioned userContent() {
    return Positioned(
      child: Text(
        '这是一条神奇的天路哟，巴扎黑，逮虾户这是一条神奇的天路哟，巴扎黑，逮虾户这是一条神奇的天路哟，巴扎黑，逮虾户这是一条神奇的天路哟，巴扎黑，逮虾户这是一条神奇的天路哟，巴扎黑，逮虾户这是一条神奇的天路哟，巴扎黑，逮虾户这是一条神奇的天路哟，巴扎黑，逮虾户这是一条神奇的天路哟，巴扎黑，逮虾户这是一条神奇的天路哟，巴扎黑，逮虾户这是一条神奇的天路哟，巴扎黑，逮虾户这是一条神奇的天路哟，巴扎黑，逮虾户这是一条神奇的天路哟，巴扎黑，逮虾户这是一条神奇的天路哟，巴扎黑，逮虾户这是一条神奇的天路哟，巴扎黑，逮虾户这是一条神奇的天路哟，巴扎黑，逮虾户',
        style: TextStyle(
            color: Color(0xFF666666),
            fontSize: ScreenUtil.getInstance().setWidth(35)),
        maxLines: 10,
        overflow: TextOverflow.ellipsis,
      ),
      left: allLeft,
      top: ScreenUtil.getInstance().setWidth(170),
      width: ScreenUtil.getInstance().screenWidth - allLeft - leftMargn,
    );
  }

  List<String> titles = [HomeIcons.praise, HomeIcons.share];
  List<Widget> widgets = [];

  /*
  * 赞 以及分享
  * */
  Positioned userCommits() {
    return Positioned(
      child: Container(
        child: Stack(
          children: <Widget>[
            dynamicButton(0),
            dynamicButton(1),
          ],
        ),
      ),
      left: allLeft,
      bottom: ScreenUtil.getInstance().setWidth(5),
      width: ScreenUtil.getInstance().screenWidth / 2,
      height: ScreenUtil.getInstance().setWidth(90),
    );
  }

  /*
  * 生成 赞👍 评论 分享 按钮
  * */
  Positioned dynamicButton(int index) {
    return Positioned(
      child: FlatButton(
          onPressed: () {},
          child: Stack(
            children: <Widget>[
              Positioned(
                child: new Image.asset(
                  titles[index],
                  height: ScreenUtil.getInstance().setWidth(50),
                ),
                left: 0,
                top: ScreenUtil.getInstance().setWidth(10),
              ),
              Positioned(
                child: Text(
                  '10',
                  style: TextStyle(
                      color: Color(0xFF999999),
                      fontSize: ScreenUtil.getInstance().setWidth(32)),
                ),
                left: ScreenUtil.getInstance().setWidth(70),
                top: ScreenUtil.getInstance().setWidth(15),
              )
            ],
          )),
      left: ScreenUtil.getInstance().screenWidth / 6 * index,
      width: ScreenUtil.getInstance().screenWidth / 6,
      bottom: 0,
      height: ScreenUtil.getInstance().setWidth(90),
    );
  }
}
