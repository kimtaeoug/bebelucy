import 'package:bebelucy_flutter/BebelucyColor.dart';
import 'package:bebelucy_flutter/BebelucyFont.dart';
import 'package:bebelucy_flutter/Page/Enviroment/BabyHeartRateComponent/HeartRateGraph.dart';
import 'package:bebelucy_flutter/SupportUI.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';

class BabyHeartRateLabel extends StatelessWidget {
  final SupportUI _supportUI;
  final BebelucyColor _bebelucyColor;
  final BebelucyFont _bebelucyFont;

//heartrate_minimum
  BabyHeartRateLabel(
      Key? key, this._supportUI, this._bebelucyColor, this._bebelucyFont)
      : super(key: key);
  late final maxTextStyle = TextStyle(
      color: _bebelucyColor.bigStone,
      fontWeight: FontWeight.w600,
      fontFamily: _bebelucyFont.appleB,
      fontSize: _supportUI.resFontSize(16));
  late final valueTextStyle = TextStyle(
      color: _bebelucyColor.bigStone,
      fontFamily: _bebelucyFont.camptonLight,
      fontWeight: FontWeight.bold,
      fontSize: _supportUI.resFontSize(15));

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: _supportUI.resHeight(20),
                child: Align(
                  alignment: AlignmentDirectional.bottomCenter,
                  child: SizedBox(
                    width: _supportUI.resWidth(13),
                    height: _supportUI.resHeight(12),
                    child: Image.asset('images/heartrate_maximum.png'),
                  ),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: _supportUI.resWidth(5)),
                child: SizedBox(
                  height: _supportUI.resHeight(20),
                  child: Align(
                    alignment: AlignmentDirectional.bottomCenter,
                    child: Text(
                      '최고',
                      style: maxTextStyle,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: _supportUI.resWidth(3)),
                child: SizedBox(
                  height: _supportUI.resHeight(20),
                  child: Align(
                    alignment: AlignmentDirectional.bottomCenter,
                    child: Text(
                      '150',
                      style: valueTextStyle,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: _supportUI.resHeight(20),
                child: Align(
                  alignment: AlignmentDirectional.bottomCenter,
                  child: Text(
                    'BPM',
                    style: valueTextStyle,
                  ),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: _supportUI.resHeight(20),
                child: Align(
                  alignment: AlignmentDirectional.bottomCenter,
                  child: SizedBox(
                    width: _supportUI.resWidth(13),
                    height: _supportUI.resHeight(12),
                    child: Image.asset('images/heartrate_minimum.png'),
                  ),
                ),
              ),
              Padding(
                padding:
                EdgeInsets.symmetric(horizontal: _supportUI.resWidth(5)),
                child: SizedBox(
                  height: _supportUI.resHeight(20),
                  child: Align(
                    alignment: AlignmentDirectional.bottomCenter,
                    child: Text(
                      '최고',
                      style: maxTextStyle,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: _supportUI.resWidth(3)),
                child: SizedBox(
                  height: _supportUI.resHeight(20),
                  child: Align(
                    alignment: AlignmentDirectional.bottomCenter,
                    child: Text(
                      '150',
                      style: valueTextStyle,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: _supportUI.resHeight(20),
                child: Align(
                  alignment: AlignmentDirectional.bottomCenter,
                  child: Text(
                    'BPM',
                    style: valueTextStyle,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
