import 'package:flutter/material.dart';
import 'dart:math';

class CustomRect extends StatefulWidget {
  CustomRect({Key key}) : super(key: key);

  @override
  _CustomRectState createState() => _CustomRectState();
}

class _CustomRectState extends State<CustomRect> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CustomRect"),
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
    final leftTop = Offset(0, 0);
    final leftBottom = Offset(0, 100);
    final rightTop = Offset(200, 0);
    final rightBottom = Offset(200, 100);
    final topCenter = Offset(130, 0);
    final bottomCenter = Offset(70, 100);

    final paint1 = Paint()
      ..color = Colors.blueAccent
      ..style = PaintingStyle.fill
      ..strokeWidth = 2;

    Path path1 = Path();
    path1.moveTo(leftTop.dx, leftTop.dy);
    path1.lineTo(topCenter.dx, topCenter.dy);
    path1.lineTo(bottomCenter.dx, bottomCenter.dy);
    path1.lineTo(leftBottom.dx, leftBottom.dy);
    path1.lineTo(leftTop.dx, leftTop.dy);
    path1.close();

    canvas.drawPath(path1, paint1);

    final paint2 = Paint()
      ..color = Colors.greenAccent
      ..style = PaintingStyle.fill
      ..strokeWidth = 2;

    Path path2 = Path();
    path2.moveTo(rightTop.dx, rightTop.dy);
    path2.lineTo(topCenter.dx, topCenter.dy);
    path2.lineTo(bottomCenter.dx, bottomCenter.dy);
    path2.lineTo(rightBottom.dx, rightBottom.dy);
    path2.lineTo(rightTop.dx, rightTop.dy);
    path2.close();

    canvas.drawPath(path2, paint2);
  }

  //在实际场景中正确利用此回调可以避免重绘开销，本示例我们简单的返回true
  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}