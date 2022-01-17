import 'package:bebelucy_flutter/BLECommunicate/BLEProvider.dart';
import 'package:bebelucy_flutter/BebelucyColor.dart';
import 'package:bebelucy_flutter/BebelucyFont.dart';
import 'package:bebelucy_flutter/Page/Shake/ShakeProvider.dart';
import 'package:bebelucy_flutter/Page/Shake/ShakeRangeAnimation.dart';
import 'package:bebelucy_flutter/Page/Shake/ShakeRangeAnimationPath.dart';
import 'package:bebelucy_flutter/Page/Shake/ShakeStep.dart';
import 'package:bebelucy_flutter/SupportUI.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShakeRange extends StatelessWidget {
  final SupportUI _supportUI;
  final BebelucyColor _bebelucyColor;
  final BebelucyFont _bebelucyFont;
  final ShakeProvider _shakeProvider;
  final BLEProvider _bleProvider;
  ShakeRange(Key? key, this._supportUI, this._bebelucyColor, this._bebelucyFont,
      this._shakeProvider, this._bleProvider)
      : super(key: key);
  late bool _shakeActivated;

  final GlobalKey _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    _shakeActivated = _shakeProvider.getShakeActivated();
    return SizedBox(
      width: _supportUI.resWidth(300),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: _supportUI.resWidth(320),
            height: _supportUI.resWidth(320)*29/73,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: _supportUI.resWidth(15)),
                  child: Align(
                    alignment: AlignmentDirectional.bottomCenter,
                    child: Container(
                      height: _supportUI.resWidth(320)*29/73 - _supportUI.resWidth(15),
                      key: _globalKey,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(_shakeActivated
                                  ? 'images/shake_range_activate.png'
                                  : 'images/shake_range.png'),
                              fit: BoxFit.fill)),
                      child: Center(
                        child: ShakeStep(null, _supportUI, _bebelucyColor,
                            _bebelucyFont, '2', _shakeProvider, _bleProvider),
                      ),
                    ),
                  ),
                ),
                ShakeRangeAnimation(
                    null, _supportUI, _shakeProvider, _globalKey)
              ],
            ),
          ),
          SizedBox(
            width: _supportUI.resWidth(200),
            height: _supportUI.resHeight(25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ShakeStep(null, _supportUI, _bebelucyColor, _bebelucyFont, '1',
                    _shakeProvider, _bleProvider),
                ShakeStep(null, _supportUI, _bebelucyColor, _bebelucyFont, '3',
                    _shakeProvider, _bleProvider)
              ],
            ),
          )
        ],
      ),
    );
  }
}
