import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_chenji_ista_app/config/resource_mananger.dart';
import 'package:flutter_chenji_ista_app/utils/flutter_screenutil.dart';

/*
* T台信息列表展示
* */
class TTlistView extends StatefulWidget {
  TTlistViewState createState() => TTlistViewState();
}

class TTlistViewState extends State<TTlistView> {
  static double leftMargn = ScreenUtil.getInstance().setWidth(30);
  static double width = ScreenUtil.getInstance().screenWidth - leftMargn;
  static double itemWidth = width / 6 - leftMargn;
  double height = ScreenUtil.getInstance().setWidth(400);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: height,
      backgroundColor: Colors.white,
      flexibleSpace: FlexibleSpaceBar(
          background: Stack(
        children: <Widget>[
          //换一批按钮
          InBatchButton(),
          //全部T台
          AllInBatchButton(),
          //GribView列表展示
          GribViewPositioned(),
        ],
      )),
    );
  }

  //换一批按钮
  Positioned InBatchButton() {
    return Positioned(
      child: FlatButton(
        textColor: Color(0xFF333333),
        onPressed: () {},
        child: Text(
          "换一批",
          style: TextStyle(
              fontSize: ScreenUtil.getInstance().setWidth(40),
              fontWeight: FontWeight.bold),
        ),
        color: Colors.white,
      ),
      left: leftMargn,
    );
  }

  //全部T台
  Positioned AllInBatchButton() {
    return Positioned(
      child: FlatButton(
        textColor: Color(0xFF333333),
        onPressed: () {},
        child: Text(
          "全部T台>",
          style: TextStyle(
              fontSize: ScreenUtil.getInstance().setWidth(40),
              fontWeight: FontWeight.bold),
        ),
        color: Colors.white,
      ),
      right: leftMargn,
    );
  }

  //GribView列表展示
  Positioned GribViewPositioned() {
    return Positioned(
      height: height,
      width: ScreenUtil.getInstance().screenWidth,
      top: (height - itemWidth) / 2,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 6, childAspectRatio: 0.85),
        itemBuilder: (BuildContext context, int index) {
          return ttItem(index);
        },
        itemCount: 6,
        physics: new NeverScrollableScrollPhysics(),
      ),
    );
  }

  //GribView列表Item
  Stack ttItem(int index) {
    String url;
    String title;
    if (index == 0) {
      url = ImageHelper.homeAssets(HomeIcons.tt);
      title = "上T台";
    } else {
      url = ImageHelper.wrapAssets('icon_user_heard_portrait.png');
      title = "聂小倩";
    }
    return Stack(
      children: <Widget>[
        Positioned(
          child: new ClipOval(
            child: new Image.asset(
              url,
              width: itemWidth,
              height: itemWidth,
            ),
          ),
          right: leftMargn / 2,
        ),
        Positioned(
          child: new Text(
            title,
            style: TextStyle(
                color: Color(0xFF333333),
                fontWeight: FontWeight.w500,
                fontSize: ScreenUtil.getInstance().setWidth(30)),
            textAlign: TextAlign.center,
          ),
          right: 0,
          bottom: 0,
          width: itemWidth + leftMargn / 2,
        ),
      ],
    );
  }
}
