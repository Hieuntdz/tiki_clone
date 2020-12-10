import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CurvedBackground extends CustomPainter {
  Color bgColor;

  CurvedBackground({this.bgColor = Colors.blueAccent});

  @override
  void paint(Canvas canvas, Size size) {
    var bgBottomPaint = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.white;

    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), bgBottomPaint);

    var bgTopPaint = Paint()
      ..style = PaintingStyle.fill
      ..color = bgColor;

    var path = Path()
      ..moveTo(0, 0)
      ..lineTo(0, size.height)
      ..quadraticBezierTo(size.width / 4 - 20, size.height - 15, size.width / 4 + 10, size.height - 10)
      ..quadraticBezierTo(size.width / 2 - 10, size.height, size.width / 2 + 15, size.height - 5)
      ..quadraticBezierTo(size.width * 3 / 4 - 10, size.height - 15, size.width * 3 / 4 + 25, size.height - 5)
      ..quadraticBezierTo(size.width - 10, size.height, size.width, size.height - 10)
      ..lineTo(size.width, 0)
      ..lineTo(0, 0);

    canvas.drawPath(path, bgTopPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
