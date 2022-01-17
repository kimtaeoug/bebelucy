import 'package:flutter/cupertino.dart';

import '../../BebelucyColor.dart';
import '../../SupportUI.dart';
import 'SettingPushSwitch.dart';

class SettingPushItem extends StatelessWidget{
  final SupportUI _supportUI;
  final BebelucyColor _bebelucyColor;
  final TextStyle settingTitleTextStyle;
  final TextStyle settingDescriptionTextStyle;
  SettingPushItem(Key? key, this._supportUI, this._bebelucyColor, this.settingTitleTextStyle, this.settingDescriptionTextStyle)
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                      'images/notification_icon.png',
                      width: _supportUI.resWidth(16),
                      height: _supportUI.resHeight(16),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(left: _supportUI.resWidth(16)),child: Text('푸시 알림', style: settingTitleTextStyle,),),
                ],
              ),
              SettingPushSwitch(null, _supportUI, _bebelucyColor)
            ],
          ),
        ),
      ),
    );
  }
}