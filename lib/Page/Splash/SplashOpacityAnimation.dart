import 'dart:async';

import 'package:bebelucy_flutter/Page/CommonUI/BebeToast.dart';
import 'package:bebelucy_flutter/Permission/PermissionFunction.dart';
import 'package:bebelucy_flutter/SupportUI.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../InitSetting.dart';
import '../../Routes.dart';

class SplashOpacityAnimation extends StatefulWidget{
  final SupportUI _supportUI;
  SplashOpacityAnimation(Key? key, this._supportUI):super(key: key);
  final PermissionFuncion _permissionFuncion = PermissionFuncion();
  final InitSetting _initSetting = InitSetting();
  final BebeToast bebeToast = BebeToast();

  @override
  State<StatefulWidget> createState() => _SplashOpacityAnimation();

}

class _SplashOpacityAnimation extends State<SplashOpacityAnimation>{
  late final SupportUI _supportUI = widget._supportUI;
  late final PermissionFuncion _permissionFuncion = widget._permissionFuncion;
  late final InitSetting _initSetting = widget._initSetting;
  late final BebeToast bebeToast = widget.bebeToast;
  @override
  void initState() {
    super.initState();
    int idx = 0;
    Timer.periodic(const Duration(seconds: 1), (timer) {
      idx += 1;
      if(idx == 1){
        setState(() {
          _opacityLevel = 1;
        });
      }else if(idx == 2){
        setState(() {
          _opacityLevel = 0;
        });
      }else if(idx > 2){
        timer.cancel();
        // _permissionFuncion.requestLocalNotificationPermission().then((value){
        //   if(!value){
        //     bebeToast.showErrorToast(context, 'Push 메세지를 못 받게 됩니다.');
        //   }
        // });
        _permissionFuncion.requestBLEPermission().then((value){
          if(value){
            Navigator.pushNamedAndRemoveUntil(context, Routes.bleScanPage, (route) => false);
          }else{
            bebeToast.showErrorToast(context, '권한을 허락해야 사용 가능합니다.');
          }
        });
      }
    });
    _initSetting.setAllInitSplitLast(context);
  }
  double _opacityLevel = 0;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedOpacity(
        opacity: _opacityLevel,
        duration: const Duration(seconds: 1),
        child: SizedBox(
          width: _supportUI.deviceWidth*5/9,
          child: Image.asset('images/splash_log.png', fit: BoxFit.fitWidth,),
        ),
      ),
    );
  }
}


