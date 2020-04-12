import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chenji_ista_app/utils/flutter_screenutil.dart';
import 'package:flutter_chenji_ista_app/utils/log_util.dart';
import 'package:flutter_chenji_ista_app/utils/route_util.dart';
import 'package:toast/toast.dart';

import 'base_function.dart';

///
/// <pre>
///     author : Wp
///     e-mail : 1101313414@qq.com
///     time   : 2019/8/6 4:17 PM
///     desc   :
///     version: 1.0
/// </pre>
///
abstract class BaseWidget extends StatefulWidget {
  BaseWidgetState baseWidgetState;

  @override
  BaseWidgetState createState() {
    baseWidgetState = getState();
    return baseWidgetState;
  }

  BaseWidgetState getState();

  String getStateName() {
    return baseWidgetState.getClassName();
  }
}

abstract class BaseWidgetState<T extends BaseWidget> extends State<T>
    with BaseFunction {
  ///取消网络请求
  CancelToken cancelToken;

  ///进度条是否显示
  bool isShowLoading = false;

  ///进度条是否可关闭
  bool isLoadingCanClose = false;

  ///页面是否存活
  bool isLiveActivity = false;

  ///更新页面状态
  State state;

  ///屏幕适配工具
  ScreenUtil screenUtil = ScreenUtil.getInstance();

  @override
  void initState() {
    isLiveActivity = true;
    state = this;
    cancelToken = new CancelToken();
    onCreate();
    super.initState();
  }

  @override
  void dispose() {
    onDestroy();
    isLiveActivity = false;
//    cancelToken.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Stack(
        children: <Widget>[
          buildWidget(context),
          loadingWidget(isShowLoading, screenUtil),
        ],
      ),
    );
  }

  ///页面创建
  void onCreate();

  ///页面销毁
  void onDestroy();

  ///返回UI控件 相当于setContentView()
  Widget buildWidget(BuildContext context);

  ///网络请求 - post
  netPost(String url, Map<String, dynamic> params) {
//    return NetUtils.post(url, params, cancelToken);
  }

  ///显示加载提示框
  void showLoading({bool isLoadingClose = false}) {
    if (null != state && isLiveActivity) {
      state.setState(() {
        isShowLoading = true;
        isLoadingCanClose = isLoadingClose;
      });
    }
  }

  ///隐藏加载提示框
  void hideLoading() {
    if (null != state && isLiveActivity) {
      state.setState(() {
        isShowLoading = false;
      });
    }
  }

  ///跳转页面 动画左右 可接受返回参数 不关闭当前页面
  startAct(Widget routePage) {
    return startActivity(context, routePage);
  }

  ///跳转页面 动画左右 关闭当前页面
  startActFinish(Widget routePage) {
    startActivityFinish(context, routePage);
  }


  ///吐司
  void showToast(String text) {
    Toast.show(text, context, gravity: Toast.CENTER);
  }
/*
  ///吐司 位置控制
  void showToastGravity(String text, int gravity) {
    Toast.show(text, context, gravity: gravity);
  }*/

  ///获取页面名称 - 用于设置tag
  String getClassName() {
    if (context == null) {
      return null;
    }
    String className = context.toString();
    if (className == null) {
      return null;
    }
    className = className.substring(0, className.indexOf("("));
    return className;
  }

  /// 监听返回键
  Future<bool> _onBackPressed() async {
    if (isShowLoading && isLiveActivity) {
      ///点击返回键可关闭loading框
      if (isLoadingCanClose) {
        state.setState(() {
          isShowLoading = false;
        });
      }
      return false;
    }
    return true;
  }
}

class ShowUitls {
//  底部弹框
  static void showSnackBar(BuildContext context, String msg) {
    Scaffold.of(context).showSnackBar(
      SnackBar(content: Text("$msg")),
    );
  }

// 弹出toast
  static void showToastCenter(BuildContext context, String msg) {
    Toast.show(msg, context,
        duration: Toast.LENGTH_SHORT, gravity: Toast.CENTER);
  }

//自定义Toast位置
  static void showToastGravity(BuildContext context, String msg, int gravity) {
    Toast.show(msg, context, duration: Toast.LENGTH_SHORT, gravity: gravity);
  }

}
