import 'package:bebelucy_flutter/BebelucyColor.dart';
import 'package:bebelucy_flutter/BebelucyFont.dart';
import 'package:bebelucy_flutter/Page/Enviroment/EnviromentTime.dart';
import 'package:bebelucy_flutter/SupportUI.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'BabyHeartAverage.dart';
import 'BabyHeartRateLabel.dart';
import 'HeartRateGraph.dart';

class BabyHeartRate extends StatelessWidget {
  final SupportUI _supportUI;
  final BebelucyColor _bebelucyColor;
  final BebelucyFont _bebelucyFont;

  BabyHeartRate(
      Key? key, this._supportUI, this._bebelucyColor, this._bebelucyFont)
      : super(key: key);
  List<FlSpot> dummySystolicData = [
    FlSpot(0, 145),
    FlSpot(1, 163),
    FlSpot(2, 160),
    FlSpot(3, 165),
    FlSpot(4, 170),
    FlSpot(5, 160),
    FlSpot(6, 175)
  ];
  List<FlSpot> dummyDiastolicData = [
    FlSpot(0, 85),
    FlSpot(1, 100),
    FlSpot(2, 120),
    FlSpot(3, 95),
    FlSpot(4, 110),
    FlSpot(5, 90),
    FlSpot(6, 75)
  ];
  List<String> dummyDateData = [
    '9/9',
    '9/10',
    '9/11',
    '9/12',
    '9/13',
    '9/14',
    '9/15'
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(padding: EdgeInsets.only(top: _supportUI.resHeight(15)), child: BabyHeartAverage(null, _supportUI, _bebelucyColor, _bebelucyFont),),
        Align(
          alignment: AlignmentDirectional.topStart,
          child: Padding(
            padding: EdgeInsets.only(
                left: _supportUI.resWidth(28), top: _supportUI.resHeight(10), bottom: _supportUI.resHeight(40)),
            child: BabyHeartRateLabel(
                null, _supportUI, _bebelucyColor, _bebelucyFont),
          ),
        ),
        //HeartRateGraph(key, _supportUI, _bebelucyColor, _bebelucyFont, systolicData, diastolicData, dateData)
        Center(
          child: HeartRateGraph(key, _supportUI, _bebelucyColor, _bebelucyFont,
              dummySystolicData, dummyDiastolicData, dummyDateData),
        )
      ],
    );
  }
}
