import 'dart:async';

import 'package:bebelucy_flutter/BebelucyColor.dart';
import 'package:bebelucy_flutter/Page/CommonUI/LoadingUI.dart';
import 'package:bebelucy_flutter/SupportUI.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Routes.dart';

//camera -> home 넘어갈때 위젯 크기 overflow 해결 위한 페이지
class CameraLoadingPage extends StatelessWidget{
  final SupportUI _supportUI = SupportUI();
  final BebelucyColor _bebelucyColor = BebelucyColor();
  @override
  Widget build(BuildContext context) {
    Timer.periodic(const Duration(seconds: 2), (timer) {
      Navigator.pushNamedAndRemoveUntil(context, Routes.homePage, (route) => false);
      timer.cancel();
    });
    return SafeArea(child: Scaffold(
      backgroundColor: _bebelucyColor.aliceBlue,
      body: WillPopScope(
        onWillPop: ()=>Future(()=>false),
        child: Center(
          child: LoadingUI(null, _supportUI),
        ),
      ),
    ));
  }
}