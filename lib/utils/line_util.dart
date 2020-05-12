import 'package:flutter/cupertino.dart';
import 'package:flutter_chenji_ista_app/utils/flutter_screenutil.dart';

class LineUtil {
  static LineUtil _util = new LineUtil();

  static LineUtil share() {
    return _util;
  }

  Positioned linePositioned() {
    return Positioned(
      child: Container(
        color: Color(0xFFDADADA),
      ),
      left: ScreenUtil.getInstance().setWidth(50),
      right: ScreenUtil.getInstance().setWidth(50),
      bottom: ScreenUtil.getInstance().setWidth(0),
      height: 0.5,
    );
  }
}

class UIAdapter {
  static UIAdapter adapter = new UIAdapter();

  double width(double _width) {
    return ScreenUtil.getInstance().setWidth(_width) * 1.25;
  }

  double height(double _height) {
    return ScreenUtil.getInstance().setWidth(_height) * 1.25;
  }
}
