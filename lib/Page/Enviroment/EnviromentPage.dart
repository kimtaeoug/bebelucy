import 'package:bebelucy_flutter/BLECommunicate/BLEProvider.dart';
import 'package:bebelucy_flutter/BebelucyColor.dart';
import 'package:bebelucy_flutter/BebelucyFont.dart';
import 'package:bebelucy_flutter/Page/CommonUI/ContextMenu.dart';
import 'package:bebelucy_flutter/Page/Enviroment/BabyHeartRateComponent/BabyHeartRate.dart';
import 'package:bebelucy_flutter/Page/Enviroment/BabyWeightComponent/BabyWeight.dart';
import 'BabyEnviromentComponent/BabyEnviroment.dart';
import 'package:bebelucy_flutter/Page/Enviroment/EnviromentTopNavigation.dart';
import 'package:bebelucy_flutter/SupportUI.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'EnviromentProvider.dart';
import 'EnviromentTime.dart';

class EnviromentPage extends StatelessWidget {
  final SupportUI supportUI = SupportUI();
  final BebelucyColor bebelucyColor = BebelucyColor();
  final BebelucyFont bebelucyFont = BebelucyFont();
  late int _whichIndex;

  @override
  Widget build(BuildContext context) {
    final EnviromentProvider enviromentProvider =
        Provider.of<EnviromentProvider>(context);
    _whichIndex = enviromentProvider.getWitchActivated();
    final BLEProvider _bleProvider = Provider.of<BLEProvider>(context);
    return SafeArea(
        child: Scaffold(
      backgroundColor: bebelucyColor.aliceBlue,
      body: WillPopScope(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ContextMenu(null, supportUI, true, true),
            EnviromentTopNavigation(null, supportUI, bebelucyColor,
                bebelucyFont, enviromentProvider),
            //witchActivated
            Align(
              alignment: AlignmentDirectional.topEnd,
              child:
              EnviromentTime(null, supportUI, bebelucyColor, bebelucyFont),
            ),
            witchActivated(_whichIndex, _bleProvider)
          ],
        ),
        onWillPop: () {
          Navigator.pop(context);
          return Future(() => false);
        },
      ),
    ));
  }

  Widget witchActivated(int index, BLEProvider input) {
    switch (index) {
      case 1:
        return BabyEnviroment(null, supportUI, bebelucyColor, bebelucyFont, input);
      case 2:
        return BabyWeight(null, supportUI, bebelucyColor, bebelucyFont);
      case 3:
        return BabyHeartRate(null, supportUI, bebelucyColor, bebelucyFont);
    }
    return Container();
  }
}
