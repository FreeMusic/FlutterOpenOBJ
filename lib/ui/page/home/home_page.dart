import 'package:flutter/material.dart';
import 'package:flutter_chenji_ista_app/config/resource_mananger.dart';
import 'package:flutter_chenji_ista_app/res/colors.dart';
import 'package:flutter_chenji_ista_app/res/strings.dart';
import 'package:flutter_chenji_ista_app/ui/page/home/home_page_recommend/home_page_recommend.dart';
import 'package:flutter_chenji_ista_app/ui/widget/my_app_bar.dart';
import 'package:flutter_chenji_ista_app/utils/line_util.dart';
import 'package:flutter_chenji_ista_app/utils/log_util.dart';

import 'home_page_ground/home_page_ground.dart';
import 'home_page_story/home_page_story.dart';

enum BarActionsStyle { recommend, square, story }

class _Page {
  final String labelId;

  _Page(this.labelId);
}

final List<_Page> _allPages = <_Page>[
  new _Page(Ids.tab_main_home_recommend),
  new _Page(Ids.tab_main_home_square),
  new _Page(Ids.tab_main_home_story),
];

class HomePage extends StatefulWidget {
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  BarActionsStyle style = BarActionsStyle.square;

  @override
  Widget build(BuildContext context) {
    LogUtil.e("MainPagess build......");
    return new DefaultTabController(
        length: _allPages.length,
        child: new Scaffold(
          appBar: BrightnessAppBar(),
          body: new TabBarViewLayout(),
        ));
  }

  MyAppBar BrightnessAppBar() {
    return new MyAppBar(
      brightness: Brightness.light,
      backgroundColor: Colors.white,
      leading: new Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
        ),
      ),
      centerTitle: true,
      title: new TabLayout(),
      actions: <Widget>[
        new IconButton(
            icon: new Image.asset(
              style == BarActionsStyle.recommend
                  ? HomeIcons.search
                  : HomeIcons.bursting,
              height: UIAdapter.adapter.width(50),
            ),
            onPressed: () {})
      ],
    );
  }
}

class TabLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    return Container(
//      child: Row(
//        children: <Widget>[
//          MyTextContainer("推荐"),
//          MyTextContainer("广场"),
//          MyTextContainer("脱单故事")
//        ],
//      ),
//    );
    return new TabBar(
      isScrollable: true,
      labelPadding: EdgeInsets.all(12.0),
      labelColor: Colors.black,
      indicatorSize: TabBarIndicatorSize.label,
      indicatorColor: Colours.main_color,
      tabs: _allPages
          .map((_Page page) => new Tab(
                text: page.labelId,
              ))
          .toList(),
    );
  }

  Container MyTextContainer(String title) {
    return Container(
      margin: EdgeInsets.only(left: UIAdapter.adapter.width(30)),
      child: GestureDetector(
        child: Text(
          title,
          style: TextStyle(
              color: Colours.gray_66, fontSize: UIAdapter.adapter.width(30)),
        ),
      ),
    );
  }
}

class TabBarViewLayout extends StatefulWidget {
  TabBarViewLayoutState createState() => TabBarViewLayoutState();
}

class TabBarViewLayoutState extends State<TabBarViewLayout> {
  Widget buildTabView(BuildContext context, _Page page) {
    String labelId = page.labelId;
    switch (labelId) {
      case Ids.tab_main_home_recommend:
        //首页--推荐
        return HomePageRecommend();
        break;
      case Ids.tab_main_home_square:
        return HomePageGround();
        break;
      case Ids.tab_main_home_story:
        return HomePageStory();
        break;
      default:
        return Container();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    LogUtil.e("TabBarViewLayout build.......");

    return new TabBarView(
        children: _allPages.map((_Page page) {
      return buildTabView(context, page);
    }).toList());
  }
}
