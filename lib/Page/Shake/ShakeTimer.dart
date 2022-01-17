import 'package:bebelucy_flutter/BebelucyColor.dart';
import 'package:bebelucy_flutter/BebelucyFont.dart';
import 'package:bebelucy_flutter/Page/Shake/ShakeProvider.dart';
import 'package:bebelucy_flutter/Page/Shake/ShakeTimerEditor.dart';
import 'package:bebelucy_flutter/SupportUI.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShakeTimer extends StatelessWidget {
  final SupportUI _supportUI;
  final BebelucyColor _bebelucyColor;
  final BebelucyFont _bebelucyFont;
  final ShakeProvider shakeProvider;

  ShakeTimer(Key? key, this._supportUI, this._bebelucyColor, this._bebelucyFont,
      this.shakeProvider)
      : super(key: key);
  late final TextStyle timerTextStyle = TextStyle(
      fontFamily: _bebelucyFont.capmtonM,
      fontSize: _supportUI.resFontSize(40),
      fontWeight: FontWeight.w700,
      color: _bebelucyColor.bigStone);

  late bool _shakeActivation;
  late String _shakeLastTime;
  String minute = '00';
  String second = '00';
  @override
  Widget build(BuildContext context) {
    _shakeActivation = shakeProvider.getShakeActivated();
    _shakeLastTime = shakeProvider.getShakeTimerLast();
    if(_shakeLastTime != ''){
      List<String> timeList = _shakeLastTime.split(',');
      minute = timeList[0];
      second = timeList[1];
    }
    return Padding(
      padding: EdgeInsets.only(top: _supportUI.resHeight(20)),
      child: GestureDetector(
        onTap: ()=>showTimeEditor(context),
        child: Container(
          width: _supportUI.resWidth(210),
          height: _supportUI.resHeight(210),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(_shakeActivation?'images/shake_timer_activate.png':'images/shake_timer_inactivate.png'),
                  fit: BoxFit.fitWidth)),
          child: Center(
            child: Text(
              _shakeActivation?'$minute:$second':'00:00',
              style: timerTextStyle,
            ),
          ),
        ),
      ),
    );
  }

  Future<void> showTimeEditor(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return ShakeTimerEditor(
              null, _supportUI, _bebelucyColor, _bebelucyFont, shakeProvider);
        });
  }
}
