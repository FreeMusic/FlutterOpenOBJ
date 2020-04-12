import 'package:flutter/material.dart';
import 'package:flutter_chenji_ista_app/config/resource_mananger.dart';
import 'package:flutter_chenji_ista_app/utils/flutter_screenutil.dart';

class PhotoAlbumShow extends StatefulWidget {
  @override
  _PhotoAlbumShowState createState() => _PhotoAlbumShowState();
}

class _PhotoAlbumShowState extends State<PhotoAlbumShow> {
  String title = "1/10";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BrightnessLightBar(),
      body: Container(
        color: Colors.black,
        child: PageView.builder(
          itemBuilder: ((context, index) {
            return PhotoAlbumShowItem();
          }),
          itemCount: 10,
          scrollDirection: Axis.horizontal,
          onPageChanged: (index) {
            setState(() {
              title = (index + 1).toString() + "/10";
            });
          },
        ),
      ),
    );
  }

  /*
  * 导航栏
  * */
  AppBar BrightnessLightBar() {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: ScreenUtil.getInstance().setWidth(50),
        ),
      ),
      backgroundColor: Colors.black,
      leading: GestureDetector(
        child: Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
        ),
        onTap: () => Navigator.pop(context),
      ),
    );
  }
}

class PhotoAlbumShowItem extends StatefulWidget {
  @override
  _PhotoAlbumShowItemState createState() => _PhotoAlbumShowItemState();
}

class _PhotoAlbumShowItemState extends State<PhotoAlbumShowItem> {
  double itemWidth = ScreenUtil.getInstance().screenWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onDoubleTap: () {
          print("双击");
          setState(() {
            itemWidth = ScreenUtil.getInstance().screenWidth * 2;
          });
        },
        onTap: () {
          Navigator.pop(context);
        },
        child: Image.asset(
          MessageIcons.header,
          width: itemWidth,
        ),
      ),
    );
  }
}
