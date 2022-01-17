import 'package:bebelucy_flutter/BebelucyColor.dart';
import 'package:bebelucy_flutter/BebelucyFont.dart';
import 'package:bebelucy_flutter/LocalDB/LocalDBProvider.dart';
import 'package:bebelucy_flutter/Page/CommonUI/ContextMenu.dart';
import 'package:bebelucy_flutter/Page/Profile/ProfileBirth.dart';
import 'package:bebelucy_flutter/Page/Profile/ProfileBloodType.dart';
import 'package:bebelucy_flutter/Page/Profile/ProfileGender.dart';
import 'package:bebelucy_flutter/Page/Profile/ProfileName.dart';
import 'package:bebelucy_flutter/Routes.dart';
import 'package:bebelucy_flutter/SupportUI.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'ProfileImage.dart';

class ProfilePage extends StatelessWidget {
  final SupportUI supportUI = SupportUI();
  final BebelucyColor bebelucyColor = BebelucyColor();
  final BebelucyFont bebelucyFont = BebelucyFont();

  @override
  Widget build(BuildContext context) {
    final LocalDBProvider localDBProvider =
        Provider.of<LocalDBProvider>(context);
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: WillPopScope(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ContextMenu(null, supportUI, true, true),
            ProfileImage(
                null, supportUI, bebelucyColor, bebelucyFont, localDBProvider),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ProfileName(null, supportUI, bebelucyColor, bebelucyFont,
                    localDBProvider),
                ProfileGender(null, supportUI, bebelucyColor, localDBProvider),
                ProfileBirth(null, supportUI, bebelucyColor, bebelucyFont,
                    localDBProvider),
                ProfileBloodType(null, supportUI, bebelucyColor, bebelucyFont,
                    localDBProvider)
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
