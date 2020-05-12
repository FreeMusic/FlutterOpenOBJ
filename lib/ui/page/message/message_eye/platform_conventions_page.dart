import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chenji_ista_app/res/colors.dart';
import 'package:flutter_chenji_ista_app/ui/widget/my_app_bar.dart';
import 'package:flutter_chenji_ista_app/utils/line_util.dart';

class PlatformConventionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colours.white,
      appBar: BrightnessLightBar(context),
      body: SafeArea(
          child: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                height: UIAdapter.adapter.width(40),
                color: Colours.background_color,
              ),
              TextIntrinsicHeight(),
            ]),
          )
        ],
      )),
    );
  }

  IntrinsicHeight TextIntrinsicHeight() {
    return IntrinsicHeight(
        child: Container(
      margin: EdgeInsets.fromLTRB(
          UIAdapter.adapter.width(40),
          UIAdapter.adapter.width(20),
          UIAdapter.adapter.width(40),
          UIAdapter.adapter.width(40)),
      child: Text(
          "TextIntrinsicHeightTextIntrinsicHeightTextIntrinsicHeightTextIntrinsicHeightTextIntrinsicHeightTextIntrinsicHeightTextIntrinsicHeightTextIntrinsicHeightTextIntrinsicHeightTextIntrinsicHeightTextIntrinsicHeightTextIntrinsicHeightTextIntrinsicHeightTextIntrinsicHeightTextIntrinsicHeightTextIntrinsicHeightTextIntrinsicHeightTextIntrinsicHeightTextIntrinsicHeightTextIntrinsicHeightTextIntrinsicHeightTextIntrinsicHeightTextIntrinsicHeightTextIntrinsicHeightTextIntrinsicHeightTextIntrinsicHeightTextIntrinsicHeightTextIntrinsicHeightTextIntrinsicHeightTextIntrinsicHeightTextIntrinsicHeightTextIntrinsicHeightTextIntrinsicHeightTextIntrinsicHeightTextIntrinsicHeightTextIntrinsicHeightTextIntrinsicHeightTextIntrinsicHeightTextIntrinsicHeightTextIntrinsicHeightTextIntrinsicHeightTextIntrinsicHeightTextIntrinsicHeightTextIntrinsicHeightTextIntrinsicHeightTextIntrinsicHeightTextIntrinsicHeightTextIntrinsicHeightTextIntrinsicHeightTextIntrinsicHeightTextIntrinsicHeightTextIntrinsicHeightTextIntrinsicHeightTextIntrinsicHeightTextIntrinsicHeightTextIntrinsicHeightTextIntrinsicHeightTextIntrinsicHeightTextIntrinsicHeightTextIntrinsicHeightTextIntrinsicHeightTextIntrinsicHeightTextIntrinsicHeightTextIntrinsicHeightTextIntrinsicHeightTextIntrinsicHeightTextIntrinsicHeightTextIntrinsicHeightTextIntrinsicHeightTextIntrinsicHeightTextIntrinsicHeightTextIntrinsicHeightTextIntrinsicHeightTextIntrinsicHeightTextIntrinsicHeightTextIntrinsicHeightTextIntrinsicHeightTextIntrinsicHeight"),
    ));
  }

  /*
  * 导航栏
  * */
  AppBar BrightnessLightBar(BuildContext context) {
    return YQAppBar(
      text: "平台公约",
      style: YQAppBarStyle.light,
      context: context,
    );
  }
}
