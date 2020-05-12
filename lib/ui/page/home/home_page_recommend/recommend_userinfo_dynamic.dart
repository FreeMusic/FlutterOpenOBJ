/*
* 推荐用户 详情  动态页面
* */
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_chenji_ista_app/ui/page/home/home_page_recommend/userinfo_dynamic_item.dart';
import 'package:flutter_chenji_ista_app/utils/refresh_normal_header.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class RecommendUserDynamic extends StatefulWidget {
  RecommendUserDynamicState createState() => RecommendUserDynamicState();
}

class RecommendUserDynamicState extends State<RecommendUserDynamic> {
  List<int> list = [1];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: EasyRefresh.custom(
        header: NormalHeader(),
        footer: NormalFooter(),
        slivers: <Widget>[
          //动态列表
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return UserDynamicItem();
            }, childCount: list.length),
          ),
        ],
        onRefresh: () async {
          await Future.delayed(Duration(seconds: 2), () {
            setState(() {
              list = [1, 11, 1, 1, 1, 1, 1];
            });
          });
        },
        onLoad: () async {
          await Future.delayed(Duration(seconds: 2), () {
            setState(() {
              for (int i = 0; i < 10; i++) {
                list.add(i);
              }
            });
          });
        },
      ),
    );
  }
}
