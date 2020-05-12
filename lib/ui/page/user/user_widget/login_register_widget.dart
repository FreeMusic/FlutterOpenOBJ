import 'package:flutter/material.dart';
import 'package:flutter_chenji_ista_app/config/constant.dart';
import 'package:flutter_chenji_ista_app/res/colors.dart';
import 'package:flutter_chenji_ista_app/res/strings.dart';
import 'package:flutter_chenji_ista_app/res/styles.dart';
import 'package:flutter_chenji_ista_app/ui/widget/edit_textview.dart';
import 'package:flutter_chenji_ista_app/utils/sp_util.dart';


class SmsCodeDialog extends Dialog {
  String title;
  String negativeText;
  String positiveText;
  Function onCloseEvent;
  Function onPositivePressEvent;
  TextEditingController controllerImageCode;

  SmsCodeDialog({
    Key key,
    @required this.title,
    this.negativeText,
    this.positiveText,
    this.onPositivePressEvent,
    this.controllerImageCode,
    @required this.onCloseEvent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.all(25.0),
      child: new Material(
        type: MaterialType.transparency,
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Container(
              decoration: ShapeDecoration(
                color: Color(0xffffffff),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                ),
              ),
              margin: const EdgeInsets.all(12.0),
              child: new Column(
                children: <Widget>[
                  new Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: new Row(
                      children: <Widget>[
                        new Expanded(
                          child: new Text(
                            title,
                            style: new TextStyle(
                              fontSize: 16.0,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        new Expanded(child: Container()),
                        new GestureDetector(
//                          onTap: this.onCloseEvent,
                          onTap: this.onCloseEvent,
                          child: new Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: new Icon(
                              Icons.close,
                              color: Color(0xff666666),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  new Container(
//                    constraints: BoxConstraints(minHeight: 180.0),
                    padding: const EdgeInsets.fromLTRB(25, 0, 25, 20),
                    child: new Column(
                      children: <Widget>[
                        LoginItem(
                          controller: controllerImageCode,
                          textInputAction: TextInputAction.done,
                          inputType: "[a-zA-Z]|[0-9]",
                          hintText: "请输入下图中的图形验证码",
                        ),
                        Container(
                          height: 15,
                        ),
                        buildImage_and_Button(),
                      ],
                    ),
                  ),
                  DividerH.divider,
                  this._buildBottomButtonGroup(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomButtonGroup() {
    var widgets = <Widget>[];
    if (negativeText != null && negativeText.isNotEmpty) {
      widgets.add(_buildBottomCancelButton());
    }
    widgets.add(_buildBottomLine());

    if (positiveText != null && positiveText.isNotEmpty) {
      widgets.add(_buildBottomPositiveButton());
    }
    return new Flex(
      direction: Axis.horizontal,
      children: widgets,
    );
  }

  Widget _buildBottomCancelButton() {
    return new Flexible(
      fit: FlexFit.tight,
      child: new FlatButton(
        onPressed: onCloseEvent,
        child: new Text(
          negativeText,
          style: TextStyle(fontSize: 14.0, color: Colours.divider),
        ),
      ),
    );
  }

  Widget _buildBottomLine() {
    return new Container(
      height: 25,
      width: 1,
      color: Colours.divider,
    );
  }

  Widget _buildBottomPositiveButton() {
    return new Flexible(
      fit: FlexFit.tight,
      child: new FlatButton(
        onPressed: onPositivePressEvent,
        child: new Text(
          positiveText,
          style: TextStyle(
            color: Colours.button_color_red,
            fontSize: 14.0,
          ),
        ),
      ),
    );
  }
}

class buildImage_and_Button extends StatefulWidget {
  _buildImage_and_ButtonState createState() => _buildImage_and_ButtonState();
}

class _buildImage_and_ButtonState extends State<buildImage_and_Button> {
  String randomimageurl;

  @override
  void initState() {
    super.initState();
    randomimageurl = Strings.getRandom();
    SpUtil.putString(Constant.uuidimageUrl, "$randomimageurl");
    print('_buildImage_and_ButtonState======randomImageUrl  >>>>>>' +
        SpUtil.getString(Constant.uuidimageUrl));
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Image.network(
            "http://www.api.51chenji.com/captchas?uuid=$randomimageurl",
            width: 100,
            height: 50,
          ),
        ),
        Flexible(
          child: new FlatButton(
            onPressed: () {
              setState(() {
                randomimageurl = Strings.getRandom();
                SpUtil.putString(Constant.uuidimageUrl, "$randomimageurl");
                print('_buildImage_and_ButtonState======setState >>>>>>' +
                    randomimageurl);
              });
            },
            child: Text(
              '看不清，换一张',
              style: TextStyle(color: Colours.gray_99),
            ),
          ),
        ),
      ],
    );
  }
}