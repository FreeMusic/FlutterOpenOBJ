import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_chenji_ista_app/res/colors.dart';
import 'package:flutter_chenji_ista_app/res/styles.dart';

class LoginItem extends StatefulWidget {
  const LoginItem({
    Key key,
    this.prefixIcon,
    this.hasSuffixIcon = false,
    this.hintText,
    this.controller,
    this.textInputType,
    this.textInputAction,
    this.inputType='[a-zA-Z]|[\u4e00-\u9fa5]|[0-9]',
  }) : super(key: key);

  final IconData prefixIcon;
  final bool hasSuffixIcon;
  final String hintText;
  final TextEditingController controller;
  final TextInputType textInputType;
  final TextInputAction textInputAction;

  final String inputType;

  @override
  State<StatefulWidget> createState() {
    return LoginItemState();
  }
}

class LoginItemState extends State<LoginItem> {
  bool _obscureText;

  String inputType;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.hasSuffixIcon;
    inputType = widget.inputType;
    print('◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤=====>>>$inputType');
    print('◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤=====>>>');
  }

  @override
  Widget build(BuildContext context) {
    return new Row(
      children: <Widget>[
//        new IconButton(
//            iconSize: 28,
//            icon: new Icon(
//              widget.prefixIcon,
//              color: Theme.of(context).primaryColor,
//            ),
//            onPressed: () {}),
//        Gaps.hGap30,
        new Expanded(
          child: new TextField(
              textInputAction: widget.textInputAction,
              keyboardType: widget.textInputType,
//              输入类型
              inputFormatters: [
//          [a-zA-Z]|[\u4e00-\u9fa5]|[0-9]
                WhitelistingTextInputFormatter(
                    RegExp(inputType)),
              ],
              obscureText: _obscureText,
              controller: widget.controller,
              style: new TextStyle(color: Colours.gray_66, fontSize: 14),
              decoration: new InputDecoration(
                hintText: widget.hintText,
                hintStyle: new TextStyle(color: Colours.gray_99, fontSize: 14),
                suffixIcon: widget.hasSuffixIcon
                    ? new IconButton(
                        icon: new Icon(
                          _obscureText
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colours.gray_66,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        })
                    : null,
                focusedBorder: new UnderlineInputBorder(
                    borderSide:
                        new BorderSide(color: Colours.button_color_start)),
                enabledBorder: new UnderlineInputBorder(
                    borderSide: new BorderSide(color: Colours.green_de)),
              )),
        ),
      ],
    );
  }
}

class DefultTextField extends StatefulWidget {
  const DefultTextField({
    Key key,
    this.hasSuffixIcon = false,
    this.hintText,
    this.controller,
    this.textInputType,
    this.textInputAction,
    this.inputType='[a-zA-Z]|[\u4e00-\u9fa5]|[0-9]',
  }) : super(key: key);

  final bool hasSuffixIcon;
  final String hintText;
  final TextEditingController controller;
  final TextInputType textInputType;
  final TextInputAction textInputAction;

  final String inputType;

  @override
  State<StatefulWidget> createState() {
    return DefultTextFieldState();
  }
}

class DefultTextFieldState extends State<DefultTextField> {

  String inputType;

  @override
  void initState() {
    super.initState();
    inputType = widget.inputType;
    print('◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤=====>>>$inputType');
    print('◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤=====>>>');
  }

  @override
  Widget build(BuildContext context) {
    return new Row(
      children: <Widget>[
//        new IconButton(
//            iconSize: 28,
//            icon: new Icon(
//              widget.prefixIcon,
//              color: Theme.of(context).primaryColor,
//            ),
//            onPressed: () {}),
//        Gaps.hGap30,
        new Expanded(
          child: new TextField(
              textInputAction: widget.textInputAction,
              keyboardType: widget.textInputType,
//              输入类型
              inputFormatters: [
//          [a-zA-Z]|[\u4e00-\u9fa5]|[0-9]
                WhitelistingTextInputFormatter(
                    RegExp(inputType)),
              ],
          textAlign: TextAlign.right,
              controller: widget.controller,
              style: new TextStyle(color: Colours.gray_33, fontSize: 14),
              decoration: new InputDecoration(

                hintText: widget.hintText,
                hintStyle: new TextStyle(color: Colours.gray_99, fontSize: 14),
                focusedBorder: new UnderlineInputBorder(
                    borderSide:
                    new BorderSide(color: Colours.button_color_start)),
                enabledBorder: new UnderlineInputBorder(
                    borderSide: new BorderSide(color: Colours.app_bg)),
              )),
        ),
      ],
    );
  }
}
