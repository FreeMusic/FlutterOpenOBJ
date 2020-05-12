import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/*
画图的方式:
PainterLineStyle 直线
* */
enum YQPainterStyle {
  PainterLineStyle,
}

/*
*自定义绘图工具 画笔
* */
class YQPainter extends CustomPainter {
  Color lineColor; //默认画笔的颜色
  double width = 2.0; //默认画笔的宽度
  YQPainterStyle style = YQPainterStyle.PainterLineStyle; //默认直线
  Offset startOffset = Offset(0, 0);
  Offset endOffset = Offset(0, 0);
  bool isAntiAlias = true;

  YQPainter(
      {this.lineColor,
      this.width,
      this.style,
      this.endOffset,
      this.startOffset,
      this.isAntiAlias});

  @override
  void paint(Canvas canvas, Size size) {
    Paint _paint = new Paint()
      ..color = lineColor
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true
      ..strokeWidth = width
      ..style = PaintingStyle.stroke;
    //画出指定图形
    paintAppointGraph(canvas, size, _paint);
  }

  /*画出指定图形*/
  void paintAppointGraph(Canvas canvas, Size size, Paint _paint) {
    if (style == YQPainterStyle.PainterLineStyle) {
      //画直线
      canvas.drawLine(startOffset, endOffset, _paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return null;
  }
}
