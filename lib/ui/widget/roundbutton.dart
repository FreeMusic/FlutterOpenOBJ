import 'package:flutter/material.dart';
import 'package:flutter_chenji_ista_app/res/colors.dart';
import 'package:flutter_chenji_ista_app/res/styles.dart';

//全局的Button按钮
class RoundButton extends StatelessWidget {
  const RoundButton({
    Key key,
    this.width,
    this.height = 50,
    this.margin,
    this.radius,
    this.bgColor,
    this.highlightColor,
    this.splashColor,
    this.child,
    this.text,
    this.style,
    this.onPressed,
  }) : super(key: key);

  final double width;
  final double height;

  /// Empty space to surround the [decoration] and [child].
  final EdgeInsetsGeometry margin;

  final double radius;
  final Color bgColor;
  final Color highlightColor;
  final Color splashColor;

  final Widget child;

  final String text;
  final TextStyle style;

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    Color _bgColor = bgColor ?? Colours.button_white_defult;
    BorderRadius _borderRadius = BorderRadius.circular(radius ?? (height / 2));

    return DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: _borderRadius,
          gradient:Decorations.gradient_anamorphism,
        ),
        child: Container(
          width: width,
          height: height,
          margin: margin,
          child: new Material(
            borderRadius: _borderRadius,
            color: _bgColor,
            child: new InkWell(
              borderRadius: _borderRadius,
              onTap: () => onPressed(),
              child: child ??
                  new Center(
                    child: new Text(
                      text,
                      style: style ??
                          new TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ),
            ),
          ),
        ));
  }
}

/*枚举按钮的状态*/
enum STButtonStatus {
  Normal, //主题色
  Gradient, //渐变色
  Gray, //灰色不可交互
}

/*自定义button*/
class STButton extends StatelessWidget {
  const STButton({
    Key key,
    this.width,
    this.height = 50,
    this.margin,
    this.radius,
    this.bgColor,
    this.highlightColor,
    this.splashColor,
    this.child,
    this.text,
    this.buttonImage,
    this.status,
    this.style,

    this.onPressed,
  }) : super(key: key);

  final double width;
  final double height;

  /// Empty space to surround the [decoration] and [child].
  final EdgeInsetsGeometry margin;

  final double radius;
  final Color bgColor;
  final Color highlightColor;
  final Color splashColor;
  final STButtonStatus status;
  final Widget child;
  final String text;
  final Image buttonImage;
  final TextStyle style;

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    Color _bgColor = bgColor ?? Colours.button_white_defult;
    BorderRadius _borderRadius = BorderRadius.circular(radius ?? (height / 2));

    return DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: _borderRadius,
          gradient:Decorations.gradient_anamorphism,
        ),
        child: Container(
          width: width,
          height: height,
          margin: margin,

          child: new Material(
            borderRadius: _borderRadius,
            color: _bgColor,
            child: new InkWell(
              borderRadius: _borderRadius,
              onTap: () => onPressed(),
              child: child ??
                  new Center(
                    child: new Stack(
                      children: <Widget>[
                        new Text(
                          text,
                          style: style ??
                              new TextStyle(color: Colors.white, fontSize: 14),
                        ),
                        buttonImage
                      ],
                    ),
//                    child: new Text(
//                      text,
//                      style: style ??
//                          new TextStyle(color: Colors.white, fontSize: 14),
//                    ),

                  ),
            ),
          ),
        ));
  }
}



class LearnRadioButton extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new _LearnRadioButton();
  }
}
class _LearnRadioButton extends State<LearnRadioButton>{
  int groupValue=1;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Radio(value: 0, groupValue: 0, onChanged: null),//onChanged为null表示按钮不可用
          new Radio(
              value: 1,
              groupValue: groupValue,//当value和groupValue一致的时候则选中
              activeColor: Colors.red,
              onChanged: (T){
                updateGroupValue(T);
              }
          ),
          new Radio(
              value: 2,
              groupValue: groupValue,
              onChanged: (T){
                updateGroupValue(T);
              }
          ),
          new Radio(
              value: 3,
              groupValue: groupValue,
              onChanged: (T){
                updateGroupValue(T);
              }
          ),
          new Radio(
              value: 4,
              groupValue: groupValue,
              onChanged: (T){
                updateGroupValue(T);
              }
          ),
          new Radio(
              value: 5,
              groupValue: groupValue,
              onChanged: (T){
                updateGroupValue(T);
              }
          ),
          new Radio(
              value: 6,
              groupValue: groupValue,
              onChanged: (T){
                updateGroupValue(T);
              }
          ),
          new RadioListTile(
              value: 7,
              groupValue: groupValue,
              title: new Text('小张'),
              onChanged: (T){
                updateGroupValue(T);
              }),
          new RadioListTile(
              value: 8,
              groupValue: groupValue,
              title: new Text('小林'),
              onChanged: (T){
                updateGroupValue(T);
              }),
          new RadioListTile(
              value: 9,
              groupValue: groupValue,
              title: new Text('小王'),
              onChanged: (T){
                updateGroupValue(T);
              }),
          new RadioListTile(
              value: 10,
              groupValue: groupValue,
              title: new Text('小红'),
              onChanged: (T){
                updateGroupValue(T);
              })
        ],
      ),
    );
  }

  void updateGroupValue(int v){
    setState(() {
      groupValue=v;
    });
  }

}
