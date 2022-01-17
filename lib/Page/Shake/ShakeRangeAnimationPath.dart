import 'dart:ui';

import 'package:bebelucy_flutter/SupportUI.dart';
import 'package:flutter/cupertino.dart';


///       x2,h2
/// x1,h1       x3,h1

class ShakeRangeAnimationPath{
  static final ShakeRangeAnimationPath _shakeRangeAnimationPath = ShakeRangeAnimationPath._init();
  ShakeRangeAnimationPath._init();
  factory ShakeRangeAnimationPath() => _shakeRangeAnimationPath;
  final SupportUI _supportUI = SupportUI();


  late double h1 = 0;
  late double h2 = 0;
  late double x1 = 0;
  late double x2 = 0;
  late double x3 = 0;
  void initShakeRangePathOffset(RenderBox renderBox){
    h1 = renderBox.size.height;
    x3 = renderBox.size.width;
    x2 = x3/2;
  }

  Path leftToCenter(){
    Path path = Path();
    path.moveTo(x1, h1);
    path.quadraticBezierTo((x1+x2)/6, (h1+h2)/6, x2, h2);
    return path;
  }
  Path leftToRight(){
    Path path = Path();
    path.moveTo(x1, h1);
    path.quadraticBezierTo((x1+x2)/6, (h1+h2)/6, x2, h2);
    path.quadraticBezierTo(x3, (h1+h2)/6, x3, h1);
    return path;
  }
  Path centerToLeft(){
    Path path = Path();
    path.moveTo(x2, h2);
    path.quadraticBezierTo((x1+x2)/6, (h1+h2)/6, x1, h1);
    return path;
  }
  Path centerToRight(){
    Path path = Path();
    path.moveTo(x2, h2);
    path.quadraticBezierTo(x3, (h1+h2)/6, x3, h1);
    return path;
  }
  Path rightToCenter(){
    Path path = Path();
    path.moveTo(x3, h1);
    path.quadraticBezierTo(x3-_supportUI.resWidth(15), (h1+h2)/6, x2, h2);
    return path;
  }
  Path rightToLeft(){
    Path path = Path();
    path.moveTo(x3, h1);
    path.quadraticBezierTo(x3, (h1+h2)/6, x2, h2);
    path.quadraticBezierTo((x1+x2)/6, (h1+h2)/6, x1, h1);
    return path;
  }
  Offset leftPosition(){
    return Offset(x1, h1);
  }
  Offset centerPosition(){
    return Offset(x2,h2);
  }
  Offset rightPosition(){
    return Offset(x3, h1);
  }
}