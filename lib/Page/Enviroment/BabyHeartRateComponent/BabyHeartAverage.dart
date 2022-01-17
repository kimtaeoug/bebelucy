import 'package:bebelucy_flutter/BebelucyColor.dart';
import 'package:bebelucy_flutter/BebelucyFont.dart';
import 'package:bebelucy_flutter/SupportUI.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BabyHeartAverage extends StatelessWidget {
  final SupportUI _supportUI;
  final BebelucyColor _bebelucyColor;
  final BebelucyFont _bebelucyFont;

  BabyHeartAverage(
      Key? key, this._supportUI, this._bebelucyColor, this._bebelucyFont)
      : super(key: key);
  late final TextStyle averageTextStyle = TextStyle(
      fontFamily: _bebelucyFont.appleB,
      fontWeight: FontWeight.w400,
      fontSize: _supportUI.resFontSize(18),
      color: Colors.black);
  late final TextStyle valueTextStyle = TextStyle(
      fontFamily: _bebelucyFont.camptonBold,
      fontWeight: FontWeight.w900,
      fontSize: _supportUI.resFontSize(40),
      color: Colors.red);
  late final TextStyle itemTextStyle = TextStyle(
      fontFamily: _bebelucyFont.camptonBold,
      fontWeight: FontWeight.w900,
      fontSize: _supportUI.resFontSize(20),
      color: Colors.black);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _supportUI.deviceWidth * 0.88,
      height: _supportUI.resHeight(80),
      decoration: BoxDecoration(
          color: _bebelucyColor.zumthor,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: _supportUI.resWidth(58),
            height: _supportUI.resHeight(58),
            child: Image.asset('images/heartrate_img.png'),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: _supportUI.resWidth(5)),
            child: SizedBox(
              height: _supportUI.resHeight(43),
              child: Center(
                child: Text(
                  '평균',
                  style: averageTextStyle,
                ),
              ),
            ),
          ),
          SizedBox(
            height: _supportUI.resHeight(43),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: _supportUI.resWidth(5)),
              child: Text(
                '142',
                style: valueTextStyle,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: _supportUI.resWidth(2)),
            child: SizedBox(
              height: _supportUI.resHeight(43),
              child: Center(
                child: Text(
                  'BPM',
                  style: itemTextStyle,
                  textAlign: TextAlign.start,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
