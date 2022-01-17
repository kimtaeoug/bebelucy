import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../BebelucyColor.dart';
import '../../BebelucyFont.dart';
import '../../SupportUI.dart';
import 'WhiteNoiseProvider.dart';

class PlayerSlider extends StatefulWidget{
  final SupportUI _supportUI;
  final BebelucyColor _bebelucyColor;
  final BebelucyFont _bebelucyFont;
  final WhiteNoiseProvider whiteNoiseProvider;

  PlayerSlider(Key? key, this._supportUI, this._bebelucyColor,
      this._bebelucyFont, this.whiteNoiseProvider)
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _PlayerSlider();

}
class _PlayerSlider extends State<PlayerSlider> {
  late final SupportUI _supportUI = widget._supportUI;
  late final BebelucyColor _bebelucyColor = widget._bebelucyColor;
  late final BebelucyFont _bebelucyFont = widget._bebelucyFont;
  late final WhiteNoiseProvider whiteNoiseProvider = widget.whiteNoiseProvider;

  late final TextStyle inactivatedTime = TextStyle(
      fontFamily: _bebelucyFont.capmtonM,
      fontSize: _supportUI.resFontSize(12),
      color: _bebelucyColor.mischka);
  double currentValue = 0;
  late int timerTime;
  late int lastTime;
  late List<String> refinedLastTime =[];
  @override
  Widget build(BuildContext context) {
    timerTime = whiteNoiseProvider.getTimerTime()*60;
    lastTime = whiteNoiseProvider.getLastTime();
    if(lastTime != 0){
      if(timerTime >= lastTime){
        setState(() {
          currentValue = (timerTime-lastTime)*100/timerTime;
          refinedLastTime = splitLastTime(lastTime);
        });
      }
    }else{
      setState(() {
        currentValue = 0;
        refinedLastTime.clear();
      });
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: _supportUI.resHeight(13),
        ),
        SizedBox(
          width: _supportUI.deviceWidth * 11 /20,
          height: _supportUI.resHeight(10),
          child: SliderTheme(
              data: SliderTheme.of(context).copyWith(
                  thumbColor: currentValue == 0
                      ? _bebelucyColor.mischka
                      : _bebelucyColor.indigoBlue,
                  overlayShape: RoundSliderThumbShape(enabledThumbRadius: 0),
                  inactiveTrackColor: _bebelucyColor.mischka,
                  activeTrackColor: _bebelucyColor.indigoBlue,
                  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 5)),
              child: Slider(
                value: currentValue,
                min: 0,
                max: 100,
                onChanged: (double value) {},
              )),
        ),
        SizedBox(
          width: _supportUI.deviceWidth / 2,
          child: Align(
            alignment: AlignmentDirectional.bottomEnd,
            child: SizedBox(
              height: _supportUI.resHeight(13),
              child: Text(
                lastTime!=0?
                '${refinedLastTime[0]}:${refinedLastTime[1]}:${refinedLastTime[2]}'
                    :'00:00:00',
                style: inactivatedTime,
                textAlign: TextAlign.end,
              ),
            ),
          ),
        )
      ],
    );
  }
  String twoDigits(int n) => n>=10? '$n':'0$n';
  List<String> splitLastTime(int input){
    List<String> dummy = [];
    int hour = input ~/ 3600;
    dummy.add(twoDigits(hour));
    int minute = (input%3600)~/60;
    dummy.add(twoDigits(minute));
    int second = input - ((hour*3600)+(minute*60));
    dummy.add(twoDigits(second));
    return dummy;
  }
}

