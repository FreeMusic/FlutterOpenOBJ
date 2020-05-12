import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_chenji_ista_app/utils/header_index.dart';
import 'package:flutter_chenji_ista_app/utils/line_util.dart';

double leftMargin = ScreenUtil.getInstance().setHeight(60);

/*
* 更多回答模块
* */
class RecommendMoreAnswers extends StatefulWidget {
  RecommendMoreAnswersState createState() => RecommendMoreAnswersState();
}

class RecommendMoreAnswersState extends State<RecommendMoreAnswers> {
  double height = ScreenUtil.getInstance().setWidth(700);
  TextStyle labelStyle = TextStyle(color: Color(0xFF333333), fontSize: 16);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
//      child: Container(
      child: Stack(
        children: <Widget>[
          new Positioned(
            child: new RaisedButton(
              onPressed: () {
                setState(() {
                  labelStyle = TextStyle(
                      color: Color(0xFF333333),
                      fontSize: ScreenUtil.getInstance().setWidth(40));
                });
              },
              child: Text(
                '更多回答',
                style: labelStyle,
              ),
              color: Colors.white,
              textTheme: ButtonTextTheme.primary, //按钮的主题
              elevation: 0.0,
            ),
            left: leftMargin,
            top: 0,
          ),
          new Positioned(
            child: Image.asset(
              ImageHelper.homeAssets(HomeIcons.love),
              width: ScreenUtil.getInstance().setWidth(80),
            ),
            left: leftMargin,
            top: ScreenUtil.getInstance().setWidth(140),
          ),
          new Positioned(
            child: Container(
              child: Stack(
                children: <Widget>[
                  Image.asset(
                    ImageHelper.homeAssets(HomeIcons.recive),
                    width: ScreenUtil.getInstance().setWidth(560),
                    height: ScreenUtil.getInstance().setWidth(150),
                    fit: BoxFit.fill,
                  ),
                  Positioned(
                    child: Text(
                      '你平时怎么打发时间啊？',
                      style: TextStyle(color: Color(0xFF666666)),
                    ),
                    left: leftMargin,
                    bottom: ScreenUtil.getInstance().setWidth(50),
                  )
                ],
              ),
            ),
            left: leftMargin + ScreenUtil.getInstance().setWidth(90),
            top: ScreenUtil.getInstance().setWidth(165),
          ),
          new Positioned(
            child: Image.asset(
              ImageHelper.homeAssets(HomeIcons.love),
              width: ScreenUtil.getInstance().setWidth(80),
            ),
            right: leftMargin,
            top: ScreenUtil.getInstance().setWidth(320),
          ),
          new Positioned(
            child: Container(
              child: Stack(
                children: <Widget>[
                  Image.asset(
                    ImageHelper.homeAssets(HomeIcons.send),
                    width: ScreenUtil.getInstance().screenWidth * 0.75,
                    height: ScreenUtil.getInstance().setWidth(250),
                    fit: BoxFit.fill,
                  ),
                  Positioned(
                    child: Text(
                      '平时的话就看看书平时的话就看看书平时的话就看看书',
                      style: TextStyle(color: Colors.white),
                      maxLines: 100,
                      textAlign: TextAlign.left,
                    ),
                    width: ScreenUtil.getInstance().screenWidth * 0.65,
                    right: leftMargin * 0.7,
                    top: ScreenUtil.getInstance().setWidth(60),
                  )
                ],
              ),
            ),
            right: leftMargin + ScreenUtil.getInstance().setWidth(90),
            top: ScreenUtil.getInstance().setWidth(330),
          ),
          new Positioned(
            child: new RaisedButton(
              onPressed: () {
                setState(() {
                  labelStyle = TextStyle(
                      color: Color(0xFFFE548B),
                      fontSize: ScreenUtil.getInstance().setWidth(40));
                });
              },
              child: Text(
                '查看更多回答',
                style: TextStyle(
                  color: Color(0xFFFE548B),
                  fontSize: ScreenUtil.getInstance().setWidth(40),
                ),
                textAlign: TextAlign.center,
              ),
              color: Colors.white,
              textTheme: ButtonTextTheme.primary, //按钮的主题
              elevation: 0.0,
            ),
            left: leftMargin,
            width: ScreenUtil.getInstance().screenWidth - leftMargin * 2,
            bottom: 0,
          ),
          LineUtil.share().linePositioned(),
        ],
      ),
//      ),
      height: height,
    );
  }
}

/*
* 匿名回答
* */
class AnonymousAnswer extends StatefulWidget {
  AnonymousAnswerState createState() => AnonymousAnswerState();
}

class AnonymousAnswerState extends State<AnonymousAnswer> {
  double height = ScreenUtil.getInstance().setWidth(700);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Stack(
        children: <Widget>[
          new Positioned(
            child: new RaisedButton(
              onPressed: () {
                setState(() {});
              },
              child: Text(
                '匿名回答',
                style: TextStyle(
                    color: Color(0xFF333333),
                    fontSize: ScreenUtil.getInstance().setWidth(45)),
              ),
              color: Colors.white,
              textTheme: ButtonTextTheme.primary, //按钮的主题
              elevation: 0.0,
            ),
            left: leftMargin,
            top: 0,
          ),
          new Positioned(
            child: Container(
              child: Stack(
                children: <Widget>[
                  Image.asset(
                    ImageHelper.homeAssets(HomeIcons.roundrecive),
                    width: ScreenUtil.getInstance().setWidth(560),
                    height: ScreenUtil.getInstance().setWidth(150),
                    fit: BoxFit.fill,
                  ),
                  Positioned(
                    child: Text(
                      '你平时怎么打发时间啊？',
                      style: TextStyle(color: Color(0xFF666666)),
                    ),
                    left: leftMargin,
                    bottom: ScreenUtil.getInstance().setWidth(48),
                  )
                ],
              ),
            ),
            left: leftMargin + ScreenUtil.getInstance().setWidth(90),
            top: ScreenUtil.getInstance().setWidth(165),
          ),
          new Positioned(
            child: Container(
              child: Stack(
                children: <Widget>[
                  Image.asset(
                    ImageHelper.homeAssets(HomeIcons.roundsend),
                    width: ScreenUtil.getInstance().screenWidth * 0.75,
                    height: ScreenUtil.getInstance().setWidth(250),
                    fit: BoxFit.fill,
                  ),
                  Positioned(
                    child: Text(
                      '平时的话就看看书平时的话就看看书平时的话就看看书',
                      style: TextStyle(color: Colors.white),
                      maxLines: 100,
                      textAlign: TextAlign.left,
                    ),
                    width: ScreenUtil.getInstance().screenWidth * 0.65,
                    right: leftMargin * 0.7,
                    top: ScreenUtil.getInstance().setWidth(60),
                  )
                ],
              ),
            ),
            right: leftMargin + ScreenUtil.getInstance().setWidth(90),
            top: ScreenUtil.getInstance().setWidth(330),
          ),
          new Positioned(
            child: new RaisedButton(
              onPressed: () {
                setState(() {});
              },
              child: Text(
                '查看更多回答',
                style: TextStyle(
                  color: Color(0xFFFE548B),
                  fontSize: ScreenUtil.getInstance().setWidth(40),
                ),
                textAlign: TextAlign.center,
              ),
              color: Colors.white,
              textTheme: ButtonTextTheme.primary, //按钮的主题
              elevation: 0.0,
            ),
            left: leftMargin,
            width: ScreenUtil.getInstance().screenWidth - leftMargin * 2,
            bottom: 0,
          ),
        ],
      ),
      height: height,
    );
  }
}

/*
* 三天对对眼按钮模块
* */
class EyesToEyes extends StatelessWidget {
  double height = ScreenUtil.getInstance().setWidth(330);

  ShapeBorder shape = const RoundedRectangleBorder(
      side: BorderSide.none,
      borderRadius: BorderRadius.all(Radius.circular(50)));

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      child: Stack(
        children: <Widget>[
          EyesButton(),
          AskButton(),
        ],
      ),
      color: Colors.white,
    );
  }

  Positioned EyesButton() {
    return new Positioned(
      child: RaisedButton(
        shape: shape,
        color: Colors.white,
        onPressed: () {},
        child: Stack(
          children: <Widget>[
            Positioned(
              child: new Image.asset(
                HomeIcons.ask,
                height: height * 0.3,
              ),
              left: ScreenUtil.getInstance().setWidth(50),
            ),
            Positioned(
              child: Text(
                '邀请三天对对眼',
                style: TextStyle(
                    color: Color(0xFF666666),
                    fontSize: ScreenUtil.getInstance().setWidth(40)),
              ),
              right: ScreenUtil.getInstance().setWidth(50),
              top: (height * 0.2) / 2,
            )
          ],
        ),
      ),
      width: ScreenUtil.getInstance().setWidth(500),
      height: height * 0.35,
      top: height * 0.1,
      left: (ScreenUtil.getInstance().screenWidth -
              ScreenUtil.getInstance().setWidth(500)) /
          2,
    );
  }

  Positioned AskButton() {
    return new Positioned(
      child: RaisedButton(
        shape: shape,
        color: Colors.white,
        onPressed: () {},
        child: Stack(
          children: <Widget>[
            Positioned(
              child: new Image.asset(
                ImageHelper.homeAssets(HomeIcons.eye),
                height: height * 0.3,
              ),
              left: ScreenUtil.getInstance().setWidth(50),
            ),
            Positioned(
              child: Text(
                '匿名提问',
                style: TextStyle(
                    color: Color(0xFF666666),
                    fontSize: ScreenUtil.getInstance().setWidth(40)),
              ),
              right: ScreenUtil.getInstance().setWidth(50),
              top: (height * 0.2) / 2,
            )
          ],
        ),
      ),
      width: ScreenUtil.getInstance().setWidth(500),
      height: height * 0.35,
      bottom: ScreenUtil.getInstance().setWidth(50),
      left: (ScreenUtil.getInstance().screenWidth -
              ScreenUtil.getInstance().setWidth(500)) /
          2,
    );
  }
}
