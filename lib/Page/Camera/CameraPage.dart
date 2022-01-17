import 'package:bebelucy_flutter/Routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../BebelucyColor.dart';
import '../../BebelucyFont.dart';
import '../../SupportUI.dart';

class CameraPage extends StatelessWidget{
  final SupportUI supportUI = SupportUI();
  final BebelucyColor bebelucyColor = BebelucyColor();
  final BebelucyFont bebelucyFont = BebelucyFont();

  late final TextStyle noCameraTextStyle = TextStyle(fontSize: supportUI.resFontSize(14), color: Colors.white, fontFamily: bebelucyFont.appleB);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
    return SafeArea(child: Scaffold(
      backgroundColor: bebelucyColor.boulder,
      body: WillPopScope(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: supportUI.resWidth(180),
                height: supportUI.resHeight(180),
                child: Image.asset('images/no_camera.png'),
              ),
              Padding(padding: EdgeInsets.only(top: supportUI.resHeight(10)), child: SizedBox(
                width: supportUI.resWidth(140),
                height: supportUI.resHeight(20),
                child: Text('카메라를 확인해주세요.', style: noCameraTextStyle, textAlign: TextAlign.center,),
              ),)
            ],
          ),
        ),
        onWillPop: (){
          SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) => Navigator.pushNamed(context, Routes.cameraLoadingPage));
          return Future(() => false);
        },
      ),
    ));
  }
}