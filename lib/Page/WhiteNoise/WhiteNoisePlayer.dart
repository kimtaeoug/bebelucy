import 'package:bebelucy_flutter/BebelucyColor.dart';
import 'package:bebelucy_flutter/BebelucyFont.dart';
import 'package:bebelucy_flutter/Page/WhiteNoise/WhiteNoiseProvider.dart';
import 'package:bebelucy_flutter/SupportUI.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'PlayerSlider.dart';
import 'WhiteNoiseTimerSetting.dart';

class WhiteNoisePlayer extends StatelessWidget {
  final SupportUI _supportUI;
  final BebelucyColor _bebelucyColor;
  final BebelucyFont _bebelucyFont;
  final WhiteNoiseProvider whiteNoiseProvider;

  WhiteNoisePlayer(Key? key, this._supportUI, this._bebelucyColor,
      this._bebelucyFont, this.whiteNoiseProvider)
      : super(key: key);
  late bool timerActivation;
  @override
  Widget build(BuildContext context) {
    timerActivation = whiteNoiseProvider.getTimerActivation();
    return SizedBox(
      width: _supportUI.deviceWidth * 5.1 / 6,
      height: _supportUI.resHeight(40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: (){
              if(timerActivation){
                whiteNoiseProvider.stopTimer();
              }
            },
            child: SizedBox(
              width: _supportUI.resWidth(40),
              height: _supportUI.resHeight(40),
              child: Image.asset(timerActivation?'images/stop_button.png':'images/play_button.png'),
            ),
          ),
          SizedBox(
            height: _supportUI.resHeight(40),
            child: Center(
              child: PlayerSlider(null, _supportUI, _bebelucyColor,
                  _bebelucyFont, whiteNoiseProvider),
            ),
          ),
          SizedBox(
            height: _supportUI.resHeight(40),
            child: Center(
              child: GestureDetector(
                onTap: () => setTimer(context),
                child: SizedBox(
                  width: _supportUI.resWidth(28),
                  height: _supportUI.resHeight(28),
                  child: Image.asset('images/timer_button.png'),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> setTimer(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) => WhiteNoiseTimerSetting(null, _supportUI,
            _bebelucyColor, _bebelucyFont, whiteNoiseProvider));
  }
}

