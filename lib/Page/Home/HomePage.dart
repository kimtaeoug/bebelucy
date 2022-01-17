import 'package:bebelucy_flutter/LocalDB/LocalDBProvider.dart';
import 'package:bebelucy_flutter/Page/CommonUI/BebeToast.dart';
import 'package:bebelucy_flutter/Page/Home/HomeBottom.dart';
import 'package:bebelucy_flutter/Page/Home/HomeTop.dart';
import 'package:bebelucy_flutter/Permission/PermissionFunction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../BebelucyColor.dart';
import '../../BebelucyFont.dart';
import '../../Routes.dart';
import '../../SupportUI.dart';

class HomePage extends StatelessWidget {
  final SupportUI _supportUI = SupportUI();
  final BebelucyColor _bebelucyColor = BebelucyColor();
  final BebelucyFont _bebelucyFont = BebelucyFont();

  @override
  Widget build(BuildContext context) {
    final LocalDBProvider localDBProvider =
        Provider.of<LocalDBProvider>(context);
    return SafeArea(
        child: Scaffold(
      backgroundColor: _bebelucyColor.white,
      body: WillPopScope(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: _supportUI.deviceWidth,
              height: _supportUI.deviceHieght * 0.3,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/home_top.png'),
                      fit: BoxFit.fill)),
              child: HomeTop(null, _supportUI, _bebelucyColor, localDBProvider),
            ),
            Expanded(child: HomeBottom(null, _supportUI, _bebelucyColor, _bebelucyFont,
                localDBProvider)),
            Container(
              width: _supportUI.deviceWidth,
              height: _supportUI.resHeight(50),
              decoration: BoxDecoration(
                  color: _bebelucyColor.zumthor,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30))),
            )
          ],
        ),
        onWillPop: () {
          // Navigator.pushNamedAndRemoveUntil(context, Routes.SplashPage, (route) => false);
          return Future(() => false);
        },
      ),
    ));
  }
}
