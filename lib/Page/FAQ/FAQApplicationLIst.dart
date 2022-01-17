import 'package:bebelucy_flutter/Page/FAQ/FAQDrawer.dart';
import 'package:flutter/cupertino.dart';

import '../../BebelucyColor.dart';
import '../../BebelucyFont.dart';
import '../../SupportUI.dart';
import 'FAQList.dart';

class FAQApplicationLIst extends StatelessWidget {
  final SupportUI _supportUI;
  final BebelucyColor _bebelucyColor;
  final BebelucyFont _bebelucyFont;
  final FAQList _faqList;
  final TextStyle titleTextStyle;

  FAQApplicationLIst(Key? key, this._supportUI, this._bebelucyColor,
      this._bebelucyFont, this._faqList, this.titleTextStyle)
      : super(key: key);
  late final List<String> titleList = _faqList.applicationFAQTitle;
  late final List<String> contentsList = _faqList.applicationFAQContents;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
              top: _supportUI.resHeight(7),
              bottom: _supportUI.resHeight(7),
              left: _supportUI.resWidth(30)),
          child: Align(
            alignment: AlignmentDirectional.topStart,
            child: Text(
              '앱 관련 질문 ${titleList.length} 건',
              style: titleTextStyle,
            ),
          ),
        ),
        SizedBox(
          height: _supportUI.deviceHieght * 0.65,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: List.generate(
                  titleList.length,
                  (index) => FAQDrawer(null, _supportUI, _bebelucyColor,
                      _bebelucyFont, titleList[index], contentsList[index])),
            ),
          ),
        )
      ],
    );
  }
}
