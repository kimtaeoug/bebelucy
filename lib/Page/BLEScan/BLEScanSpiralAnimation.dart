import 'dart:ui';

import 'package:bebelucy_flutter/BLECommunicate/BLEProvider.dart';
import 'package:bebelucy_flutter/Page/BLEScan/BLEScanProvider.dart';
import 'package:bebelucy_flutter/SupportUI.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BLEScanSpiralAnimation extends StatefulWidget{
  final SupportUI supportUI;
  final BLEScanProvider bleScanProvider;
  BLEScanSpiralAnimation(Key? key, this.supportUI, this.bleScanProvider) : super(key: key);
  @override
  State<StatefulWidget> createState() => _BLEScanSpiralAnimation();
}

class _BLEScanSpiralAnimation extends State<BLEScanSpiralAnimation> with SingleTickerProviderStateMixin{
  late final SupportUI supportUI = widget.supportUI;
  late final BLEScanProvider bleScanProvider = widget.bleScanProvider;

  late final AnimationController _spiralController;
  late final Animation _spiralAnimation;
  late final Path _spiralPath;


  @override
  void initState() {
    _spiralController = AnimationController(duration : Duration(seconds: 1),vsync: this);
    super.initState();
    _spiralAnimation = Tween(begin: 0.0, end: 1.0).animate(_spiralController)..addListener(() {
      setState(() {

      });
    });
    _spiralController.addStatusListener((status) {
      if(status == AnimationStatus.forward){
        Future.delayed(Duration(milliseconds: 100)).then((_){
          _isAnimationDone = true;
        });
      }
    });
    _spiralPath = drawPath();
    _spiralController.forward();
  }
  bool _isAnimationDone = false;
  @override
  void dispose() {
    _spiralController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: calculateSpiralPath(_spiralAnimation.value).dy,
        left: calculateSpiralPath(_spiralAnimation.value).dx,
        child: AnimatedContainer(
          child: Image.asset('images/ble_image.png'),
          width: _isAnimationDone? supportUI.resWidth(0):supportUI.resWidth(50),
          height: _isAnimationDone? supportUI.resWidth(0):supportUI.resWidth(50),
          duration: Duration(seconds: 1),
          curve: Curves.ease,
          ),
        );
  }

  Path drawPath(){
    Size size = Size(supportUI.deviceWidth/2, supportUI.deviceHieght/2);
    Path path = Path();
    //시작점
    path.moveTo(size.width, size.height);
    //제어점(x1,y1)을 사용하여 현재 포인트에서 지정된 포인트(x2,y2)로 곡선을 그리는 2차 베지어 세그먼트를 추가합니다.
    path.quadraticBezierTo(size.width/6, size.height*2/3, size.width*2/5, 0);
    return path;
  }
  Offset calculateSpiralPath(double value){
    PathMetrics pathMetrics = _spiralPath.computeMetrics();
    PathMetric pathMetric = pathMetrics.elementAt(0);
    value = pathMetric.length * value;
    Tangent? pos = pathMetric.getTangentForOffset(value);
    return pos!.position;
  }
}


