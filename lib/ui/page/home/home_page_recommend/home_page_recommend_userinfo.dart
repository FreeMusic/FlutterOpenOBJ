import 'package:flutter/material.dart';
import 'package:flutter_chenji_ista_app/ui/page/home/home_page_recommend/recommend_userinfo_dynamic.dart';
import 'package:flutter_chenji_ista_app/ui/page/home/home_page_recommend/recommend_userinfo_view.dart';

import 'recommend_userinfo_data.dart';
import 'recommend_userinfo_photo_album.dart';

const url =
    'http://www.pptbz.com/pptpic/UploadFiles_6909/201203/2012031220134655.jpg';

class HomeUserInfoPage extends StatefulWidget {
  @override
  HomeUserInfoPageState createState() => HomeUserInfoPageState();
}

class HomeUserInfoPageState extends State<HomeUserInfoPage> {
  var tabTitle = [
    '资料',
    '动态23',
    '相册23',
  ];

  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
        length: tabTitle.length,
        child: Scaffold(
          body: new NestedScrollView(
              headerSliverBuilder: (context, bool) {
                return [
                  RecommendUserHeader(),
                  new SliverPersistentHeader(
                    delegate: new SliverTabBarDelegate(
                      new TabBar(
                        tabs: tabTitle.map((f) => Tab(text: f)).toList(),
                        indicatorColor: Colors.red,
                        indicatorSize: TabBarIndicatorSize.label,
                        unselectedLabelColor: Colors.black,
                        labelColor: Colors.red,
                      ),
                      color: Colors.white,
                    ),
                    pinned: true,
                  ),
                ];
              },
              body: TabBarView(
                children: <Widget>[
                  //资料
                  new RecommendUserInfoMeans(),
                  //动态
                  new RecommendUserDynamic(),
                  //相册
                  new RecommnedUserPhotoAlnum(),
                ],
              )),
        ));
  }
}

class SliverTabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar widget;
  final Color color;

  const SliverTabBarDelegate(this.widget, {this.color})
      : assert(widget != null);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      child: widget,
      color: color,
    );
  }

  @override
  bool shouldRebuild(SliverTabBarDelegate oldDelegate) {
    return false;
  }

  @override
  double get maxExtent => widget.preferredSize.height;

  @override
  double get minExtent => widget.preferredSize.height;
}
