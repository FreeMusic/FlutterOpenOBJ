import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/*
* 自定义弹窗
* */
class BaseDialog extends StatefulWidget {
  /*
  * 不带图片的Dialog
  * */
  final String title; //弹窗标题
  final String cancle; //取消按钮的标题
  final Container content; //弹窗内容
  final String confirmContent; //按钮文本
  final Color confirmTextColor; //确认按钮文本颜色
  final bool isCancel; //是否有取消按钮 默认true true：有 false：没有
  final Color confirmColor; //确定按钮的颜色
  final Color cancelColor; //取消按钮的颜色
  final bool outsideDismiss; //点击弹窗外部是否可以关闭弹窗 默认true true：可以 false：不可以
  final Function confirmCallback; //点击确定按钮的回调
  final Function dismissCallback; //弹窗关闭回调
  final double height;

  const BaseDialog(
      {Key key,
      this.title,
      this.content,
      this.confirmContent,
      this.confirmTextColor,
      this.isCancel = true,
      this.confirmColor,
      this.cancelColor,
      this.outsideDismiss = true,
      this.confirmCallback,
      this.dismissCallback,
      this.cancle,
      this.height})
      : super(key: key);

  BaseDialogState createState() => BaseDialogState();
}

class BaseDialogState extends State<BaseDialog> {
  _confirmDialog() {
    _dismissDialog();
    if (widget.confirmCallback != null) {
      widget.confirmCallback();
    }
  }

  _dismissDialog() {
    if (widget.dismissCallback != null) {
      widget.dismissCallback();
    }
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;

    Column columnText = TextColumn(width);

    // TODO: implement build
    return WillPopScope(
        child: GestureDetector(
          onTap: () => {widget.outsideDismiss ? _dismissDialog() : null},
          child: Material(
            type: MaterialType.transparency,
            child: Center(
              child: Container(
                width: width - 100.0,
                height: widget.height == null ? 200 : widget.height,
                child: columnText,
                decoration: BoxDecoration(
                    color: Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.circular(12.0)),
              ),
            ),
          ),
        ),
        onWillPop: () async {
          return widget.outsideDismiss;
        });
  }

  Column TextColumn(double width) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: widget.title == null ? 0 : 16.0,
        ),
        Text(
          widget.title == null ? "" : widget.title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        widget.content,
        SizedBox(
          height: 1.0,
          child: Container(
            color: Color(0xDBDBDBDB),
          ),
        ),
        ButtonContainer(width),
      ],
    );
  }

  Container ButtonContainer(double width) {
    return Container(
      height: 45,
      child: Row(
        children: <Widget>[
          //CancleExpanded()
          CancleExpanded(),
          //分割线
          SizedBox(
            width: widget.isCancel ? 1.0 : 0,
            child: Container(color: Color(0xDBDBDBDB)),
          ),
          //
          ConfirmExpanded(),
        ],
      ),
    );
  }

  Expanded CancleExpanded() {
    return Expanded(
      child: widget.isCancel
          ? Container(
              decoration: BoxDecoration(
                  color: widget.cancelColor == null
                      ? Color(0xFFFFFFFF)
                      : widget.cancelColor,
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(12.0))),
              child: FlatButton(
                onPressed: _dismissDialog,
                child: Text(
                  widget.cancle == null ? "取消" : widget.cancle,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: widget.cancelColor == null
                        ? Colors.black54
                        : Color(0xFFFFFFFF),
                  ),
                ),
                splashColor: widget.cancelColor == null
                    ? Color(0xFFFFFFFF)
                    : widget.cancelColor,
                highlightColor: widget.cancelColor == null
                    ? Color(0xFFFFFFFF)
                    : widget.cancelColor,
              ),
            )
          : Text(""),
      flex: widget.isCancel ? 1 : 0,
    );
  }

  Expanded ConfirmExpanded() {
    return Expanded(
        child: Container(
          decoration: BoxDecoration(
              color: widget.confirmColor == null
                  ? Color(0xFFFFFFFF)
                  : widget.confirmColor,
              borderRadius: widget.isCancel
                  ? BorderRadius.only(bottomRight: Radius.circular(12.0))
                  : BorderRadius.only(
                      bottomLeft: Radius.circular(12.0),
                      bottomRight: Radius.circular(12.0))),
          child: FlatButton(
            onPressed: _confirmDialog,
            child: Text(
                widget.confirmContent == null ? '确定' : widget.confirmContent,
                style: TextStyle(
                  fontSize: 16.0,
                  color: widget.confirmColor == null
                      ? (widget.confirmTextColor == null
                          ? Colors.black87
                          : widget.confirmTextColor)
                      : Color(0xFFFFFFFF),
                )),
            splashColor: widget.confirmColor == null
                ? Color(0xFFFFFFFF)
                : widget.confirmColor,
            highlightColor: widget.confirmColor == null
                ? Color(0xFFFFFFFF)
                : widget.confirmColor,
          ),
        ),
        flex: 1);
  }
}
