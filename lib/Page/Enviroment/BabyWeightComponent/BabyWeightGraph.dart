import 'package:bebelucy_flutter/BebelucyColor.dart';
import 'package:bebelucy_flutter/LocalDB/LocalDBProvider.dart';
import 'package:bebelucy_flutter/Page/CommonUI/LongList.dart';
import 'package:bebelucy_flutter/SupportUI.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../BebelucyFont.dart';

class BabyWeightGraph extends StatelessWidget {
  final SupportUI _supportUI;
  final BebelucyColor _bebelucyColor;
  final BebelucyFont _bebelucyFont;
  final List<FlSpot> weightData;

  BabyWeightGraph(Key? key, this._supportUI, this._bebelucyColor,
      this._bebelucyFont, this.weightData)
      : super(key: key);
  late final TextStyle axisTextStyle = TextStyle(
    fontSize: _supportUI.resFontSize(10),
    fontFamily: _bebelucyFont.camptonBook,
    color: _bebelucyColor.black,
  );
  late final List<Color> unitLinear = [_bebelucyColor.lavenderGrey];
  final LongList _longList = LongList();

  late final TextStyle kgTextStyle = TextStyle(
      color: _bebelucyColor.black,
      fontFamily: _bebelucyFont.appleM,
      fontSize: _supportUI.resFontSize(8));

  late final TextStyle pointTextStyle = TextStyle(
      color: _bebelucyColor.lavenderGrey,
      fontSize: _supportUI.resFontSize(12),
      fontFamily: _bebelucyFont.capmtonM,
      fontWeight: FontWeight.w600);
  late String babyGender;

  @override
  Widget build(BuildContext context) {
    final LocalDBProvider localDBProvider =
        Provider.of<LocalDBProvider>(context);
    babyGender = localDBProvider.getProfileGender();
    if (babyGender == 'dummy') {
      babyGender = 'male';
    }
    return Container(
      width: _supportUI.deviceWidth,
      color: _bebelucyColor.aliceBlue2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Align(
            alignment: AlignmentDirectional.topStart,
            child: Padding(
              padding: EdgeInsets.only(left: _supportUI.resWidth(35)),
              child: Text(
                '무게(Kg)',
                style: kgTextStyle,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: _supportUI.resHeight(5), right: _supportUI.resWidth(20)),
            child: SizedBox(
              width: _supportUI.resWidth(280),
              height: _supportUI.resHeight(280),
              child: Stack(
                children: [
                  Align(
                    alignment: AlignmentDirectional.bottomEnd,
                    child: Padding(
                      padding:
                          EdgeInsets.only(bottom: 50),
                      child: SizedBox(
                        width: _supportUI.resWidth(32),
                        height: _supportUI.resHeight(32),
                        child: Image.asset('images/weight_$babyGender.png'),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: _supportUI.resHeight(30)),
                    child: Align(
                      alignment: AlignmentDirectional.topEnd,
                      child: SizedBox(
                        width: _supportUI.resWidth(32),
                        height: _supportUI.resHeight(15),
                        child: Center(
                          child: Text(
                            '95P',
                            style: pointTextStyle,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: _supportUI.resHeight(70)),
                    child: Align(
                      alignment: AlignmentDirectional.topEnd,
                      child: SizedBox(
                        width: _supportUI.resWidth(32),
                        height: _supportUI.resHeight(15),
                        child: Center(
                          child: Text(
                            '50P',
                            style: pointTextStyle,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: _supportUI.resHeight(70)),
                    child: Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: SizedBox(
                        width: _supportUI.resWidth(22),
                        height: _supportUI.resHeight(15),
                        child: Center(
                          child: Text(
                            '5P',
                            style: pointTextStyle,
                          ),
                        ),
                      ),
                    ),
                  ),
                  LineChart(
                      babyWeightChart(context))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  LineChartData babyWeightChart(BuildContext context) {
    return LineChartData(
        gridData: FlGridData(show: false),
        titlesData: FlTitlesData(
            show: true,
            rightTitles: SideTitles(showTitles: false),
            topTitles: SideTitles(showTitles: false),
            bottomTitles: SideTitles(
              showTitles: true,
              interval: 1,
              getTextStyles: (context, value) => axisTextStyle,
              getTitles: (value) => _longList.monthList[value.toInt()],
            ),
            leftTitles: SideTitles(
              showTitles: true,
              interval: 1,
              getTitles: (value) => _longList.weightList[value.toInt()],
              getTextStyles: (context, value) => axisTextStyle,
            )),
        axisTitleData: FlAxisTitleData(
          bottomTitle: AxisTitle(
              showTitle: true,
              titleText: '개월',
              textStyle: kgTextStyle,
              textAlign: TextAlign.end),
        ),
        borderData: FlBorderData(
            show: true,
            border: Border(
                bottom:
                    BorderSide(color: _bebelucyColor.cornflowerBlue, width: 3),
                left: BorderSide(
                    color: _bebelucyColor.cornflowerBlue, width: 3))),
        //라인 그릴 데이터
        lineBarsData: getUnitLineData(babyGender, weightData),
        minX: 0,
        maxX: 14,
        minY: 0,
        maxY: 13);
  }

  List<LineChartBarData> getUnitLineData(String gender, List<FlSpot> input) {
    List<LineChartBarData> result = [];
    if (gender == 'male') {
      result.add(convertLineChartBarData(_longList.male5p));
      result.add(convertLineChartBarData(_longList.male50p));
      result.add(convertLineChartBarData(_longList.male95p));
    } else if (gender == 'female') {
      result.add(convertLineChartBarData(_longList.female5p));
      result.add(convertLineChartBarData(_longList.female50p));
      result.add(convertLineChartBarData(_longList.female95p));
    }
    result.add(LineChartBarData(
        spots: input,
        isCurved: false,
        barWidth: 0,
        colors: [_bebelucyColor.purpleHeart],
        dotData: FlDotData(show: true)));
    return result;
  }

  LineChartBarData convertLineChartBarData(List<double> input) {
    List<FlSpot> flSpotList = [];
    int idx = 1;
    for (double value in input) {
      flSpotList.add(FlSpot(idx.toDouble(), value));
      idx += 1;
    }
    return LineChartBarData(
      spots: flSpotList,
      isCurved: true,
      colors: unitLinear,
      barWidth: 3,
      dotData: FlDotData(show: false),
    );
  }
}
