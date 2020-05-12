import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'colors.dart';
import 'dimens.dart';

class TextStyles {
  static TextStyle listTitle = TextStyle(
    fontSize: Dimens.font_sp16,
    color: Colours.gray_33,
    fontWeight: FontWeight.bold,
  );
  static TextStyle listTitle2 = TextStyle(
    fontSize: Dimens.font_sp16,
    color: Colours.gray_33,
  );
  static TextStyle listContent = TextStyle(
    fontSize: Dimens.font_sp14,
    color: Colours.gray_66,
  );
  static TextStyle listContent2 = TextStyle(
    fontSize: Dimens.font_sp14,
    color: Colours.gray_99,
  );
  static TextStyle listExtra = TextStyle(
    fontSize: Dimens.font_sp12,
    color: Colours.gray_99,
  );
  static TextStyle listExtra2 = TextStyle(
    fontSize: Dimens.font_sp12,
    color: Colours.gray_66,
  );
  static const TextStyle appTitle = TextStyle(
    fontSize: Dimens.font_sp18,
    color: Colours.gray_33,
  );
}

//渐变
class Decorations {
  static double circleDp;

  static Decoration bottom = BoxDecoration(
      border: Border(bottom: BorderSide(width: 0.33, color: Colours.divider)));

  static LinearGradient gradient_anamorphism = LinearGradient(
      colors: <Color>[Colours.button_color_start, Colours.button_color_end]);

  static BoxDecoration boxdecoration_anamorphism = BoxDecoration(
    borderRadius: BorderRadius.circular(circleDp),
    gradient: Decorations.gradient_anamorphism,
  );
}

/// 间隔
class Gaps {
  /// 水平间隔
  static Widget hGap5 = new SizedBox(width: Dimens.gap_dp5);
  static Widget hGap10 = new SizedBox(width: Dimens.gap_dp10);
  static Widget hGap15 = new SizedBox(width: Dimens.gap_dp15);
  static Widget hGap20 = new SizedBox(width: Dimens.gap_dp20);
  static Widget hGap30 = new SizedBox(width: Dimens.gap_dp30);
  static Widget hGap40 = new SizedBox(width: Dimens.gap_dp40);
  static Widget hGap50 = new SizedBox(width: Dimens.gap_dp50);

  /// 垂直间隔
  static Widget vGap5 = new SizedBox(height: Dimens.gap_dp5);
  static Widget vGap10 = new SizedBox(height: Dimens.gap_dp10);
  static Widget vGap15 = new SizedBox(height: Dimens.gap_dp15);
  static Widget vGap20 = new SizedBox(height: Dimens.gap_dp20);
  static Widget vGap25 = new SizedBox(height: Dimens.gap_dp25);
  static Widget vGap30 = new SizedBox(height: Dimens.gap_dp30);
  static Widget vGap40 = new SizedBox(height: Dimens.gap_dp40);
  static Widget vGap50 = new SizedBox(height: Dimens.gap_dp50);

  static Widget getHGap(double w) {
    return SizedBox(width: w);
  }

  static Widget getBarGap(double h) {
    return SizedBox(height: h);
  }
}

// divider
class DividerH {
  static Widget divider = new Container(
    color: Colours.divider,
    height: 1.0,
  );
  static Widget divider_left20 = new Container(
    color: Colours.divider,
    height: 1.0,
    margin: EdgeInsets.only(left: 20),
  );
}
