import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chenji_ista_app/utils/header_index.dart';
import 'package:flutter_chenji_ista_app/utils/refresh_normal_header.dart';

import 'home_page_recommend_view.dart';

/*首页---推荐页面*/
class HomePageRecommend extends StatefulWidget {
  const HomePageRecommend({Key key, this.labelId}) : super(key: key);
  final String labelId;

  HomePageRecommendState createState() => HomePageRecommendState();
}

class HomePageRecommendState extends State<HomePageRecommend>
    with AutomaticKeepAliveClientMixin {
  List<int> list = [1, 11, 1, 1, 1, 1, 1];

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: EasyRefresh.custom(
        header: NormalHeader(),
        footer: NormalFooter(),
        slivers: <Widget>[
          SliverList(
            //轮播图
            delegate: SliverChildListDelegate([
              HomePageRecommendBanner(),
            ]),
          ),
          //筛选按钮
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return HomePageRecommendFilter();
            }, childCount: 1),
          ),
          //用户列表
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return HomeRecommedItem();
            }, childCount: list.length),
          ),
        ],
        onRefresh: () async {
          await Future.delayed(Duration(seconds: 2), () {
            setState(() {});
          });
        },
        onLoad: () async {
          await Future.delayed(Duration(seconds: 2), () {
            setState(() {});
          });
        },
      )),
    );
  }
}
