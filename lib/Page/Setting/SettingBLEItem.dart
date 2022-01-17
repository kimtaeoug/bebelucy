import 'package:bebelucy_flutter/BLECommunicate/BLEProvider.dart';
import 'package:bebelucy_flutter/BebelucyFont.dart';
import 'package:bebelucy_flutter/Page/BLEScan/BLEScanProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../BebelucyColor.dart';
import '../../Routes.dart';
import '../../SupportUI.dart';

class SettingBLEItem extends StatelessWidget {
  final SupportUI _supportUI;
  final BebelucyColor _bebelucyColor;
  final TextStyle settingTitleTextStyle;
  final TextStyle settingDescriptionTextStyle;
  final BebelucyFont _bebelucyFont;

  SettingBLEItem(
      Key? key,
      this._supportUI,
      this._bebelucyColor,
      this.settingTitleTextStyle,
      this.settingDescriptionTextStyle,
      this._bebelucyFont)
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BLEProvider _bleProvider = Provider.of<BLEProvider>(context);
    final BLEScanProvider _bleScanProvider = Provider.of<BLEScanProvider>(context);
    return GestureDetector(
      onTap: () => _resetBLEDialog(context, _bleProvider, _bleScanProvider),
      child: Container(
        width: _supportUI.deviceWidth * 0.88,
        height: _supportUI.deviceHieght * 0.094,
        decoration: BoxDecoration(
            border: Border.all(color: _bebelucyColor.onahau),
            borderRadius: BorderRadius.all(Radius.circular(30)),
            color: _bebelucyColor.zumthor),
        child: Center(
          child: SizedBox(
            width: _supportUI.deviceWidth * 0.77,
            height: _supportUI.resHeight(24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Image.asset(
                        'images/ble_icon.png',
                        width: _supportUI.resWidth(16),
                        height: _supportUI.resHeight(16),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: _supportUI.resWidth(16)),
                      child: Text(
                        '블루투스',
                        style: settingTitleTextStyle,
                      ),
                    ),
                  ],
                ),
                Center(
                  child: Text(
                    'BABYCRIB',
                    style: settingDescriptionTextStyle,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  late final TextStyle _resetBleTextStyle = TextStyle(
      color: _bebelucyColor.codGray,
      fontFamily: _bebelucyFont.appleM,
      fontSize: _supportUI.resFontSize(16));
  late final TextStyle _guideBleTextStyle = TextStyle(
      color: _bebelucyColor.dustyGray,
      fontFamily: _bebelucyFont.appleM,
      fontSize: _supportUI.resFontSize(12));
  late final TextStyle _bleCancelTextStyle = TextStyle(
      color: _bebelucyColor.indigoBlue,
      fontSize: _supportUI.resFontSize(14),
      fontFamily: _bebelucyFont.appleM);
  late final TextStyle _resetTextStyle = TextStyle(
      color: _bebelucyColor.purpleHeart,
      fontSize: _supportUI.resFontSize(14),
      fontFamily: _bebelucyFont.appleM,
      fontWeight: FontWeight.bold);

  Future<void> _resetBLEDialog(BuildContext context, BLEProvider bleProvider, BLEScanProvider bleScanProvider) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        barrierColor: Colors.black.withOpacity(0.5),
        builder: (BuildContext context) {
          return Dialog(
            insetPadding: EdgeInsets.symmetric(
                horizontal: _supportUI.deviceWidth * 0.23,
                vertical: _supportUI.deviceHieght * 0.375),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                    child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '블루투스 재설정을\n하시겠습니까?',
                        style: _resetBleTextStyle,
                        textAlign: TextAlign.center,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: _supportUI.resHeight(3)),
                        child: Text(
                          '탐색을 위해 블루투스\n설정 페이지로 이동됩니다',
                          style: _guideBleTextStyle,
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                )),
                Container(
                  height: _supportUI.resHeight(2),
                  color: _bebelucyColor.onahau,
                ),
                SizedBox(
                  height: _supportUI.deviceHieght * 0.05,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: SizedBox(
                          width: _supportUI.deviceWidth * 0.27,
                          child: Center(
                            child: Text(
                              '취소',
                              style: _bleCancelTextStyle,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          bleScanProvider.setIsPercentMaximum(false);
                          bleProvider.disconnectBLE();
                          Navigator.pushNamedAndRemoveUntil(context, Routes.bleScanPage, (route) => false);
                        },
                        child: SizedBox(
                          width: _supportUI.deviceWidth * 0.27,
                          child: Center(
                            child: Text(
                              '재설정',
                              style: _resetTextStyle,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }
}
