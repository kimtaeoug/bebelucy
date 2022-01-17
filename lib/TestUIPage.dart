import 'package:bebelucy_flutter/BebelucyColor.dart';
import 'package:bebelucy_flutter/BebelucyFont.dart';
import 'package:bebelucy_flutter/Page/CommonUI/AutoPositionedList.dart';
import 'package:bebelucy_flutter/Page/Home/TopArc.dart';
import 'package:bebelucy_flutter/Page/Shake/ShakeProvider.dart';
import 'package:bebelucy_flutter/Page/Shake/ShakeRangeAnimation.dart';
import 'package:bebelucy_flutter/Page/WhiteNoise/WhiteNoiseProvider.dart';
import 'package:bebelucy_flutter/SupportUI.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Page/Shake/ShakeRange.dart';
import 'Page/WhiteNoise/WhiteNoiseItemSlider.dart';
import 'Routes.dart';

class TestUIPage extends StatelessWidget{
  final SupportUI _supportUI = SupportUI();
  final BebelucyColor _bebelucyColor = BebelucyColor();
  final BebelucyFont _bebelucyFont = BebelucyFont();
  @override
  Widget build(BuildContext context) {
    final ShakeProvider _shakeProvider = Provider.of<ShakeProvider>(context);
    return Scaffold(
      body: WillPopScope(
        child: Stack(
          children: [
            // ShakeRangeAnimation(null, _supportUI, _bebelucyColor)
          ],
        ),
        onWillPop: (){
          Navigator.pushNamed(context, Routes.testUIPage);
          return Future(()=>false);
        },
      ),
    );
  }

}