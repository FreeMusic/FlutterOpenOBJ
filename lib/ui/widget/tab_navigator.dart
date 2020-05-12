import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chenji_ista_app/config/resource_mananger.dart';
import 'package:flutter_chenji_ista_app/res/colors.dart';
import 'package:flutter_chenji_ista_app/res/strings.dart';
import 'package:flutter_chenji_ista_app/res/styles.dart';
import 'package:flutter_chenji_ista_app/ui/page/home/home_page.dart';
import 'package:flutter_chenji_ista_app/ui/page/message/message_page.dart';
import 'package:flutter_chenji_ista_app/ui/page/user/user_page.dart';
import 'package:toast/toast.dart';

//主页面底部 tabView
class TabMainNavigator extends StatefulWidget {
  TabMainNavigator({Key key}) : super(key: key);

  @override
  _TabMainNavigatorState createState() => _TabMainNavigatorState();
}

class _TabMainNavigatorState extends State<TabMainNavigator> {
  var _pageController = PageController();
  int _selectedIndex = 0;
  DateTime _lastPressedAt; // 上次点击时间
//  底部导航页面
  var pages = <Widget>[
    HomePage(), //首页
    MessagePage(), //消息
    UserPage() //个人中心
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: _onBackPressed,
        child: PageView.builder(
          itemBuilder: (ctx, index) => pages[index],
          itemCount: pages.length,
          controller: _pageController,
          physics: NeverScrollableScrollPhysics(),
          onPageChanged: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        unselectedLabelStyle: TextStyle(color: Color(0xFFFE548B)),
        selectedLabelStyle: TextStyle(color: Color(0xFFFE548B)),
        items: <BottomNavigationBarItem>[
          //首页BarItem
          BottomNavigationBarItem(
            icon: Image.asset(
              ImageHelper.tabbarAssets(TabbarIcons.tabbar_home_unselected),
              height: 23,
            ),
            activeIcon: Image.asset(
              ImageHelper.tabbarAssets(TabbarIcons.tabbar_home_selected),
              height: 23,
            ),
            title: Text(
              Ids.tab_main_home,
              style: (_selectedIndex == 0)
                  ? TextStyle(fontSize: 14, color: Colours.button_color_red)
                  : TextStyles.listContent2,
            ),
          ),
          //消息BarItem
          BottomNavigationBarItem(
            icon: Image.asset(
              ImageHelper.tabbarAssets(TabbarIcons.tabbar_message_unselected),
              height: 23,
            ),
            activeIcon: Image.asset(
              ImageHelper.tabbarAssets(TabbarIcons.tabbar_message_selected),
              height: 23,
            ),
            title: Text(Ids.tab_main_message,
                style: (_selectedIndex == 1)
                    ? TextStyle(fontSize: 14, color: Colours.button_color_red)
                    : TextStyles.listContent2),
          ),
          //个人中心BarItem
          BottomNavigationBarItem(
            icon: Image.asset(
              ImageHelper.tabbarAssets(
                  TabbarIcons.tabbar_usercenter_unselected),
              height: 23,
            ),
            activeIcon: Image.asset(
              ImageHelper.tabbarAssets(TabbarIcons.tabbar_usercenter_selected),
              height: 23,
            ),
            title: Text(
              Ids.tab_main_user,
              style: (_selectedIndex == 2)
                  ? TextStyle(fontSize: 14, color: Colours.button_color_red)
                  : TextStyles.listContent2,
            ),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (index) {
          _pageController.jumpToPage(index);
        },
      ),
    );
  }

  /// 监听返回键，点击两下退出程序
  Future<bool> _onBackPressed() async {
    if (_lastPressedAt == null ||
        DateTime.now().difference(_lastPressedAt) > Duration(seconds: 2)) {
      print("点击时间");
      //两次点击间隔超过2秒则重新计时
      _lastPressedAt = DateTime.now();
      Toast.show("再按一次退出", context,
          duration: Toast.LENGTH_SHORT, gravity: Toast.CENTER);
      return false;
    }
    return true;
  }
}
