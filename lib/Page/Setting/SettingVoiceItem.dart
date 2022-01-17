import 'package:flutter/cupertino.dart';

import '../../BebelucyColor.dart';
import '../../SupportUI.dart';
import 'SettingVoiceSwitch.dart';

class SettingVoiceItem extends StatelessWidget{
  final SupportUI _supportUI;
  final BebelucyColor _bebelucyColor;
  final TextStyle settingTitleTextStyle;
  final TextStyle settingDescriptionTextStyle;
  SettingVoiceItem(Key? key, this._supportUI, this._bebelucyColor, this.settingTitleTextStyle, this.settingDescriptionTextStyle)
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
                      'images/mic_icon.png',
                      width: _supportUI.resWidth(16),
                      height: _supportUI.resHeight(16),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(left: _supportUI.resWidth(16)),child: Text('음성 인식', style: settingTitleTextStyle,),),
                ],
              ),
              SettingVoiceSwitch(null, _supportUI, _bebelucyColor)
            ],
          ),
        ),
      ),
    );
  }
}