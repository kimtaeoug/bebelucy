import 'package:bebelucy_flutter/BebelucyColor.dart';
import 'package:bebelucy_flutter/BebelucyFont.dart';
import 'package:bebelucy_flutter/Page/CommonUI/ContextMenu.dart';
import 'package:bebelucy_flutter/Page/FetusWhiteNoise/FetusWhiteNoiseList.dart';
import 'package:bebelucy_flutter/Page/FetusWhiteNoise/FetusWhiteNoiseTitle.dart';
import 'package:bebelucy_flutter/Page/WhiteNoise/WhiteNoiseProvider.dart';
import 'package:bebelucy_flutter/SupportUI.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FetusWhiteNoisePage extends StatelessWidget{
  final SupportUI _supportUI = SupportUI();
  final BebelucyColor _bebelucyColor = BebelucyColor();
  final BebelucyFont _bebelucyFont = BebelucyFont();
  @override
  Widget build(BuildContext context) {
    final WhiteNoiseProvider _whiteNoiseProvider = Provider.of<WhiteNoiseProvider>(context);
    return SafeArea(child: Scaffold(
      backgroundColor: _bebelucyColor.aliceBlue,
      body: WillPopScope(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ContextMenu(null, _supportUI, true, true),
            Padding(
              padding: EdgeInsets.only(top: _supportUI.resHeight(30), bottom: _supportUI.resHeight(20)),
              child: FetusWhiteNoiseTitle(null, _supportUI, _bebelucyColor, _bebelucyFont, _whiteNoiseProvider),
            ),
            Expanded(child: Container(
              width: _supportUI.deviceWidth,
              color: _bebelucyColor.aliceBlue2,
              child: Padding(
                padding: EdgeInsets.only(top: _supportUI.resHeight(20)),
                child: FetusWhiteNoiseList(null, _supportUI, _bebelucyColor, _bebelucyFont, _whiteNoiseProvider),
              ),
            ))
          ],
        ),
        onWillPop: (){
          // _whiteNoiseProvider.getLocalMusicStream().close();
          Navigator.pop(context);
          return Future(()=>false);
        },
      ),
    ));
  }

}