import 'package:bebelucy_flutter/BebelucyColor.dart';
import 'package:bebelucy_flutter/LocalDB/LocalDBProvider.dart';
import 'package:bebelucy_flutter/Page/Home/HomeIcon.dart';
import 'package:bebelucy_flutter/Page/Home/HomeProfile.dart';
import 'package:bebelucy_flutter/SupportUI.dart';
import 'package:flutter/cupertino.dart';

import '../../BebelucyFont.dart';
import '../../Routes.dart';

class HomeBottom extends StatelessWidget {
  final SupportUI _supportUI;
  final BebelucyColor _bebelucyColor;
  final BebelucyFont _bebelucyFont;
  final LocalDBProvider localDBProvider;

  HomeBottom(Key? key, this._supportUI, this._bebelucyColor, this._bebelucyFont,
      this.localDBProvider)
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        HomeProfile(
            null, _supportUI, _bebelucyColor, _bebelucyFont, localDBProvider),
        Expanded(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: _supportUI.deviceWidth * 0.66,
              height: _supportUI.resHeight(117),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  HomeIcon(null, _supportUI, _bebelucyColor, _bebelucyFont,
                      '베베모니터', 'main_monitoring_img', Routes.cameraPage),
                  HomeIcon(null, _supportUI, _bebelucyColor, _bebelucyFont,
                      '베베환경', 'main_enviroment_img', Routes.enviromentPage)
                ],
              ),
            ),
            SizedBox(
              width: _supportUI.deviceWidth * 0.66,
              height: _supportUI.resHeight(117),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  HomeIcon(null, _supportUI, _bebelucyColor, _bebelucyFont,
                      '베베흔들', 'main_shake_img', Routes.shakePage),
                  HomeIcon(null, _supportUI, _bebelucyColor, _bebelucyFont,
                      '엄마소리', 'main_sound_img', Routes.whiteNoisePage)
                ],
              ),
            )
          ],
        ))
      ],
    );
  }
}
