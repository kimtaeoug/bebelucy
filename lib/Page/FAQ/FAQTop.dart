import 'package:bebelucy_flutter/Page/FAQ/FAQProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../BebelucyColor.dart';
import '../../BebelucyFont.dart';
import '../../SupportUI.dart';
import 'FAQNavigation.dart';

class FAQTop extends StatelessWidget {
  final SupportUI _supportUI;
  final BebelucyColor _bebelucyColor;
  final BebelucyFont _bebelucyFont;
  final FAQProvider faqProvider;

  FAQTop(Key? key, this._supportUI, this._bebelucyColor, this._bebelucyFont,
      this.faqProvider)
      : super(key: key);
  late final TextStyle questionTextStyle = TextStyle(
      color: _bebelucyColor.black,
      fontWeight: FontWeight.bold,
      fontSize: _supportUI.resFontSize(20),
      fontFamily: _bebelucyFont.camptonBold);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: _supportUI.resHeight(12)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: _supportUI.resHeight(12), left: _supportUI.resWidth(20)),
            child: Align(
              alignment: AlignmentDirectional.topStart,
              child: SizedBox(
                height: _supportUI.resHeight(27),
                child: Text(
                  '자주 묻는 질문',
                  style: questionTextStyle,
                ),
              ),
            ),
          ),
          FAQNavigation(
              null, _supportUI, _bebelucyColor, _bebelucyFont, faqProvider)
        ],
      ),
    );
  }
}
