import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chenji_ista_app/utils/header_index.dart';
import 'package:flutter_chenji_ista_app/utils/refresh_normal_header.dart';

import 'story_item.dart';

/*
* 首页脱单故事模块
* */
class HomePageStory extends StatefulWidget {
  HomePageStoryState createState() => HomePageStoryState();
}

class HomePageStoryState extends State<HomePageStory>
    with SingleTickerProviderStateMixin {
  List<int> list = [1];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
          child: Container(
        color: Colors.white,
        child: EasyRefresh.custom(
          header: NormalHeader(),
          footer: NormalFooter(),
          slivers: <Widget>[
            //脱单故事列表
            storyList(),
          ],
          onRefresh: onReFresh(),
          onLoad: onLoad(),
        ),
      )),
    );
  }

  //脱单故事列表
  SliverList storyList() {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return StoryItem();
      }, childCount: list.length),
    );
  }

  /*下拉刷新*/
  Function onReFresh() {
    return () async {
      await Future.delayed(Duration(seconds: 2), () {
        setState(() {
          list = [1, 1, 1];
        });
      });
    };
  }

  /*上拉加载*/
  Function onLoad() {
    return () async {
      await Future.delayed(Duration(seconds: 2), () {
        for (int i = 0; i < 10; i++) {
          list.add(i);
        }
      });
    };
  }
}
