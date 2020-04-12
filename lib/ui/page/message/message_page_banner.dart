import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chenji_ista_app/ui/page/message/message_eye/eyetoeye_three_days/eye_three_days_page.dart';
import 'package:flutter_chenji_ista_app/utils/flutter_screenutil.dart';
import 'package:flutter_chenji_ista_app/utils/header_index.dart';

/*消息页面--轮播图*/
class MessagePageBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      height: ScreenUtil.instance.setHeight(350),
      margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
      child: AspectRatio(
        aspectRatio: 339.0 / 91.0, //比例
        child: Swiper(
          scrollDirection: Axis.horizontal,
          //横向滑动
          itemCount: 1,
          autoplay: true,
          //自动翻页
          itemBuilder: (BuildContext context, int index) {
            return Image.network(
              "https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=500542857,4026327610&fm=26&gp=0.jpg",
              fit: BoxFit.fill,
            );
          },
          //构建
          onTap: (index) {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (BuildContext context) {
              return EyeToEyeThreeDaysPage();
            }));
          },
          pagination: SwiperPagination(
            //分页指示器
            alignment: Alignment.bottomCenter, //位置 底部中间
            margin: const EdgeInsets.fromLTRB(20, 0, 20, 10), //内间距
            builder: DotSwiperPaginationBuilder(
              //指示器构造
              space: ScreenUtil().setWidth(5),
              //点之间的间距
              size: ScreenUtil().setWidth(10),
              //没选中 时候的大小
              activeSize: ScreenUtil().setWidth(12),
              //选中时候的大小
              color: Colors.black54,
              //没选中的颜色
              activeColor: Colors.white, //选中时候的颜色
            ),
          ),

          scale: 1, //两张图片的间距
        ),
      ),
    );
  }
}
