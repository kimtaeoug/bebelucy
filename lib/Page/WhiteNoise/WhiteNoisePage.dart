import 'package:bebelucy_flutter/BebelucyColor.dart';
import 'package:bebelucy_flutter/BebelucyFont.dart';
import 'package:bebelucy_flutter/Page/CommonUI/ContextMenu.dart';
import 'package:bebelucy_flutter/Page/WhiteNoise/WhiteNoiseMain.dart';
import 'package:bebelucy_flutter/Page/WhiteNoise/WhiteNoiseProvider.dart';
import 'package:bebelucy_flutter/SupportUI.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Routes.dart';
import 'MomWhiteNoise.dart';

class WhiteNoisePage extends StatelessWidget {
  final SupportUI _supportUI = SupportUI();
  final BebelucyColor _bebelucyColor = BebelucyColor();
  final BebelucyFont _bebelucyFont = BebelucyFont();

  @override
  Widget build(BuildContext context) {
    final WhiteNoiseProvider whiteNoiseProvider =
        Provider.of<WhiteNoiseProvider>(context);
    return SafeArea(
        child: Scaffold(
      backgroundColor: _bebelucyColor.aliceBlue,
      body: WillPopScope(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ContextMenu(null, _supportUI, true, true),
                Padding(
                  padding: EdgeInsets.only(top: _supportUI.resHeight(20)),
                  child: MomWhiteNoise(
                      null, _supportUI, _bebelucyColor, _bebelucyFont, whiteNoiseProvider),
                )
              ],
            ),
            Expanded(
                child: WhiteNoiseMain(null, _supportUI, _bebelucyColor,
                    _bebelucyFont, whiteNoiseProvider))
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
