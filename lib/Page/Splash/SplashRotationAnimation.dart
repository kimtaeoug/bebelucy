import 'dart:async';

import 'package:bebelucy_flutter/BebelucyColor.dart';
import 'package:bebelucy_flutter/InitSetting.dart';
import 'package:bebelucy_flutter/Page/Splash/SplashProvider.dart';
import 'package:bebelucy_flutter/SupportUI.dart';
import 'package:flutter/cupertino.dart';

class SplashRotationAnimation extends StatefulWidget{
  final SupportUI _supportUI;
  final BebelucyColor _bebelucyColor;
  final SplashProvider _splashProvider;
  SplashRotationAnimation(Key? key, this._supportUI, this._bebelucyColor, this._splashProvider):super(key: key);
  @override
  State<StatefulWidget> createState() => _SplashRotationAnimation();
}
class _SplashRotationAnimation extends State<SplashRotationAnimation> with TickerProviderStateMixin{
  late final SupportUI _supportUI = widget._supportUI;
  late final BebelucyColor _bebelucyColor = widget._bebelucyColor;
  late final SplashProvider _splashProvider = widget._splashProvider;
  late final AnimationController _controller = AnimationController(vsync: this, duration: const Duration(seconds: 5));
  late final Animation<double> _animation = 
      CurvedAnimation(parent: _controller, curve: Curves.elasticInOut);
  final InitSetting _initSetting = InitSetting();
  @override
  void initState() {
    super.initState();
    _controller.addStatusListener((status) {
      if(status == AnimationStatus.completed){
        setState(() {
          opacityLevel = 0;
        });
        if(opacityLevel == 0){
          Timer.periodic(const Duration(milliseconds: 500), (timer) {
            _splashProvider.setIsRotationEnd(true);
            timer.cancel();
          });
        }
      }
    });
    _controller..forward();
    _initSetting.setAllInitSlpit(context);
  }
  @override 
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  double opacityLevel = 1;
  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
        opacity: opacityLevel,
        duration: const Duration(milliseconds: 500),
      child: SizedBox(
        width: _supportUI.resWidth(85),
        height: _supportUI.resHeight(85),
        child: Stack(
          children: [
            Center(
              child: RotationTransition(
                turns: _animation,
                child: SizedBox(
                  width: _supportUI.resWidth(85),
                  height: _supportUI.resHeight(85),
                  child: Image.asset('images/logo_loading.png'),
                ),
              ),
            ),
            Center(
              child: Container(
                width: _supportUI.resWidth(58),
                height: _supportUI.resHeight(58),
                decoration: BoxDecoration(
                    color: _bebelucyColor.white,
                    shape: BoxShape.circle
                ),
                child: Center(
                  child: SizedBox(
                    width: _supportUI.resWidth(44),
                    height: _supportUI.resHeight(30),
                    child: Image.asset('images/logo_only_image.png'),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
