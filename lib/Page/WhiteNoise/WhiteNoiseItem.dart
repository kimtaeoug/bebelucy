import 'package:bebelucy_flutter/BebelucyColor.dart';
import 'package:bebelucy_flutter/Page/WhiteNoise/WhiteNoiseItemSlider.dart';
import 'package:bebelucy_flutter/Page/WhiteNoise/WhiteNoiseProvider.dart';
import 'package:bebelucy_flutter/SupportUI.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../BebelucyFont.dart';

class WhiteNoiseItem extends StatelessWidget {
  final SupportUI _supportUI;
  final BebelucyColor _bebelucyColor;
  final BebelucyFont _bebelucyFont;
  final String title;
  final WhiteNoiseProvider whiteNoiseProvider;

  WhiteNoiseItem(Key? key, this._supportUI, this._bebelucyColor,
      this._bebelucyFont, this.title, this.whiteNoiseProvider)
      : super(key: key);
  late final TextStyle itemTextStyle = TextStyle(
      color: _bebelucyColor.boulder,
      fontWeight: FontWeight.w500,
      fontFamily: _bebelucyFont.appleM,
      fontSize: _supportUI.resFontSize(12));
  late final TextStyle activateItemTextStyle = TextStyle(
      color: _bebelucyColor.chathamsBlue,
      fontSize: _supportUI.resFontSize(12),
      fontFamily: _bebelucyFont.appleM,
      fontWeight: FontWeight.w600);
  late bool activation;

  @override
  Widget build(BuildContext context) {
    activation = whiteNoiseProvider.getActivation(title);
    return GestureDetector(
      onTap: () {
        whiteNoiseProvider.setActivation(title, !activation);
        if (activation) {
          whiteNoiseProvider.stopMusic(title);
        } else {
          whiteNoiseProvider.playMusic(title);
        }
      },
      child: activation
          ? Container(
              width: _supportUI.resWidth(94),
              height: _supportUI.resWidth(94),
              decoration: BoxDecoration(
                  color: _bebelucyColor.zumthor2,
                  border: Border.all(color: _bebelucyColor.brightTurquoise),
                  boxShadow: [
                    BoxShadow(
                        color: activation
                            ? _bebelucyColor.sail
                            : Colors.grey.withOpacity(0.6),
                        spreadRadius: 2,
                        blurRadius: 3,
                        offset: Offset(2.0, 3.0))
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    WhiteNoiseItemSlider(null, _supportUI, _bebelucyColor,
                        title, whiteNoiseProvider),
                    Padding(
                      padding: EdgeInsets.only(left: _supportUI.resWidth(5)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: _supportUI.resWidth(48),
                            height: _supportUI.resHeight(48),
                            child: Image.asset('images/activate_$title.png'),
                          ),
                          Text(
                            whiteNoiseProvider.convertToKorean(title),
                            style: activateItemTextStyle,
                          )
                        ],
                      ),
                    ),

                  ],
                ),
              ),
            )
          : Container(
              width: _supportUI.resWidth(80),
              height: _supportUI.resWidth(80),
              decoration: BoxDecoration(
                  color: _bebelucyColor.aliceBlue2,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.6),
                        spreadRadius: 2,
                        blurRadius: 3,
                        offset: Offset(2.0, 3.0))
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: _supportUI.resWidth(48),
                      height: _supportUI.resHeight(48),
                      child: Image.asset('images/inactivate_$title.png'),
                    ),
                    Text(
                      whiteNoiseProvider.convertToKorean(title),
                      style: itemTextStyle,
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
