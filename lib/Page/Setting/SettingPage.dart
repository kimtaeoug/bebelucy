import 'package:bebelucy_flutter/BebelucyColor.dart';
import 'package:bebelucy_flutter/BebelucyFont.dart';
import 'package:bebelucy_flutter/Page/CommonUI/ContextMenu.dart';
import 'package:bebelucy_flutter/Page/Setting/LogoutButton.dart';
import 'package:bebelucy_flutter/Page/Setting/SettingBLEItem.dart';
import 'package:bebelucy_flutter/Page/Setting/SettingCameraItem.dart';
import 'package:bebelucy_flutter/Page/Setting/SettingPushItem.dart';
import 'package:bebelucy_flutter/Page/Setting/SettingQuestionItem.dart';
import 'package:bebelucy_flutter/Page/Setting/SettingVoiceItem.dart';
import 'package:bebelucy_flutter/SupportUI.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Routes.dart';
import 'SettingAccountItem.dart';

class SettingPage extends StatelessWidget{
  final SupportUI _supportUI = SupportUI();
  final BebelucyColor _bebelucyColor = BebelucyColor();
  final BebelucyFont bebelucyFont = BebelucyFont();
  late final TextStyle settingTitleTextStyle = TextStyle(fontFamily: bebelucyFont.appleM, color: _bebelucyColor.emperor, fontSize: _supportUI.resFontSize(16));
  late final TextStyle settingDescriptionTextStyle = TextStyle(fontFamily: bebelucyFont.appleM, color: _bebelucyColor.regentGray,fontSize: _supportUI.resFontSize(14));
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: _bebelucyColor.aliceBlue,
      body: WillPopScope(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ContextMenu(null, _supportUI, true, false),
            SizedBox(
              height: _supportUI.deviceHieght*0.73,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SettingAccountItem(null, _supportUI, _bebelucyColor, settingTitleTextStyle, settingDescriptionTextStyle),
                  SettingBLEItem(null, _supportUI, _bebelucyColor, settingTitleTextStyle, settingDescriptionTextStyle,bebelucyFont),
                  SettingCameraItem(null, _supportUI, _bebelucyColor, settingTitleTextStyle, settingDescriptionTextStyle),
                  SettingPushItem(null, _supportUI, _bebelucyColor, settingTitleTextStyle, settingDescriptionTextStyle),
                  SettingVoiceItem(null, _supportUI, _bebelucyColor, settingTitleTextStyle, settingDescriptionTextStyle),
                  SettingQuestionItem(null, _supportUI, _bebelucyColor, settingTitleTextStyle, settingDescriptionTextStyle)
                ],
              ),
            ),
            LogoutButton(null, _supportUI, _bebelucyColor, bebelucyFont)
          ],
        ),
        onWillPop: (){
          Navigator.pop(context);
          return Future(() => false);
        },
      ),
    ));
  }

}