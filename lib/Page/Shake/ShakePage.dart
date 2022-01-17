import 'package:bebelucy_flutter/BLECommunicate/BLEProvider.dart';
import 'package:bebelucy_flutter/BebelucyColor.dart';
import 'package:bebelucy_flutter/BebelucyFont.dart';
import 'package:bebelucy_flutter/Page/CommonUI/ContextMenu.dart';
import 'package:bebelucy_flutter/Page/Shake/ShakeProvider.dart';
import 'package:bebelucy_flutter/Page/Shake/ShakeTimer.dart';
import 'package:bebelucy_flutter/Page/Shake/ShakeTitle.dart';
import 'package:bebelucy_flutter/SupportUI.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Routes.dart';
import 'ShakeRange.dart';

class ShakePage extends StatelessWidget {
  final SupportUI _supportUI = SupportUI();
  final BebelucyColor _bebelucyColor = BebelucyColor();
  final BebelucyFont _bebelucyFont = BebelucyFont();

  @override
  Widget build(BuildContext context) {
    final ShakeProvider shakeProvider = Provider.of<ShakeProvider>(context);
    final BLEProvider _bleProvider = Provider.of<BLEProvider>(context);
    return SafeArea(
        child: Scaffold(
      backgroundColor: _bebelucyColor.aliceBlue,
      body: WillPopScope(
        child: Stack(
          children: [
            SizedBox(
              width: _supportUI.deviceWidth,
              height:
                  _supportUI.deviceHieght * 2 / 3 - _supportUI.resHeight(15),
              child: Image.asset(
                'images/shake_background.png',
                fit: BoxFit.fill,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ContextMenu(null, _supportUI, true, true),
                Padding(
                  padding: EdgeInsets.only(
                      left: _supportUI.resWidth(25),
                      top: _supportUI.resHeight(20)),
                  child: Align(
                    alignment: AlignmentDirectional.topStart,
                    child: ShakeTitle(
                        null, _supportUI, _bebelucyColor, _bebelucyFont),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: _supportUI.resHeight(40)),
                  child: ShakeRange(null, _supportUI, _bebelucyColor,
                      _bebelucyFont, shakeProvider, _bleProvider),
                ),
                Center(
                  child: ShakeTimer(null, _supportUI, _bebelucyColor,
                      _bebelucyFont, shakeProvider),
                )
              ],
            )
          ],
        ),
        onWillPop: () {
          Navigator.pop(context);
          return Future(() => false);
        },
      ),
    ));
  }
}
