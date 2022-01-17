import 'package:bebelucy_flutter/BebelucyFont.dart';
import 'package:bebelucy_flutter/LocalDB/LocalDBProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../BebelucyColor.dart';
import '../../SupportUI.dart';
import 'ProfileLinear.dart';

class ProfileBirth extends StatelessWidget {
  final SupportUI _supportUI;
  final BebelucyColor _bebelucyColor;
  final BebelucyFont _bebelucyFont;
  final LocalDBProvider localDBProvider;

  ProfileBirth(Key? key, this._supportUI, this._bebelucyColor,
      this._bebelucyFont, this.localDBProvider)
      : super(key: key);
  late final TextStyle birthTextStyle = TextStyle(
      fontFamily: _bebelucyFont.capmtonM,
      color: _bebelucyColor.pickedBluewood,
      fontSize: _supportUI.resFontSize(23),
      fontWeight: FontWeight.w500);
  late final TextStyle afterBirthTextStyle = TextStyle(
      fontFamily: _bebelucyFont.appleB,
      fontWeight: FontWeight.w500,
      color: _bebelucyColor.pickedBluewood,
      fontSize: _supportUI.resFontSize(15));
  late final TextStyle afterBirthNumberStyle = TextStyle(
      fontFamily: _bebelucyFont.camptonSemiBold,
      color: _bebelucyColor.pickedBluewood,
      fontSize: _supportUI.resFontSize(18),
      fontWeight: FontWeight.bold);
  late int birth;
  int year = 2021;
  int month = 9;
  int day = 6;

  @override
  Widget build(BuildContext context) {
    birth = localDBProvider.getProfileBirth();
    DateTime refinedBirth = DateTime.fromMillisecondsSinceEpoch(birth);
    year = refinedBirth.year;
    month = refinedBirth.month;
    day = refinedBirth.day;
    String monthFormat = month < 10 ? '0$month' : '$month';
    String dayFormat = day < 10 ? '0$day' : '$day';
    return GestureDetector(
      onTap: () => showCalendar(context),
      child: SizedBox(
        width: _supportUI.deviceWidth * 0.83,
        height: _supportUI.resHeight(74),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: _supportUI.resHeight(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: _supportUI.resWidth(21),
                    height: _supportUI.resHeight(16),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: _supportUI.resWidth(8)),
                        child: SizedBox(
                          width: _supportUI.deviceWidth * 0.35,
                          height: _supportUI.resHeight(28),
                          child: Center(
                            child: Text(
                              '$year.$monthFormat.$dayFormat',
                              style: birthTextStyle,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: _supportUI.resHeight(28),
                        child: Center(
                          child: SizedBox(
                            height: _supportUI.resHeight(24),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '생후 ',
                                  style: afterBirthTextStyle,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: _supportUI.deviceHieght * 0.005),
                                  child: Text(
                                    '${localDBProvider.getAfterBirth()}',
                                    style: afterBirthNumberStyle,
                                  ),
                                ),
                                Text(
                                  ' 일',
                                  style: afterBirthTextStyle,
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: _supportUI.resWidth(5)),
                    child: SizedBox(
                      width: _supportUI.resWidth(16),
                      height: _supportUI.resHeight(16),
                      child: Image.asset('images/birth_image.png'),
                    ),
                  )
                ],
              ),
            ),
            ProfileLinear(null, _supportUI, _bebelucyColor)
          ],
        ),
      ),
    );
  }
  late final TextTheme calendarTextTheme = TextTheme(
                  //data textStyle
                  caption: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontFamily: _bebelucyFont.capmtonM),
                  //header testStyle
                  headline4: TextStyle(
                      overflow: TextOverflow.fade,
                      fontWeight: FontWeight.w900,
                      fontFamily: _bebelucyFont.camptonBold,
                      fontSize: _supportUI.resFontSize(23)),
  );
  late final TextButtonThemeData calendarTextButtonTheme = TextButtonThemeData(
      style: TextButton.styleFrom(
          primary: _bebelucyColor.bigStone,
          textStyle: TextStyle(
              fontWeight: FontWeight.w600,
              fontFamily: _bebelucyFont.appleB,
              fontSize: _supportUI.resFontSize(15)))
  );
  late final ColorScheme calendarColorScheme = ColorScheme.light(
    //header background color
    primary: _bebelucyColor.onahau,
    //header text color
    onPrimary: _bebelucyColor.black,
    //body text color
    onSurface: _bebelucyColor.black,
  );

  Future<void> showCalendar(BuildContext context) async {
    late DateTime? selectedDate;
    DateTime now = DateTime.now();
    DateTime first = DateTime(now.year - 3, now.month, now.day);
    selectedDate = await showDatePicker(
        locale: const Locale('ko', 'KO'),
        context: context,
        initialDate: now,
        firstDate: first,
        lastDate: now,
        confirmText: '적용',
        helpText: '날짜를 선택해주세요.',
        initialEntryMode: DatePickerEntryMode.calendarOnly,
        builder: (BuildContext context, Widget? child) {
          return Theme(
              data: ThemeData.light().copyWith(
                textTheme: calendarTextTheme,
                dialogBackgroundColor: _bebelucyColor.aliceBlue,
                colorScheme: calendarColorScheme,
                textButtonTheme: calendarTextButtonTheme,
              ),
              child: child!);
        });
    if (selectedDate != null) {
      DateTime dummy =
          DateTime(selectedDate.year, selectedDate.month, selectedDate.day);
      localDBProvider.setProfileBirth(dummy.millisecondsSinceEpoch);
    }
  }
}
