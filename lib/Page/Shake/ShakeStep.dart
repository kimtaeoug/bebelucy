import 'package:bebelucy_flutter/BLECommunicate/BLEProvider.dart';
import 'package:bebelucy_flutter/BebelucyColor.dart';
import 'package:bebelucy_flutter/Page/Shake/ShakeProvider.dart';
import 'package:bebelucy_flutter/SupportUI.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../BebelucyFont.dart';

class ShakeStep extends StatelessWidget {
  final SupportUI _supportUI;
  final BebelucyColor _bebelucyColor;
  final BebelucyFont _bebelucyFont;
  final String number;
  final ShakeProvider _shakeProvider;
  final BLEProvider _bleProvider;
  ShakeStep(Key? key, this._supportUI, this._bebelucyColor, this._bebelucyFont,
      this.number, this._shakeProvider, this._bleProvider)
      : super(key: key);
  late final TextStyle inActivateStepNumberTextStyle = TextStyle(
      fontSize: _supportUI.resFontSize(22),
      fontFamily: _bebelucyFont.camptonSemiBold,
      fontWeight: FontWeight.w600,
      color: _bebelucyColor.silverChalice3);
  late final TextStyle activateStepNumberTextStyle = TextStyle(
      fontSize: _supportUI.resFontSize(22),
      fontFamily: _bebelucyFont.camptonSemiBold,
      fontWeight: FontWeight.w600,
      color: _bebelucyColor.indigoBlue);
  late final TextStyle selectedActivatedStepNumberTextStyle = TextStyle(
      fontSize: _supportUI.resFontSize(22),
      fontFamily: _bebelucyFont.camptonSemiBold,
      fontWeight: FontWeight.w600,
      color: _bebelucyColor.purpleHeart);
  late final TextStyle inActivateStepTextStyle = TextStyle(
      fontSize: _supportUI.resFontSize(12),
      fontFamily: _bebelucyFont.appleM,
      fontWeight: FontWeight.bold,
      color: _bebelucyColor.silverChalice3);
  late final TextStyle activateStepTextStyle = TextStyle(
      fontSize: _supportUI.resFontSize(12),
      fontFamily: _bebelucyFont.capmtonM,
      fontWeight: FontWeight.bold,
      color: _bebelucyColor.indigoBlue);
  late final TextStyle selectedActivatedStepTextStyle = TextStyle(
      fontSize: _supportUI.resFontSize(12),
      fontFamily: _bebelucyFont.capmtonM,
      fontWeight: FontWeight.bold,
      color: _bebelucyColor.purpleHeart);
  late bool _shakeActivation;
  late String _currentPosition;
  @override
  Widget build(BuildContext context) {
    final AnimationController? _animationController =
        _shakeProvider.getShakeAnimationController();
    _shakeActivation = _shakeProvider.getShakeActivated();
    _currentPosition = _shakeProvider.getCurrentPosition();
    return GestureDetector(
      onTap: () {
        if(_shakeActivation){
          if (_animationController != null) {
            _shakeProvider.positionRouter(number);
            _animationController..reset();
            _animationController..forward();
          }
          _bleProvider.activateShake(number);
        }
      },
      child: SizedBox(
        height: _supportUI.resHeight(25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(right: _supportUI.resWidth(2)),
              child: SizedBox(
                width: _supportUI.resWidth(12),
                height: _supportUI.resHeight(25),
                child: Text(
                  number,
                  style: _getNumberTextStyle(
                      _shakeActivation, number, _currentPosition),
                ),
              ),
            ),
            SizedBox(
              height: _supportUI.resHeight(25),
              child: Align(
                alignment: AlignmentDirectional.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(bottom: _supportUI.resHeight(3)),
                  child: SizedBox(
                    height: _supportUI.resHeight(19),
                    child: Text(
                      '단계',
                      style: _getTextStyle(
                          _shakeActivation, number, _currentPosition),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  TextStyle _getNumberTextStyle(
      bool activation, String title, String currentPosition) {
    TextStyle result = inActivateStepNumberTextStyle;
    if (activation) {
      if (title == currentPosition) {
        result = selectedActivatedStepNumberTextStyle;
      } else {
        result = activateStepNumberTextStyle;
      }
    }
    return result;
  }

  TextStyle _getTextStyle(
      bool activation, String title, String currentPosition) {
    TextStyle result = inActivateStepTextStyle;
    if (activation) {
      if (title == currentPosition) {
        result = selectedActivatedStepTextStyle;
      } else {
        result = activateStepTextStyle;
      }
    }
    return result;
  }
}
