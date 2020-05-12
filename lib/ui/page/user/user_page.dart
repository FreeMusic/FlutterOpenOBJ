import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_chenji_ista_app/config/constant.dart';
import 'package:flutter_chenji_ista_app/res/colors.dart';
import 'package:flutter_chenji_ista_app/ui/page/home/home_page_recommend/recommend_userinfo_dynamic.dart';
import 'package:flutter_chenji_ista_app/ui/page/home/home_page_recommend/recommend_userinfo_photo_album.dart';
import 'package:flutter_chenji_ista_app/ui/page/user/user_info.dart';
import 'package:flutter_chenji_ista_app/ui/page/user/user_setting_page.dart';
import 'package:flutter_chenji_ista_app/ui/test/amap_location_demo.dart';
import 'package:flutter_chenji_ista_app/ui/widget/base_stateful_widget.dart';
import 'package:flutter_chenji_ista_app/utils/header_index.dart';
import 'package:flutter_chenji_ista_app/utils/sp_util.dart';

import 'login_or_register/login_or_register_page.dart';

class UserPage extends BaseWidget {
  @override
  BaseWidgetState<BaseWidget> getState() {
    return _UserPageState();
  }
}

class _UserPageState extends BaseWidgetState<UserPage> {
  List tabs = ["动态", "照片"];

  List user_center_textstr = [
    "会员中心",
    "每日签到",
    "购买礼物",
    "邀请好友",
    "免费权杖",
  ];

  List user_center_imageurl = [
    UserIcons.icon_user_vip_center,
    UserIcons.icon_user_sign_in,
    UserIcons.icon_user_pay,
    UserIcons.icon_user_friend,
    UserIcons.icon_user_wand,
  ];

  bool isVip = false;

  @override
  void onCreate() {}

  @override
  void onDestroy() {}

  @override
  Widget buildWidget(BuildContext context) {
    //因为本路由没有使用Scaffold，为了让子级Widget(如Text)使用
    //Material Design 默认的样式风格,我们使用Material作为本路由的根。
    return new DefaultTabController(
        length: tabs.length,
        child: Scaffold(
          body: new NestedScrollView(
            headerSliverBuilder: (context, bool) {
              return [
                SliverAppBar(
                  expandedHeight: 370.0,
                  floating: true,
                  pinned: true,
                  brightness: Brightness.light,
                  backgroundColor: Colours.white,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Stack(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(
                              left: 20, top: 65 + ScreenUtil.statusBarHeight),
                          width: 65,
                          height: 65,
                          child: new CircleAvatar(
                            backgroundImage: new NetworkImage(
                                "https://timgsa.baidu.com/timg?image&quality=80&size=b10000_10000&sec=1568165672&di=f5ea43bdbb901caf22baa2d8b5385462&src=http://cms-bucket.nosdn.127.net/2018/09/14/6b6ccb3c2cdf48dba8e7b896fef40a6e.jpeg?imageView&thumbnail=550x0"),
                          ),
                        ),
                        FlatButton(
                          child: Container(
                            child: Column(
                              children: <Widget>[
                                Container(
                                  child: Row(
                                    children: <Widget>[
                                      Text(
                                        '聂小琴',
                                        style: TextStyle(
                                            color: Colours.gray_33,
                                            fontSize: ScreenUtil.getInstance()
                                                .setHeight(35)),
                                      ),
                                      Gaps.hGap10,
                                      Container(
                                        child: ImageHelper.iconBase(isVip
                                            ? BaseIcons.icon_user_vip_on
                                            : BaseIcons.icon_user_vip_un),
                                        width: 25,
                                        height: 25,
                                      ),
                                      Expanded(
                                        child: Container(),
                                      ),
                                      IconButton(
                                        onPressed: null,
                                        icon: Icon(Icons.chevron_right),
                                      ),
                                      Gaps.hGap10,
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    '编辑个人资料',
                                    style: TextStyle(
                                        color: Colours.gray_99, fontSize: 14),
                                  ),
                                  alignment: Alignment.topLeft,
                                ),
                              ],
                            ),
                            margin: EdgeInsets.only(
                                left: 100,
                                top: 55 + ScreenUtil.statusBarHeight),
                            height: 80,
                          ),
                          onPressed: () {
                            print("编辑个人信息");
                            if (SpUtil.getBool(Constant.isLogin,
                                defValue: false)) {
                              startAct(UserInfoPage());
                            } else {
                              startAct(OrLoginPage());
                            }
                          },
                        ),

                        Container(
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: isVip
                                  ? Colours.button_color_start
                                  : Colours.app_bg,
                            ),
                            child: Row(
                              children: <Widget>[
                                Gaps.hGap10,
                                Container(
                                  child: ImageHelper.iconBase(isVip
                                      ? BaseIcons.icon_user_vip_on
                                      : BaseIcons.icon_user_vip_un),
                                  width: 25,
                                  height: 25,
                                ),
                                Gaps.hGap10,
                                Expanded(
                                  child: Text(
                                    '2019-12-31到期',
                                    style: TextStyle(
                                        color: Colours.gray_33, fontSize: 13),
                                  ),
                                ),
                                RaisedButton(
                                  child: Text(
                                    isVip ? "续费" : "开通",
                                    style: TextStyle(
                                        color: Colours.white, fontSize: 12),
                                  ),
                                  onPressed: () {
                                    null;
                                  },
                                  padding: EdgeInsets.only(
                                      top: 2, right: 15, left: 15, bottom: 2),
                                  color: Colours.button_color_red,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                ),
                                Gaps.hGap20,
                              ],
                            ),
                          ),
                          margin: EdgeInsets.only(
                              top: 145 + ScreenUtil.statusBarHeight),
                          padding: EdgeInsets.only(
                              left: 20, top: 5, bottom: 5, right: 20),
                          height: 40,
                        ),
//                      权杖、爱心石、访客、解锁
                        Container(
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  child: Column(
                                children: <Widget>[
                                  Gaps.vGap5,
                                  Center(
                                    child: Text(
                                      "Test",
                                      style: TextStyle(
                                          fontSize: 14, color: Colours.gray_33),
                                    ),
                                  ),
                                  Gaps.vGap10,
                                  Center(
                                    child: Text(
                                      "权杖",
                                      style: TextStyle(
                                          fontSize: 12, color: Colours.gray_99),
                                    ),
                                  ),
                                ],
                              )),
                              Expanded(
                                  child: Column(
                                children: <Widget>[
                                  Gaps.vGap5,
                                  Center(
                                    child: Text(
                                      "Test",
                                      style: TextStyle(
                                          fontSize: 14, color: Colours.gray_33),
                                    ),
                                  ),
                                  Gaps.vGap10,
                                  Center(
                                    child: Text(
                                      "爱心石",
                                      style: TextStyle(
                                          fontSize: 12, color: Colours.gray_99),
                                    ),
                                  ),
                                ],
                              )),
                              Expanded(
                                  child: Column(
                                children: <Widget>[
                                  Gaps.vGap5,
                                  Center(
                                    child: Text(
                                      "Test",
                                      style: TextStyle(
                                          fontSize: 14, color: Colours.gray_33),
                                    ),
                                  ),
                                  Gaps.vGap10,
                                  Center(
                                    child: Text(
                                      "访客",
                                      style: TextStyle(
                                          fontSize: 12, color: Colours.gray_99),
                                    ),
                                  ),
                                ],
                              )),
                              Expanded(
                                  child: Column(
                                children: <Widget>[
                                  Gaps.vGap5,
                                  Center(
                                    child: Text(
                                      "Test",
                                      style: TextStyle(
                                          fontSize: 14, color: Colours.gray_33),
                                    ),
                                  ),
                                  Gaps.vGap10,
                                  Center(
                                    child: Text(
                                      "解锁",
                                      style: TextStyle(
                                          fontSize: 12, color: Colours.gray_99),
                                    ),
                                  ),
                                ],
                              )),
                            ],
                          ),
                          margin: EdgeInsets.only(
                              top: 195 + ScreenUtil.statusBarHeight),
//                        padding: EdgeInsets.only(
//                            left: 20, top: 5, bottom: 5, right: 20),
                          height: 55,
                        ),

//                      会员中心，每日签到，购买礼物，邀请好友，免费权杖
                        Container(
                          child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 5, childAspectRatio: 1),
                            itemBuilder: (BuildContext context, int index) {
                              return Stack(
                                children: <Widget>[
                                  new Center(
                                    child: GestureDetector(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Image.asset(
                                            ImageHelper.userAssets(
                                                user_center_imageurl[index]),
                                            width: 35,
                                            height: 35,
                                          ),
                                          Gaps.vGap10,
                                          Text(
                                            user_center_textstr[index],
                                            style: TextStyle(
                                                color: Colours.gray_66,
                                                fontSize: 14),
                                          )
                                        ],
                                      ),
                                      onTap: (){
                                        startAct(AMapLocationDemo());
                                      },
                                    ),
                                  ),
                                ],
                              );
                            },
                            itemCount: user_center_imageurl.length,
                            physics: new NeverScrollableScrollPhysics(),
                          ),
                          margin: EdgeInsets.only(
                              top: 230 + ScreenUtil.statusBarHeight,
                              left: 10,
                              right: 10),
                        ),
                        Container(
                          child: DividerH.divider,
                          margin:
                              EdgeInsets.only(top: 390, left: 20, right: 20),
                        ),
                      ],
                    ),
                  ),
                  actions: <Widget>[
                    IconButton(
                      icon: new Icon(
                        Icons.settings,
                        color: Colours.gray_66,
                      ),
                      onPressed: () {
                        startAct(SettingPage());
                      },
                    )
                  ],
                ),
                SliverPersistentHeader(
                  delegate: new SliverTabBarDelegate(
                    new TabBar(
                      tabs: tabs.map((f) => Tab(text: f)).toList(),
                      indicatorColor: Colors.red,
                      unselectedLabelColor: Colors.black,
                      labelColor: Colors.red,
                      isScrollable: false,
                    ),
                    color: Colors.white,
                  ),
                  pinned: true,
                ),
              ];
            },
            body: TabBarView(
              children: <Widget>[
                //动态
                new RecommendUserDynamic(),
                //相册
                new RecommnedUserPhotoAlnum(),
              ],
            ),
          ),
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
