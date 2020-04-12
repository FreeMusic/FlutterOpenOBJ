import 'package:flutter/cupertino.dart';
import 'package:flutter_chenji_ista_app/utils/header_index.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class NormalHeader extends ClassicalHeader {
  static List list = DateTime.now().toString().split(" ").last.split(":");
  var time = list.first.toString() + ":" + list[1].toString();
  @override
  String get refreshedText => "刷新完成";
  String get refreshReadyText => "释放刷新";
  String get refreshFailedText => "数据刷新失败";
  String get refreshingText => "数据刷新中";
  String get refreshText => "下拉刷新";
  String get noMoreText => "没有更多数据了";
  String get infoText => "更新于：" + time;
}

class NormalFooter extends ClassicalFooter {
  static List list = DateTime.now().toString().split(" ").last.split(":");
  var time = list.first.toString() + ":" + list[1].toString();
  @override
  String get loadedText => "上拉加载完成";
  String get loadingText => "数据加载中";
  String get loadReadyText => "释放加载数据";
  String get loadFailedText => "数据加载失败";
  String get loadText => "上拉获取数据";
  String get noMoreText => "没有更多数据";
  String get infoText => "更新于：" + time;
}

class ChatFooter extends CustomFooter {
  @override
  // TODO: implement enableInfiniteLoad
  bool get enableInfiniteLoad => true;
  @override
  // TODO: implement extent
  double get extent => 40;
  @override
  // TODO: implement triggerDistance
  double get triggerDistance => 50;
  @override
  // TODO: implement footerBuilder
  get footerBuilder => (context,
          loadState,
          pulledExtent,
          loadTriggerPullDistance,
          loadIndicatorExtent,
          axisDirection,
          float,
          completeDuration,
          enableInfiniteLoad,
          success,
          noMore) {
        return Stack(
          children: <Widget>[
            Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: Container(
                width: 30.0,
                height: 30.0,
                child: SpinKitCircle(
                  color: Colours.main_color,
                  size: 30,
                ),
              ),
            ),
          ],
        );
      };
}
