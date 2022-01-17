import 'package:bebelucy_flutter/BebelucyColor.dart';
import 'package:bebelucy_flutter/Page/WhiteNoise/WhiteNoisSliderThumb.dart';
import 'package:bebelucy_flutter/Page/WhiteNoise/WhiteNoiseProvider.dart';
import 'package:bebelucy_flutter/SupportUI.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WhiteNoiseItemSlider extends StatelessWidget{
  final SupportUI _supportUI;
  final BebelucyColor _bebelucyColor;
  final String title;
  final WhiteNoiseProvider whiteNoiseProvider;
  WhiteNoiseItemSlider(Key? key, this._supportUI, this._bebelucyColor, this.title, this.whiteNoiseProvider):super(key: key);

  late double currentValue;
  @override
  Widget build(BuildContext context) {
   currentValue = whiteNoiseProvider.getVolume(title);
   return SizedBox(
     width: _supportUI.resWidth(8),
     height: _supportUI.resHeight(66),
     child: Stack(
       children: [
         Center(
           child: SizedBox(
             width: _supportUI.resWidth(6),
             height: _supportUI.resHeight(66),
             child: Image.asset('images/slider_back.png', fit: BoxFit.fill,),
           ),
         ),
         SizedBox(
           width: _supportUI.resWidth(8),
           height: _supportUI.resHeight(66),
           child: RotatedBox(
             quarterTurns: -1,
             child: SliderTheme(
               data: SliderTheme.of(context).copyWith(
                 overlayColor: Colors.transparent,
                 overlayShape: RoundSliderThumbShape(enabledThumbRadius: 0),
                 inactiveTrackColor: Colors.transparent,
                 activeTrackColor: Colors.transparent,
                 thumbShape: WhiteNoisSliderThumb(_supportUI.resWidth(6), _supportUI.resHeight(3), _bebelucyColor),
                 activeTickMarkColor: Colors.transparent,
                 inactiveTickMarkColor: Colors.transparent
               ),
               child: Slider(
                 min: 0,
                 divisions: 10,
                 max: 1,
                 onChanged: (double value){
                   whiteNoiseProvider.setVolume(title, value);
                 },
                 value: currentValue,
               ),
             ),
           ),
         )
       ],
     ),
   );
  }
}

