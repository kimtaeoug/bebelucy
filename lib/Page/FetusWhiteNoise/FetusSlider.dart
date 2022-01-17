import 'package:bebelucy_flutter/BebelucyColor.dart';
import 'package:bebelucy_flutter/Page/FetusWhiteNoise/FetusThumb.dart';
import 'package:bebelucy_flutter/Page/WhiteNoise/WhiteNoiseProvider.dart';
import 'package:bebelucy_flutter/SupportUI.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FetusSlider extends StatelessWidget{
  final SupportUI _supportUI;
  final BebelucyColor _bebelucyColor;
  final WhiteNoiseProvider _whiteNoiseProvider;
  FetusSlider(Key? key, this._supportUI, this._bebelucyColor, this._whiteNoiseProvider):super(key: key);
  late double _currentValue;
  @override
  Widget build(BuildContext context) {
    _currentValue = _whiteNoiseProvider.getLocalMomSoundPlayerVolume();
    return SizedBox(
      width: _supportUI.resWidth(87),
      height: _supportUI.resHeight(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(right: _supportUI.resWidth(5)),
            child: SizedBox(
              width: _supportUI.resWidth(16),
              height: _supportUI.resHeight(16),
              child: Image.asset('images/fetus_sound_icon.png'),
            ),
          ),
          SizedBox(
            height: _supportUI.resHeight(16),
            child: Center(
              child: Stack(
                children: [
                  Center(
                    child: SizedBox(
                      width: _supportUI.resWidth(66),
                      height: _supportUI.resHeight(18),
                      child: Image.asset('images/fetus_sound_back.png'),
                    ),
                  ),
                  Center(
                    child: SizedBox(
                      width: _supportUI.resWidth(66),
                      height: _supportUI.resHeight(10),
                      child: SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                            overlayColor: Colors.transparent,
                            overlayShape: RoundSliderThumbShape(enabledThumbRadius: 0),
                            inactiveTrackColor: Colors.transparent,
                            activeTrackColor: Colors.transparent,
                            thumbShape: FetusThumb(_supportUI.resWidth(5), _supportUI.resHeight(10), _bebelucyColor),
                            activeTickMarkColor: Colors.transparent,
                            inactiveTickMarkColor: Colors.transparent
                        ),
                        child: Slider(
                          min: 0,
                          max : 1,
                          divisions: 10,
                          onChanged: (double value){
                            _whiteNoiseProvider.setLocalMomSoundPlayerVolume(value);
                          },
                          value: _currentValue,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

