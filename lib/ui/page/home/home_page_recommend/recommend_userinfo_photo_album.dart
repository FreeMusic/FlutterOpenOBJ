import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chenji_ista_app/ui/page/home/home_page_recommend/photo_album_show.dart';
import 'package:flutter_chenji_ista_app/utils/header_index.dart';

/*
* 推荐用户个人相册模块
* */
class RecommnedUserPhotoAlnum extends StatefulWidget {
  RecommnedUserPhotoAlnumState createState() => RecommnedUserPhotoAlnumState();
}

class RecommnedUserPhotoAlnumState extends State<RecommnedUserPhotoAlnum> {
  double leftMargn = ScreenUtil.getInstance().setWidth(20);
  int _gridCount = 10;
  double itemHeight = ScreenUtil.getInstance().setWidth(260);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    double itemWidth =
        (ScreenUtil.getInstance().screenWidth - leftMargn * 4) / 3;

    return Container(
      child: EasyRefresh(
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, childAspectRatio: 1),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                SeeBigPhotoAlbum();
              },
              child: Stack(
                children: <Widget>[
                  Positioned(
                    child: new Image.asset(
                      ImageHelper.wrapAssets('icon_user_heard_portrait.png'),
                    ),
                    width: itemWidth,
                    left: leftMargn,
                    top: ScreenUtil.getInstance().setHeight(0),
                  ),
                ],
              ),
            );
          },
          itemCount: _gridCount,
          physics: new NeverScrollableScrollPhysics(),
        ),
        onRefresh: () async {
          await Future.delayed(Duration(seconds: 2), () {
            setState(() {
              _gridCount = 10;
            });
          });
        },
        onLoad: () async {
          await Future.delayed(Duration(seconds: 2), () {
            setState(() {
              _gridCount += 10;
            });
          });
        },
      ),
    );
  }

  void SeeBigPhotoAlbum() {
    Navigator.of(context).push(ScaleRouter(PhotoAlbumShow()));
  }
}
