import 'package:bebelucy_flutter/BebelucyFont.dart';
import 'package:bebelucy_flutter/SupportUI.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../BebelucyColor.dart';

class ShakeTitle extends StatelessWidget {
  final SupportUI _supportUI;
  final BebelucyColor _bebelucyColor;
  final BebelucyFont _bebelucyFont;

  ShakeTitle(Key? key, this._supportUI, this._bebelucyColor, this._bebelucyFont)
      : super(key: key);
  late final TextStyle titleTextStyle = TextStyle(fontFamily: _bebelucyFont.appleEB, fontSize: _supportUI.resFontSize(14), color: Colors.black, fontWeight: FontWeight.w500);
  late final TextStyle contentsTextStyle = TextStyle(fontFamily: _bebelucyFont.appleL, fontSize: _supportUI.resFontSize(10), color: Colors.black, fontWeight: FontWeight.w400);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _supportUI.deviceWidth * 4 / 9,
      height: _supportUI.resHeight(35),
      child: Image.asset('images/shake_title_img.png'),
    );
  }
}
