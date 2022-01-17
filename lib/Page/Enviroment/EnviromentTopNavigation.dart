import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../BebelucyColor.dart';
import '../../BebelucyFont.dart';
import '../../SupportUI.dart';
import 'EnviromentProvider.dart';

class EnviromentTopNavigation extends StatelessWidget {
  final SupportUI _supportUI;
  final BebelucyColor _bebelucyColor;
  final BebelucyFont _bebelucyFont;
  final EnviromentProvider enviromentProvider;

  EnviromentTopNavigation(Key? key, this._supportUI, this._bebelucyColor,
      this._bebelucyFont, this.enviromentProvider)
      : super(key: key);
  late int whichIdx;
  late final TextStyle titleTextStyle = TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: _supportUI.resFontSize(10),
      fontFamily: _bebelucyFont.appleM,
      color: Colors.black);
  late final TextStyle titleTextStyle2 = TextStyle(
      fontSize: _supportUI.resFontSize(14),
      fontWeight: FontWeight.w500,
      color: Colors.black,
      fontFamily: _bebelucyFont.appleB);

  @override
  Widget build(BuildContext context) {
    whichIdx = enviromentProvider.getWitchActivated();
    return Padding(
      padding: EdgeInsets.only(top: _supportUI.resHeight(7)),
      child: SizedBox(
        width: _supportUI.deviceWidth,
        height: _supportUI.deviceHieght / 8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: _supportUI.deviceWidth * 7 / 9,
              height: _supportUI.resHeight(62),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => enviromentProvider.setWitchActivated(1),
                    child: EnviromentTopItem(null, _supportUI, _bebelucyColor,
                        '베베환경', titleTextStyle, whichIdx),
                  ),
                  GestureDetector(
                    onTap: () => enviromentProvider.setWitchActivated(2),
                    child: EnviromentTopItem(null, _supportUI, _bebelucyColor,
                        '베베체중', titleTextStyle, whichIdx),
                  ),
                  GestureDetector(
                    onTap: () => enviromentProvider.setWitchActivated(3),
                    child: EnviromentTopItem(null, _supportUI, _bebelucyColor,
                        '베베심박', titleTextStyle, whichIdx),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: _supportUI.resWidth(28)),
              child: Align(
                alignment: AlignmentDirectional.topStart,
                child: SizedBox(
                  width: _supportUI.resWidth(60),
                  height: _supportUI.resHeight(17),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: _supportUI.resHeight(17),
                        child: Center(
                          child: SizedBox(
                            width: _supportUI.resWidth(4),
                            height: _supportUI.resHeight(4),
                            child: Image.asset('images/enviroment_point.png'),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: _supportUI.resHeight(17),
                        child: Center(
                          child: Text(
                            getWhichTitle(whichIdx),
                            style: titleTextStyle2,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  String getWhichTitle(int input) {
    String result = '베베환경';
    if (input == 2) {
      result = '베베체중';
    } else if (input == 3) {
      result = '베베심박';
    }
    return result;
  }
}

class EnviromentTopItem extends StatelessWidget {
  final SupportUI _supportUI;
  final BebelucyColor _bebelucyColor;
  final String title;
  final TextStyle titleTextStyle;
  final int whichIdx;

  EnviromentTopItem(Key? key, this._supportUI, this._bebelucyColor, this.title,
      this.titleTextStyle, this.whichIdx)
      : super(key: key);

  late int itemIdx;

  @override
  Widget build(BuildContext context) {
    itemIdx = getWhichIdx(title);
    return SizedBox(
      width: _supportUI.resWidth(60),
      height: _supportUI.resHeight(62),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            whichIdx == itemIdx
                ? Container(
                    width: _supportUI.resWidth(36),
                    height: _supportUI.resHeight(36),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _bebelucyColor.purpleHeart),
                    child: Center(
                      child: SizedBox(
                        width: _supportUI.resWidth(24),
                        height: _supportUI.resHeight(24),
                        child: Image.asset(getActivatedImage(title)),
                      ),
                    ),
                  )
                : SizedBox(
                    width: _supportUI.resWidth(36),
                    height: _supportUI.resHeight(36),
                    child: Center(
                      child: SizedBox(
                        width: _supportUI.resWidth(36),
                        height: _supportUI.resHeight(36),
                        child: Image.asset(getInActivatedImage(title)),
                      ),
                    ),
                  ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: _supportUI.resHeight(2)),
              child: SizedBox(
                height: _supportUI.resHeight(12),
                child: Center(
                  child: Text(
                    title,
                    style: titleTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            whichIdx == itemIdx
                ? Container(
                    width: _supportUI.resWidth(60),
                    height: _supportUI.resHeight(3),
                    decoration: BoxDecoration(
                        color: _bebelucyColor.purpleHeart,
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                  )
                : SizedBox(
                    height: _supportUI.resHeight(3),
                  )
          ],
        ),
      ),
    );
  }

  String getActivatedImage(String input) {
    String result = 'images/activated_monitoring.png';
    if (input == '베베체중') {
      result = 'images/activated_weight.png';
    } else if (input == '베베심박') {
      result = 'images/activated_heart.png';
    }
    return result;
  }

  String getInActivatedImage(String input) {
    String result = 'images/inactivated_monitoring.png';
    if (input == '베베체중') {
      result = 'images/inactivated_weight.png';
    } else if (input == '베베심박') {
      result = 'images/inactivated_heart.png';
    }
    return result;
  }

  int getWhichIdx(String input) {
    int result = 1;
    if (input == '베베체중') {
      result = 2;
    } else if (input == '베베심박') {
      result = 3;
    }
    return result;
  }
}
