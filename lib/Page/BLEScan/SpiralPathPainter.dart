import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SpiralPathPainter extends CustomPainter{
  final Path path;
  SpiralPathPainter(this.path);
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
        ..color = Colors.redAccent.withOpacity(0.3)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 3.0;
    canvas.drawPath(this.path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

