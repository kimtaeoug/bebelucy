import 'package:bebelucy_flutter/Page/Enviroment/BabyWeightComponent/BabyNowWeight.dart';
import 'package:bebelucy_flutter/Page/Enviroment/BabyWeightComponent/BabyWeightGraph.dart';
import 'package:bebelucy_flutter/Page/Enviroment/BabyWeightComponent/BabyWeightGuideText.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../BebelucyColor.dart';
import '../../../BebelucyFont.dart';
import '../../../SupportUI.dart';

class BabyWeight extends StatelessWidget {
  final SupportUI supportUI;
  final BebelucyColor bebelucyColor;
  final BebelucyFont bebelucyFont;

  BabyWeight(Key? key, this.supportUI, this.bebelucyColor, this.bebelucyFont)
      : super(key: key);

  List<FlSpot> dummyWeightData = [
    FlSpot(1, 3.5),
    FlSpot(2, 4.3)
  ];
  @override
  Widget build(BuildContext context) {
    return Expanded(child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(padding: EdgeInsets.only(top: supportUI.resHeight(20)),child: BabyNowWeight(null, supportUI, bebelucyColor, bebelucyFont),),
        Padding(
          padding: EdgeInsets.symmetric(vertical: supportUI.resHeight(7)),
          child:
          BabyWeightGuideText(null, supportUI, bebelucyColor, bebelucyFont),
        ),
        BabyWeightGraph(null, supportUI, bebelucyColor, bebelucyFont, dummyWeightData)
      ],
    ));
  }
}
