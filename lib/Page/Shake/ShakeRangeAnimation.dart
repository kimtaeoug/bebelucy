import 'dart:ui';
import 'package:bebelucy_flutter/Page/Shake/ShakeProvider.dart';
import 'package:bebelucy_flutter/SupportUI.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShakeRangeAnimation extends StatefulWidget{
  final SupportUI _supportUI;
  final ShakeProvider _shakeProvider;
  final GlobalKey _globalKey;
  ShakeRangeAnimation(Key? key, this._supportUI, this._shakeProvider, this._globalKey):super(key: key);
  @override
  State<StatefulWidget> createState()=>_ShakeRangeAnimation();
}

class _ShakeRangeAnimation extends State<ShakeRangeAnimation> with SingleTickerProviderStateMixin{
  late final SupportUI _supportUI = widget._supportUI;
  late final ShakeProvider _shakeProvider =widget._shakeProvider;
  late final GlobalKey _globalKey = widget._globalKey;
  late final AnimationController _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 500));
  late final Animation _animation;
  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      _shakeProvider.initShakeAnimationPath(_globalKey);
    });
    _shakeProvider.initShakeAnimationController(_animationController);
    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController);
    super.initState();
    _animation.addListener(() {
      setState(() {

      });
    });
    _animationController.addStatusListener((status) {
      if(status == AnimationStatus.completed){
        _shakeProvider.setIsPathCompleted(true);
      }
    });
  }
  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
  late bool activation;
  late Path _path;
  late bool _isPathCompleted;
  late Offset _offset;
  late bool _isInitShake;
  @override
  Widget build(BuildContext context) {
    _isInitShake = _shakeProvider.getIsInitShake();
    if(_isInitShake){
      _isPathCompleted = _shakeProvider.getIsPathCompleted();
      _path = _shakeProvider.getCurrentPath();
      _offset = _shakeProvider.completedPath();
      activation = _shakeProvider.getShakeActivated();
    }
    return _isInitShake?Positioned(
        top: _isPathCompleted?_offset.dy:calculateShake(_animation.value, _path).dy,
        left: _isPathCompleted?_offset.dx:calculateShake(_animation.value, _path).dx,
        child: SizedBox(
          width: _supportUI.resWidth(30),
          child: activation? Image.asset('images/shake_activate_point.png', fit: BoxFit.fitWidth,):
          Center(
            child: SizedBox(
              width: _supportUI.resWidth(20),
              child: Image.asset('images/shake_inactivate_point.png',fit: BoxFit.fitWidth,),
            ),
          )
          ,
        )):Container();
  }
  Offset calculateShake(double value, Path inputPath){
    PathMetrics _pathMetrics = inputPath.computeMetrics();
    PathMetric _pathMetric = _pathMetrics.elementAt(0);
    Tangent pos = _pathMetric.getTangentForOffset(_pathMetric.length * value)!;
    return pos.position;
  }
}
