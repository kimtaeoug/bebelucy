import 'package:bebelucy_flutter/BebelucyColor.dart';
import 'package:bebelucy_flutter/Page/FetusWhiteNoise/FetusMomSound.dart';
import 'package:bebelucy_flutter/Page/WhiteNoise/WhiteNoiseProvider.dart';
import 'package:bebelucy_flutter/Permission/PermissionFunction.dart';
import 'package:bebelucy_flutter/SupportUI.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../BebelucyFont.dart';
import '../../Routes.dart';

class MomWhiteNoise extends StatelessWidget {
  final SupportUI _supportUI;
  final BebelucyColor _bebelucyColor;
  final BebelucyFont _bebelucyFont;
  final WhiteNoiseProvider _whiteNoiseProvider;

  MomWhiteNoise(Key? key, this._supportUI, this._bebelucyColor,
      this._bebelucyFont, this._whiteNoiseProvider)
      : super(key: key);

  final PermissionFuncion _permissionFuncion = PermissionFuncion();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _supportUI.deviceWidth * 31 / 36,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: _supportUI.deviceWidth * 31 / 36,
            height: _supportUI.resHeight(46),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: AlignmentDirectional.topStart,
                  child: SizedBox(
                      width: _supportUI.resWidth(162),
                      height: _supportUI.resHeight(33),
                      child: Image.asset('images/momsound_guide.png')),
                ),
                GestureDetector(
                  onTap: () => _permissionFuncion
                      .requestMusicListPermission()
                      .then((_) =>
                          Navigator.pushNamed(context, Routes.fetusPage)),
                  child: SizedBox(
                    width: _supportUI.resWidth(46),
                    height: _supportUI.resHeight(46),
                    child: Image.asset('images/momsound_list.png'),
                  ),
                )
              ],
            ),
          ),
          FetusMomSound(null, _supportUI, _bebelucyColor, _bebelucyFont,
              _whiteNoiseProvider)
        ],
      ),
    );
  }
}
