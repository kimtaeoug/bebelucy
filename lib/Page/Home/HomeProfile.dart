import 'package:bebelucy_flutter/LocalDB/LocalDBProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../BebelucyColor.dart';
import '../../BebelucyFont.dart';
import '../../SupportUI.dart';

class HomeProfile extends StatelessWidget {
  final SupportUI _supportUI;
  final BebelucyColor _bebelucyColor;
  final BebelucyFont _bebelucyFont;
  final LocalDBProvider localDBProvider;

  HomeProfile(Key? key, this._supportUI, this._bebelucyColor,
      this._bebelucyFont, this.localDBProvider)
      : super(key: key);

  late final TextStyle welcomeTextStyle = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.normal,
      fontFamily: _bebelucyFont.appleM,
      fontSize: _supportUI.resFontSize(12));
  late final TextStyle adjactiveTextStyle = TextStyle(
      color: _bebelucyColor.paradiso,
      fontWeight: FontWeight.normal,
      fontFamily: _bebelucyFont.appleEB,
      fontSize: _supportUI.resFontSize(16));
  late final TextStyle nameTextStyle = TextStyle(
      color: _bebelucyColor.bigStone,
      fontFamily: _bebelucyFont.appleEB,
      fontSize: _supportUI.resFontSize(27),
      fontWeight: FontWeight.w300);
  late final TextStyle birthTextStyle = TextStyle(
      color: _bebelucyColor.white,
      fontFamily: _bebelucyFont.capmtonM,
      fontSize: _supportUI.resFontSize(14));
  late final TextStyle afterBirthTextStyle = TextStyle(
      color: _bebelucyColor.white,
      fontFamily: _bebelucyFont.camptonBold,
      fontSize: _supportUI.resFontSize(16),
      fontWeight: FontWeight.bold);
  late int birth;
  int year = 2021;
  int month = 09;
  int day = 6;
  late String name;

  @override
  Widget build(BuildContext context) {
    birth = localDBProvider.getProfileBirth();
    DateTime refinedDate = DateTime.fromMillisecondsSinceEpoch(birth);
    year = refinedDate.year;
    month = refinedDate.month;
    day = refinedDate.day;
    String monthFormat = month < 10 ? '0$month' : '$month';
    String dayFormat = day < 10 ? '0$day' : '$day';
    name = localDBProvider.getProfileName();

    return GestureDetector(
      child: SizedBox(
        height: _supportUI.resHeight(78),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: _getLovelyTextSize(),
                      height: _supportUI.resHeight(16),
                      child: Text(
                        '반가워요♥',
                        style: welcomeTextStyle,
                        textAlign: TextAlign.start,
                      ),
                    ),
                    SizedBox(
                      height: _supportUI.resHeight(21),
                      child: Text(
                        '사랑스러운',
                        style: adjactiveTextStyle,
                        textAlign: TextAlign.start,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: _supportUI.resHeight(37),
                  child: Align(
                    alignment: AlignmentDirectional.bottomCenter,
                    child: Text(
                      name == 'dummy'?'김엠마':name,
                      style: nameTextStyle,
                      textAlign: TextAlign.start,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: _supportUI.resHeight(5)),
              child: Container(
                width: _supportUI.resWidth(153),
                height: _supportUI.resHeight(25),
                decoration: BoxDecoration(
                    color: _bebelucyColor.purpleHeart,
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: _supportUI.resHeight(2)),
                      child: Text(
                        '$year.$monthFormat.$dayFormat',
                        style: birthTextStyle,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: _supportUI.resWidth(5),
                          bottom: _supportUI.resHeight(1)),
                      child: Text(
                        '생후',
                        style: birthTextStyle,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: _supportUI.resHeight(3)),
                      child: Text(
                        '${localDBProvider.getAfterBirth()}',
                        style: afterBirthTextStyle,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: _supportUI.resHeight(1)),
                      child: Text(
                        '일',
                        style: birthTextStyle,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  //adjactiveTextStyle
  double _getLovelyTextSize(){
    final TextPainter _textPainter = TextPainter(
      text: TextSpan(text: '사랑스러운', style: adjactiveTextStyle),
      textDirection: TextDirection.ltr
    )..layout();
    return _textPainter.size.width;
  }
}
