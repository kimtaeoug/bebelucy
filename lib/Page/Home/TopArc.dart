import 'package:bebelucy_flutter/BebelucyColor.dart';
import 'package:bebelucy_flutter/SupportUI.dart';
import 'package:flutter/cupertino.dart';

class TopArc extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    Offset controlPoint = Offset(size.width/2, size.height/6);
    Path path = Path();
    path.lineTo(0, 0);
    path.lineTo(0, 180);
    path.quadraticBezierTo(controlPoint.dx, controlPoint.dy+180, size.width, 180);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }
  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
