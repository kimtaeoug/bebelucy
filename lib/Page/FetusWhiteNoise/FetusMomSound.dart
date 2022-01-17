import 'package:bebelucy_flutter/BebelucyColor.dart';
import 'package:bebelucy_flutter/BebelucyFont.dart';
import 'package:bebelucy_flutter/Page/CommonUI/BebeToast.dart';
import 'package:bebelucy_flutter/Page/FetusWhiteNoise/FetusSlider.dart';
import 'package:bebelucy_flutter/Page/WhiteNoise/WhiteNoiseProvider.dart';
import 'package:bebelucy_flutter/SupportUI.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../BebeSharedPreference.dart';

class FetusMomSound extends StatelessWidget {
  final SupportUI _supportUI;
  final BebelucyColor _bebelucyColor;
  final BebelucyFont _bebelucyFont;
  final WhiteNoiseProvider _whiteNoiseProvider;

  FetusMomSound(Key? key, this._supportUI, this._bebelucyColor,
      this._bebelucyFont, this._whiteNoiseProvider)
      : super(key: key);

  late final TextStyle induceTextStyle = TextStyle(
      color: _bebelucyColor.black,
      fontSize: _supportUI.resFontSize(12),
      fontFamily: _bebelucyFont.appleEB,
      fontWeight: FontWeight.w400);

  final BebeSharedPreference _bebeSharedPreference = BebeSharedPreference();
  final BebeToast _bebeToast = BebeToast();
  late String? _selectedFile;
  late bool _fetusActivation;
  @override
  Widget build(BuildContext context) {
    _fetusActivation = _whiteNoiseProvider.getLocalMomSoundActivation();
    return Padding(
      padding: EdgeInsets.only(left: _supportUI.resWidth(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: (){
              _selectedFile = _bebeSharedPreference.getFetusFile();
              if(_fetusActivation){
                _whiteNoiseProvider.stopLocalMomSoundPlayer();
              }else{
                _whiteNoiseProvider.playLocalMomSound(_selectedFile!);
              }
            },
            child: _fetusActivation?Container(
              width: _supportUI.resWidth(96),
              height: _supportUI.resHeight(96),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _bebelucyColor.white,
                  border: Border.all(color: _bebelucyColor.brightTurquoise, width: 2),
                  boxShadow: [
                    BoxShadow(
                        color: _bebelucyColor.sail,
                        spreadRadius: 2,
                        blurRadius: 3,
                        offset: Offset(2.0, 3.0))
                  ]),
              child: Center(
                child: SizedBox(
                  width: _supportUI.resWidth(72),
                  height: _supportUI.resHeight(62),
                  child: Image.asset('images/activate_momsound.png'),
                ),
              ),
            ):Container(
              width: _supportUI.resWidth(96),
              height: _supportUI.resHeight(96),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _bebelucyColor.aliceBlue2,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.6),
                        spreadRadius: 2,
                        blurRadius: 3,
                        offset: Offset(2.0, 3.0))
                  ]),
              child: Center(
                child: SizedBox(
                  width: _supportUI.resWidth(72),
                  height: _supportUI.resHeight(62),
                  child: Image.asset('images/inactivate_momsound.png'),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: _supportUI.resWidth(10)),
            child: _fetusActivation?
            FetusSlider(null, _supportUI, _bebelucyColor, _whiteNoiseProvider)
                :SizedBox(
              height: _supportUI.resHeight(96),
              child: Center(
                child: Text(
                  '엄마소리를\n아기에게 들려주세요.',
                  style: induceTextStyle,
                  textAlign: TextAlign.start,
                ),
              ),
            ),
          )
        ],
      )
    );
  }
}
