import 'package:flutter/material.dart';
import 'package:flutter_chenji_ista_app/ui/page/home/home_page_recommend/home_page_recommend_userinfo.dart';
import 'package:flutter_chenji_ista_app/utils/header_index.dart';
import 'package:flutter_chenji_ista_app/utils/line_util.dart';

/*推荐页面--轮播图*/
class HomePageRecommendBanner extends StatelessWidget {
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
          itemCount: 4,
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
            //点击事件
            print('点击了第${index}个');
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

/*推荐的筛选条件*/
class HomePageRecommendFilter extends StatelessWidget {
  double height = UIAdapter.adapter.width(100);
  double buttonHeight = UIAdapter.adapter.width(50);
  double allWidth = UIAdapter.adapter.width(120);
  double areaWidth = UIAdapter.adapter.width(160);
  double sexWidth = UIAdapter.adapter.width(140);
  double buttonSpace = UIAdapter.adapter.width(30);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      child: Stack(
        children: <Widget>[
          new Positioned(
            child: new RoundButton(
              text: "全部",
              width: allWidth,
              height: buttonHeight,
              radius: buttonHeight / 2,
              bgColor: Colours.transparent,
              onPressed: () {
                print('点击了');
              },
            ),
            left: 20,
            top: (height - buttonHeight) / 2,
          ),
          new Positioned(
            child: new RoundButton(
              text: "所在地",
              width: areaWidth,
              height: buttonHeight,
              radius: buttonHeight / 2,
              bgColor: Colours.transparent,
//              buttonImage: ImageHelper.homeAssets('home_page_showmore.png'),
              onPressed: () {
                print('点击了');
              },
            ),
            left: 20 + allWidth + buttonSpace,
            top: (height - buttonHeight) / 2,
          ),
          new Positioned(
            child: new RoundButton(
              text: "性别",
              width: sexWidth,
              height: buttonHeight,
              radius: buttonHeight / 2,
              bgColor: Colours.transparent,
              onPressed: () {
                print('点击了');
              },
            ),
            left: 20 + allWidth + buttonSpace * 2 + areaWidth,
            top: (height - buttonHeight) / 2,
          ),
        ],
      ),
      height: height,
    );
  }
}

/*首页 推荐用户-用户Item*/
class HomeRecommedItem extends StatefulWidget {
  HomeRecommedItemState createState() => HomeRecommedItemState();
}

class HomeRecommedItemState extends State<HomeRecommedItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: Stack(
          children: <Widget>[
            new Positioned(
              child: new Image.asset(MessageIcons.header),
              bottom: UIAdapter.adapter.width(40),
              left: UIAdapter.adapter.width(40),
              right: UIAdapter.adapter.width(40),
            ),
            new Positioned(
              child: new Text(
                '李大庄',
                style: TextStyle(color: Colors.white),
              ),
              bottom: UIAdapter.adapter.width(120),
              left: UIAdapter.adapter.width(120),
            ),
            new Positioned(
              child: new Text(
                '32 | 浙江 | 年薪50万-100万',
                style: TextStyle(color: Colors.white),
              ),
              bottom: UIAdapter.adapter.width(80),
              left: UIAdapter.adapter.width(120),
            ),
          ],
        ),
        height: UIAdapter.adapter.width(600),
      ),
      onTap: () {
        //跳转至用户详情页面
        Navigator.push(context, RotateScaleRouter(HomeUserInfoPage()));
      },
    );
  }
}
