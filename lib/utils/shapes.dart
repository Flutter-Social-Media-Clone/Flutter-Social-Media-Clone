import 'package:flutter/material.dart';

class DrawTriangleShapeLeft extends CustomPainter {
  Paint painter;
  Color color;

  DrawTriangleShapeLeft({this.color}) {
    this.painter = Paint()
      ..color = this.color
      ..style = PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Size size) {
    var path = Path();

    path.moveTo(0, 20);
    path.lineTo(20, 0);
    path.lineTo(0, 0);
    path.close();

    canvas.drawPath(path, painter);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class DrawTriangleShapeRight extends CustomPainter {
  Paint painter;
  Color color;

  DrawTriangleShapeRight({this.color}) {
    this.painter = Paint()
      ..color = this.color
      ..style = PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Size size) {
    var path = Path();

    path.moveTo(20, 20);
    path.lineTo(0, 0);
    path.lineTo(20, 0);

    path.close();

    canvas.drawPath(path, painter);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
