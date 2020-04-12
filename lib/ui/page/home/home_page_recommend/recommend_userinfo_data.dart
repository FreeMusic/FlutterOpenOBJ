import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_chenji_ista_app/config/resource_mananger.dart';
import 'package:flutter_chenji_ista_app/utils/flutter_screenutil.dart';
import 'package:flutter_chenji_ista_app/utils/header_index.dart';
import 'package:flutter_chenji_ista_app/utils/line_util.dart';

import 'userinfo_data_answer.dart';

double leftMargin = ScreenUtil.getInstance().setHeight(60);

/*首页 推荐用户 个人详情 资料页面*/
class RecommendUserInfoMeans extends StatefulWidget {
  RecommendUserInfoMeansState createState() => RecommendUserInfoMeansState();
}

class RecommendUserInfoMeansState extends State<RecommendUserInfoMeans> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: ListView(
        children: <Widget>[
          //推荐用户个人基本情况
          RecommendInfoGridleView(),
          //用户的标签和价值观
          RecommendUserLabel(),
          //更多回答模块
          RecommendMoreAnswers(),
          //匿名回答
          AnonymousAnswer(),
          //三天对对眼模块
          EyesToEyes(),
        ],
      ),
      color: Colors.white,
    );
  }
}

/*推荐用户个人基本情况*/
class RecommendInfoGridleView extends StatefulWidget {
  RecommendInfoGridleViewState createState() => RecommendInfoGridleViewState();
}

class RecommendInfoGridleViewState extends State<RecommendInfoGridleView> {
  List<String> dataList = [
    HomeIcons.name,
    HomeIcons.age,
    HomeIcons.height,
    HomeIcons.education,
    HomeIcons.income,
    HomeIcons.company,
    HomeIcons.job,
    HomeIcons.constellation,
    HomeIcons.area,
    HomeIcons.hometown
  ];

  List<String> titles = [
    "聂小倩",
    "25岁",
    ">180cm",
    "硕士",
    ">100万/年",
    "网易",
    "平面模特",
    "射手座",
    "杭州西湖",
    "上海",
  ];

  double itemWidth = ScreenUtil.getInstance().screenWidth / 5;
  double iconWidth = ScreenUtil.getInstance().setWidth(70);
  double itemHeight = ScreenUtil.getInstance().setWidth(350);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Stack(
        children: <Widget>[
          GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5, childAspectRatio: 1.4),
            itemBuilder: (BuildContext context, int index) {
              return UserInfoPositioned(index);
            },
            itemCount: titles.length,
            physics: new NeverScrollableScrollPhysics(),
          ),
          LineUtil.share().linePositioned(),
        ],
      ),
      height: itemHeight,
    );
  }

  Stack UserInfoPositioned(int index) {
    return Stack(
      children: <Widget>[
        Positioned(
          child: new Image.asset(
            ImageHelper.homeAssets(dataList[index]),
          ),
          width: iconWidth,
          left: (itemWidth - iconWidth) / 2,
          top: 0,
        ),
        Positioned(
          child: Text(
            titles[index],
            style: TextStyle(
              color: Color(0xFF666666),
              fontSize: ScreenUtil.getInstance().setSp(25),
            ),
            textAlign: TextAlign.center,
          ),
          width: itemWidth,
          bottom: ScreenUtil.getInstance().setWidth(30),
        ),
      ],
    );
  }
}

/*用户标签信息*/
class RecommendUserLabel extends StatefulWidget {
  RecommendUserLabelState createState() => RecommendUserLabelState();
}

class RecommendUserLabelState extends State<RecommendUserLabel> {
  double userLabelHeight = ScreenUtil.getInstance().setWidth(400);
  double width = (ScreenUtil.getInstance().screenWidth -
          leftMargin * 2 -
          ScreenUtil.getInstance().setWidth(15) * 3) /
      4;

//  TextStyle labelStyle = TextStyle(color: Color(0xFF333333), fontSize: 16);
//  TextStyle valuesStyle = TextStyle(color: Color(0xFF666666), fontSize: 14);
  TextStyle labelStyle;
  TextStyle valuesStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          new Positioned(
            child: new RaisedButton(
              onPressed: () {
                setState(() {
                  labelStyle =
                      TextStyle(color: Color(0xFF333333), fontSize: 16);
                  valuesStyle =
                      TextStyle(color: Color(0xFF666666), fontSize: 14);
                });
              },
              child: Text(
                '标签',
                style: labelStyle,
              ),
              color: Colors.white,
              textTheme: ButtonTextTheme.primary, //按钮的主题
              elevation: 0.0,
            ),
            left: leftMargin,
            top: 0,
          ),
          new Positioned(
            child: new RaisedButton(
              onPressed: () {
                valuesStyle = TextStyle(color: Color(0xFF333333), fontSize: 16);
                labelStyle = TextStyle(color: Color(0xFF666666), fontSize: 14);
              },
              child: Text(
                '价值观',
                style: valuesStyle,
              ),
              color: Colors.white,
              textTheme: ButtonTextTheme.primary, //按钮的主题
              elevation: 0.0,
            ),
            left: leftMargin + ScreenUtil.getInstance().setWidth(200),
            top: 0,
          ),
          new Positioned(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4, childAspectRatio: 2),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.only(
                      bottom: UIAdapter.adapter.width(10), top: UIAdapter.adapter.width(10)),
                  width:
                  ScreenUtil.getInstance().screenWidth - UIAdapter.adapter.width(160),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      border: Border.all(width: 1, color: Colours.background_color)),
                  child: FlatButton(
                    child: Text(
                      "有钱",
                      style: TextStyle(color: Colours.gray_66),
                    ),
                  ),
                );
              },
              itemCount: 6,
              physics: new NeverScrollableScrollPhysics(),
            ),
            height: userLabelHeight * 0.75,
            width: ScreenUtil.getInstance().screenWidth - leftMargin * 2,
            top: userLabelHeight * 0.25,
            left: leftMargin,
          ),
          LineUtil.share().linePositioned(),
        ],
      ),
      height: userLabelHeight,
    );
  }
}
