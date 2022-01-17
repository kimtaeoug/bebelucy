import 'package:bebelucy_flutter/BebelucyColor.dart';
import 'package:bebelucy_flutter/BebelucyFont.dart';
import 'package:bebelucy_flutter/SupportUI.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';

//inputData - List<FlSpot> (FlSpot - (double x, double y)) <- x는 idx
//dateData - List<String> - String 형태의 Data들이 List로
class HeartRateGraph extends StatelessWidget {
  final SupportUI _supportUI;
  final BebelucyColor _bebelucyColor;
  final BebelucyFont _bebelucyFont;
  final List<FlSpot> systolicData;
  final List<FlSpot> diastolicData;
  final List<String> dateData;

  HeartRateGraph(Key? key, this._supportUI, this._bebelucyColor,
      this._bebelucyFont, this.systolicData, this.diastolicData, this.dateData)
      : super(key: key);

  late final List<Color> systolicBarColor = [
    _bebelucyColor.tomato.withOpacity(0.7)
  ];
  late final List<Color> diastolicBarColor = [
    _bebelucyColor.royalBlue.withOpacity(0.7)
  ];
  late final List<Color> belowBarDataColor = [
    _bebelucyColor.lightRed,
    _bebelucyColor.white
  ];

  late final axisTextStyle = TextStyle(
      fontSize: _supportUI.resFontSize(10),
      color: _bebelucyColor.lynch,
      fontFamily: _bebelucyFont.camptonBook);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _supportUI.deviceWidth * 0.88,
      height: _supportUI.resHeight(207),
      child: Padding(
        padding: EdgeInsets.only(right: _supportUI.resWidth(10)),
        child: Stack(
          children: [
            LineChart(systolicDataLine(
                context, systolicData, diastolicData, dateData)),
            // LineChart(diastolicDataLine(context, diastolicData, dateData))
          ],
        ),
      ),
    );
  }

  //data (수축기 혈압) Systolic blood pressure.
  //이완기 혈압 diastolic blood pressure
  LineChartData systolicDataLine(
      BuildContext context,
      List<FlSpot> systolicData,
      List<FlSpot> diastolicData,
      List<String> dateData) {
    bool isSystolicAlone = systolicData.length == 1 ? true : false;
    bool isDiastolicAlone = diastolicData.length == 1 ? true : false;
    return LineChartData(
        gridData: FlGridData(show: false),
        //축
        titlesData: FlTitlesData(
            show: true,
            rightTitles: SideTitles(showTitles: false),
            topTitles: SideTitles(showTitles: false),
            //x축
            bottomTitles: SideTitles(
              showTitles: true,
              interval: 1,
              getTextStyles: (context, value) => axisTextStyle,
              //x축 라벨
              getTitles: (value) => dateData[value.toInt()],
              //y축 길이
              reservedSize: _supportUI.resFontSize(10),
            ),
            //y축
            leftTitles: SideTitles(
              showTitles: true,
              interval: 20,
              getTitles: (value) {
                if (value == 40) {
                  return '';
                } else {
                  return value.toInt().toString();
                }
              },
              getTextStyles: (context, value) => axisTextStyle,
              margin: _supportUI.resWidth(15),
              //x축 길이
              reservedSize: _supportUI.resFontSize(30),
            )),
        borderData: FlBorderData(
          show: false,
        ),
        //실제 데이터
        lineBarsData: [
          LineChartBarData(
              spots: systolicData,
              isCurved: true,
              colors: systolicBarColor,
              barWidth: 4.5,
              dotData: FlDotData(show: isSystolicAlone),
              belowBarData: BarAreaData(
                  show: true,
                  colors: belowBarDataColor,
                  gradientFrom: Offset(0, 0),
                  gradientTo: Offset(0, 1))),
          LineChartBarData(
              spots: diastolicData,
              isCurved: true,
              colors: diastolicBarColor,
              barWidth: 4.5,
              dotData: FlDotData(show: isDiastolicAlone),
              belowBarData: BarAreaData(show: false))
        ],
        minY: 40,
        maxY: 220);
  }
}
