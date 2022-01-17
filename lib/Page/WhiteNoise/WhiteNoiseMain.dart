import 'package:bebelucy_flutter/BebelucyFont.dart';
import 'package:bebelucy_flutter/Page/WhiteNoise/WhiteNoiseItem.dart';
import 'package:bebelucy_flutter/Page/WhiteNoise/WhiteNoiseProvider.dart';
import 'package:bebelucy_flutter/SupportUI.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../BebelucyColor.dart';
import 'WhiteNoisePlayer.dart';

class WhiteNoiseMain extends StatelessWidget {
  final SupportUI _supportUI;
  final BebelucyColor _bebelucyColor;
  final BebelucyFont _bebelucyFont;
  final WhiteNoiseProvider whiteNoiseProvider;

  WhiteNoiseMain(Key? key, this._supportUI, this._bebelucyColor,
      this._bebelucyFont, this.whiteNoiseProvider)
      : super(key: key);
  final List<String> firstLine = ['wave', 'wind', 'rain'];
  final List<String> secondLine = ['fallenleaves', 'cricket', 'bonfire'];
  final List<String> thirdLine = ['shh', 'stream', 'bird'];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _supportUI.deviceWidth,
      decoration: BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.fill, image: AssetImage('images/sound_background.png')),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 30),
            child: SizedBox(
              width: _supportUI.deviceWidth * 5.1 / 6,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                    firstLine.length,
                        (index) => WhiteNoiseItem(
                        null,
                        _supportUI,
                        _bebelucyColor,
                        _bebelucyFont,
                        firstLine[index],
                        whiteNoiseProvider)),
              ),
            ),
          ),
          SizedBox(
            width: _supportUI.deviceWidth * 5.1 / 6,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                  secondLine.length,
                      (index) => WhiteNoiseItem(
                      null,
                      _supportUI,
                      _bebelucyColor,
                      _bebelucyFont,
                      secondLine[index],
                      whiteNoiseProvider)),
            ),
          ),
          SizedBox(
            width: _supportUI.deviceWidth * 5.1 / 6,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                  thirdLine.length,
                      (index) => WhiteNoiseItem(
                      null,
                      _supportUI,
                      _bebelucyColor,
                      _bebelucyFont,
                      thirdLine[index],
                      whiteNoiseProvider)),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: WhiteNoisePlayer(null, _supportUI, _bebelucyColor,
                _bebelucyFont, whiteNoiseProvider),
          )
        ],
      ),
    );
  }
}
