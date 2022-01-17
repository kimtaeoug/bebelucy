import 'package:bebelucy_flutter/BebelucyColor.dart';
import 'package:bebelucy_flutter/BebelucyFont.dart';
import 'package:bebelucy_flutter/SupportUI.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BabyWeightGuideText extends StatelessWidget {
  final SupportUI _supportUI;
  final BebelucyColor _bebelucyColor;
  final BebelucyFont _bebelucyFont;

  BabyWeightGuideText(
      Key? key, this._supportUI, this._bebelucyColor, this._bebelucyFont)
      : super(key: key);

  late final TextStyle guideTextStyle = TextStyle(
      color: _bebelucyColor.lynch,
      fontFamily: _bebelucyFont.appleL,
      fontWeight: FontWeight.w600,
      fontSize: _supportUI.resFontSize(8));
  final String guideText =
      '백분위수란 같은 성별과 같은 나이의 영유아 100명 중에서 작은 쪽에서 부터의 순서를 말합니다. 그래프의 성장 곡선은 제일 아래에서부터 위로 올라가며 차례대로 5, 50, 95 백분위수를 나타내는 곡선입니다.';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _supportUI.deviceWidth * 8 / 9,
      height: _getGuideTextSize(guideText).height,
      child: Text(
        guideText,
        style: guideTextStyle,
      ),
    );
  }
  Size _getGuideTextSize(String text){
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: guideTextStyle),
      textDirection: TextDirection.ltr
    )..layout(minWidth: _supportUI.deviceWidth * 8 / 9, maxWidth: _supportUI.deviceWidth * 8 / 9);
    return textPainter.size;
  }
}

