import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../BebelucyColor.dart';
import '../../Routes.dart';
import '../../SupportUI.dart';

class SettingQuestionItem extends StatelessWidget{
  final SupportUI _supportUI;
  final BebelucyColor _bebelucyColor;
  final TextStyle settingTitleTextStyle;
  final TextStyle settingDescriptionTextStyle;
  SettingQuestionItem(Key? key, this._supportUI, this._bebelucyColor, this.settingTitleTextStyle, this.settingDescriptionTextStyle)
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>Navigator.pushNamed(context, Routes.faqPage),
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
                        'images/help_icon.png',
                        width: _supportUI.resWidth(16),
                        height: _supportUI.resHeight(16),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(left: _supportUI.resWidth(16)),child: Text('도움말', style: settingTitleTextStyle,),),
                  ],
                ),
                Center(
                  child: Text('자주 묻는 질문', style: settingDescriptionTextStyle,),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}