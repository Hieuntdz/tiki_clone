import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProgressPriceWidget extends CustomPainter {
  double percent;
  Color underColor;
  Color aboveColor;

  ProgressPriceWidget({this.percent = 0, this.underColor = Colors.pinkAccent, this.aboveColor = Colors.red});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint1 = Paint()..color = underColor;
    canvas.drawRRect(
        RRect.fromRectAndRadius(Rect.fromLTWH(0, 0, size.width, size.height), Radius.circular(10)), paint1);

    Paint paint2 = Paint()..color = aboveColor;
    canvas.drawRRect(
        RRect.fromRectAndRadius(Rect.fromLTWH(0, 0, size.width * percent, size.height), Radius.circular(10)), paint2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
