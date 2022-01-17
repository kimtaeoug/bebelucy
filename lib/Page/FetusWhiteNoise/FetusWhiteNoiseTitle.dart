import 'package:bebelucy_flutter/BebeSharedPreference.dart';
import 'package:bebelucy_flutter/BebelucyColor.dart';
import 'package:bebelucy_flutter/BebelucyFont.dart';
import 'package:bebelucy_flutter/Page/CommonUI/BebeToast.dart';
import 'package:bebelucy_flutter/Page/WhiteNoise/WhiteNoiseProvider.dart';
import 'package:bebelucy_flutter/SupportUI.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FetusWhiteNoiseTitle extends StatelessWidget{
  final SupportUI _supportUI;
  final BebelucyColor _bebelucyColor;
  final BebelucyFont _bebelucyFont;
  final WhiteNoiseProvider _whiteNoiseProvider;
  FetusWhiteNoiseTitle(Key? key, this._supportUI, this._bebelucyColor, this._bebelucyFont, this._whiteNoiseProvider):super(key: key);
  late final TextStyle saveTextStyle = TextStyle(
    fontFamily: _bebelucyFont.appleEB,
    fontSize: _supportUI.resFontSize(14),
    color: _bebelucyColor.white
  );
  final BebeToast _bebeToast = BebeToast();
  final BebeSharedPreference _bebeSharedPreference = BebeSharedPreference();
  late String _selectedFile;
  @override
  Widget build(BuildContext context) {
    _selectedFile = _whiteNoiseProvider.getLocalMomSoundFile();
    return SizedBox(
      width: _supportUI.deviceWidth*8/9,
      height: _supportUI.resHeight(34),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: _supportUI.deviceWidth*5/12,
            height: _supportUI.resHeight(34),
            child: Image.asset('images/fetus_title.png'),
          ),
          GestureDetector(
            onTap:(){
              if(_selectedFile == ''){
                // _bebeToast.showErrorToast('태음을 선택해주세요.');
              }else{
               _bebeSharedPreference.saveFetusFile(_selectedFile);
               Navigator.pop(context);
              }
            },
            child:Container(
              width: _supportUI.resWidth(85),
              height: _supportUI.resHeight(34),
              decoration: BoxDecoration(
                  color: _bebelucyColor.regentGray,
                  borderRadius: BorderRadius.all(Radius.circular(30))
              ),
              child: Center(
                child: Text('저장',style: saveTextStyle,),
              ),
            )
          )
        ],
      ),
    );
  }

}