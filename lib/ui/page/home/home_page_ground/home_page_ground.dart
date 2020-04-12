import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chenji_ista_app/ui/page/home/home_page_ground/ground_ttlist_view.dart';
import 'package:flutter_chenji_ista_app/ui/page/home/home_page_recommend/home_page_recommend_userinfo.dart';
import 'package:flutter_chenji_ista_app/ui/page/home/home_page_recommend/recommend_userinfo_dynamic.dart';

/*
* 首页广场模块
* */
class HomePageGround extends StatefulWidget {
  HomePageGroundState createState() => HomePageGroundState();
}

class HomePageGroundState extends State<HomePageGround> {
  var titles = ["最新", "置顶"];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      length: titles.length,
      child: Scaffold(
        body: new NestedScrollView(
            headerSliverBuilder: (context, bool) {
              return [
                TTlistView(),
                new SliverPersistentHeader(
                  delegate: new SliverTabBarDelegate(
                    new TabBar(
                      tabs: titles.map((f) => Tab(text: f)).toList(),
                      indicatorColor: Colors.white,
                      indicatorSize: TabBarIndicatorSize.label,
                      unselectedLabelColor: Color(0xFF999999),
                      labelColor: Color(0xFF333333),
                    ),
                    color: Colors.white,
                  ),
                  pinned: true,
                ),
              ];
            },
            body: TabBarView(
              children: titles.map((String title) {
                return RecommendUserDynamic();
              }).toList(),
//              physics: new NeverScrollableScrollPhysics(),
            )),
      ),
    );
  }
}
