import 'package:bebelucy_flutter/Page/Splash/SplashOpacityAnimation.dart';
import 'package:bebelucy_flutter/Page/Splash/SplashProvider.dart';
import 'package:bebelucy_flutter/Page/Splash/SplashRotationAnimation.dart';
import 'package:bebelucy_flutter/SupportUI.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../BebelucyColor.dart';

class SplashPage extends StatelessWidget {
  final BebelucyColor _bebelucyColor = BebelucyColor();
  late bool isRotationEnd;

  @override
  Widget build(BuildContext context) {
    final MediaQueryData _mediaQueryData = MediaQuery.of(context);
    final double deviceWidth = _mediaQueryData.size.width;
    final double deviceHeight = _mediaQueryData.size.height;
    final SupportUI _supportUI = SupportUI();
    final SplashProvider _splashProvider = Provider.of<SplashProvider>(context);
    isRotationEnd = _splashProvider.getIsRotationEnd();
    _supportUI.deviceWidth = deviceWidth;
    _supportUI.deviceHieght = deviceHeight;
    _supportUI.getScreenUtil();
    if(_mediaQueryData.size.shortestSide > 600){
      _supportUI.isTablet = true;
    }
    return SafeArea(
        child: Scaffold(
      backgroundColor: _bebelucyColor.hawkesBlue,
      body: WillPopScope(
        onWillPop: () => Future(() => false),
        child: Center(
          child: isRotationEnd
              ? SplashOpacityAnimation(null, _supportUI)
              : SplashRotationAnimation(
                  null, _supportUI, _bebelucyColor, _splashProvider),
        ),
      ),
    ));
  }
}

