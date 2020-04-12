import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_chenji_ista_app/ui/page/splash_act.dart';
import 'package:flutter_chenji_ista_app/utils/sp_util.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  runZoned(() {
    /// 强制竖屏
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp])
        .then((_) {
      runApp(MyApp());

      if (Platform.isAndroid) {
        // 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
        SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(statusBarColor: Colors.transparent);
        SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
      }
    });
  }, onError: (Object error, StackTrace stack) {
    print(error);
    print(stack);
  });
}

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);
  @override
  createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    _initAsync();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "是TA",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.blueAccent,
          buttonTheme: new ButtonThemeData(
              minWidth: 0,
              height: 0,
              padding: EdgeInsets.all(0),
              buttonColor: Colors.transparent)),
      home: SplashScreenPage(),
      localizationsDelegates: [
        //此处  字体 国际化
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        const FallbackCupertinoLocalisationsDelegate(), //加入这个, 上面三个是我用来国际化的
      ],
      supportedLocales: [
        //此处
        const Locale('zh', 'CH'),
//        const Locale('en', 'US'),
      ],
    );
  }

  void _initAsync()async {
    await SpUtil.getInstance();

  }
}
// ios 风格 控件 需传这个类
class FallbackCupertinoLocalisationsDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalisationsDelegate();

  @override
  bool isSupported(Locale locale) => true;

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      DefaultCupertinoLocalizations.load(locale);

  @override
  bool shouldReload(FallbackCupertinoLocalisationsDelegate old) => false;
}
