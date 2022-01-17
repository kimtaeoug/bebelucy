import 'package:bebelucy_flutter/BLECommunicate/BLEProvider.dart';
import 'package:bebelucy_flutter/BebelucyColor.dart';
import 'package:bebelucy_flutter/BebelucyFont.dart';
import 'package:bebelucy_flutter/Page/BLEScan/BLEIconAnimation.dart';
import 'package:bebelucy_flutter/Page/BLEScan/BLEScanDeviceName.dart';
import 'package:bebelucy_flutter/Page/BLEScan/BLEScanProvider.dart';
import 'package:bebelucy_flutter/Page/BLEScan/BLESearchText.dart';
import 'package:bebelucy_flutter/SupportUI.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Routes.dart';
import 'BLEScanPercentAnimation.dart';
import 'BLEScanSpiralAnimation.dart';

class BLEScanPage extends StatelessWidget{
  final SupportUI _supportUI = SupportUI();
  final BebelucyColor _bebelucyColor = BebelucyColor();
  final BebelucyFont _bebelucyFont = BebelucyFont();
  @override
  Widget build(BuildContext context) {
    final BLEScanProvider _bleScanProvider = Provider.of<BLEScanProvider>(context);
    final BLEProvider _bleProvider = Provider.of<BLEProvider>(context);
    return SafeArea(child: Scaffold(
      backgroundColor: _bebelucyColor.hawkesBlue,
      body: WillPopScope(
        onWillPop: ()=>Future(()=>false),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: _supportUI.resHeight(50)),
                        child: SizedBox(
                          width: _supportUI.deviceWidth*11/36,
                          height: _supportUI.resHeight(20),
                          child: Image.asset('images/top_logo.png'),
                        ),
                      ),
                    ),
                    Center(
                      child: BLEScanDeviceName(null, _supportUI, _bebelucyColor, _bebelucyFont, _bleScanProvider, _bleProvider),
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BLESearchText(null, _supportUI, _bebelucyColor, _bebelucyFont, _bleScanProvider, _bleProvider),
                    BLEScanPercentAnimation(null, _supportUI, _bebelucyColor, _bebelucyFont, _bleScanProvider, _bleProvider)
                  ],
                )
              ],
            ),
            _bleScanProvider.getIsBLEIconAnimationDone()?
                BLEScanSpiralAnimation(null, _supportUI, _bleScanProvider):
                BLEIconAnimation(null, _supportUI, _bleScanProvider)
          ],
        ),
      ),
    ));
  }
}

