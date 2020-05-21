import 'package:flutter/material.dart';
import 'dart:math';

class CurveLine extends StatefulWidget {
  CurveLine({Key key}) : super(key: key);

  @override
  _CurveLineState createState() => _CurveLineState();
}

class _CurveLineState extends State<CurveLine> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Curve"),
      ),
      body: Center(
        child: CustomPaint(
          size: Size(400, 400), //指定画布大小
          painter: MyPainter(),
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..isAntiAlias = true
      ..color = Colors.green
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 10
      ..style = PaintingStyle.stroke;
    Paint paint1 = Paint()
      ..isAntiAlias = true
      ..color = Colors.blue
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 10
      ..style = PaintingStyle.stroke;
    /// Offset(),横纵坐标偏移
    /// void drawArc(Rect rect, double startAngle, double sweepAngle, bool useCenter, Paint paint)
    /// Rect来确认圆弧的位置, 开始的弧度、结束的弧度、是否使用中心点绘制(圆弧是否向中心闭合)、以及paint.
    final center = new Offset(200, 100);
    canvas.drawArc(new Rect.fromCircle(
        center: center,
        radius: size.width / 4
    ), -pi / 2, 2 * pi * 0.5, false, paint);
    canvas.drawArc(new Rect.fromCircle(
        center: Offset(200, 300),
        radius: size.width / 4
    ), pi / 2, 2 * pi * 0.5, false, paint1);
  }

  //在实际场景中正确利用此回调可以避免重绘开销，本示例我们简单的返回true
  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}