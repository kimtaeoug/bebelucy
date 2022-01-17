import 'package:bebelucy_flutter/Page/BLEScan/BLEScanProvider.dart';
import 'package:bebelucy_flutter/SupportUI.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BLEIconAnimation extends StatefulWidget {
  final SupportUI supportUI;
  final BLEScanProvider bleScanProvider;
  BLEIconAnimation(Key? key, this.supportUI, this.bleScanProvider) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BLEIconAnimation();
}

class _BLEIconAnimation extends State<BLEIconAnimation>
    with TickerProviderStateMixin {
  late final SupportUI supportUI = widget.supportUI;
  late final BLEScanProvider bleScanProvider = widget.bleScanProvider;

  late final AnimationController _positionController =
      AnimationController(duration: const Duration(seconds: 3), vsync: this);

  @override
  void initState() {
    _positionController.addStatusListener((status) {
      if(status == AnimationStatus.completed){
       bleScanProvider.setIsBLEIconAnimationDone(true);
      }
    });
    super.initState();
    _positionController..forward();
  }
  @override
  void dispose() {
    _positionController.dispose();
    super.dispose();
  }

  late final double smallImage = supportUI.resWidth(1);
  late final double bigImage = supportUI.resWidth(60);
  late final double leftPadding = supportUI.deviceWidth/2 - bigImage/2;
  late final double topPadding = supportUI.deviceHieght/2 - bigImage/2;
  late final totalSize = Size(supportUI.deviceWidth, supportUI.deviceHieght);

  @override
  Widget build(BuildContext context) {
    return PositionedTransition(
        rect: RelativeRectTween(
            begin: RelativeRect.fromSize(
                Rect.fromLTWH(supportUI.deviceWidth/2, supportUI.deviceHieght, smallImage,
                    smallImage),
                totalSize),
            end: RelativeRect.fromSize(
                Rect.fromLTWH(
                    leftPadding, topPadding, bigImage, bigImage),
                totalSize))
            .animate(CurvedAnimation(
            parent: _positionController, curve: Curves.easeOutQuart)),
        child:Image.asset('images/ble_image.png'));
  }
}
