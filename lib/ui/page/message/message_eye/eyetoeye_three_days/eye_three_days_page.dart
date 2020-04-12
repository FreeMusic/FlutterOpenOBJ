import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chenji_ista_app/res/colors.dart';
import 'package:flutter_chenji_ista_app/ui/page/home/home_page_recommend/home_page_recommend_userinfo.dart';
import 'package:flutter_chenji_ista_app/ui/page/message/message_eye/eyetoeye_three_days/my_eyetoeye_page.dart';
import 'package:flutter_chenji_ista_app/ui/page/message/message_eye/eyetoeye_three_days/others_eyetoeye_page.dart';
import 'package:flutter_chenji_ista_app/ui/widget/my_app_bar.dart';

/*
* 三天对对眼列表
* */
class EyeToEyeThreeDaysPage extends StatefulWidget {
  EyeToEyeThreeDaysPageState createState() => EyeToEyeThreeDaysPageState();
}

class EyeToEyeThreeDaysPageState extends State<EyeToEyeThreeDaysPage> {
  var tabTitle = [
    '对眼角',
    '我的对眼',
  ];

  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
        length: tabTitle.length,
        child: Scaffold(
          appBar: BrightnessLightBar(),
          body: new NestedScrollView(
              headerSliverBuilder: (context, bool) {
                return [
                  new SliverPersistentHeader(
                    delegate: new SliverTabBarDelegate(
                      new TabBar(
                        tabs: tabTitle.map((f) => Tab(text: f)).toList(),
                        indicatorColor: Colours.main_color,
                        indicatorSize: TabBarIndicatorSize.label,
                        unselectedLabelColor: Colors.black,
                        labelColor: Colours.main_color,
                      ),
                      color: Colors.white,
                    ),
                    pinned: true,
                  ),
                ];
              },
              body: TabBarView(
                children: <Widget>[
                  //对眼角
                  new OthersEyeToEyePage(),
                  //我得对对眼
                  new MyEyeToEyePage(),
                ],
              )),
        ));
  }

  /*
  * 导航栏
  * */
  AppBar BrightnessLightBar() {
    return YQAppBar(
      text: "三天对对眼",
      style: YQAppBarStyle.light,
      context: context,
    );
  }
}
