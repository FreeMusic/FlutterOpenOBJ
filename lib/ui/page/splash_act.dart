import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_chenji_ista_app/ui/widget/tab_navigator.dart';
import 'package:flutter_chenji_ista_app/utils/flutter_screenutil.dart';
import 'package:flutter_chenji_ista_app/utils/route_util.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreenPage extends StatefulWidget {
  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
    checkFirstSeen(context);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ///屏幕适配方案 默认 width : 1080px , height:1920px , allowFontScaling:false
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    return Scaffold(
      body: Text(""),
    );
  }

  Future checkFirstSeen(context) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    bool _seen = sp.getBool("first_open") ?? false;
    bool isLogin = sp.getBool("isLogin") ?? false;
//    timer = new Timer(const Duration(milliseconds: 1500), () {
//      pushAndRemovePage(context, TestPage());
//      print("-------------spalsh-------------");
//    });
    pushAndRemovePage(context, TabMainNavigator());
    print("-------------spalsh-------------");
  }
}
