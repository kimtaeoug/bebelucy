import 'package:bebelucy_flutter/BebelucyColor.dart';
import 'package:bebelucy_flutter/BebelucyFont.dart';
import 'package:bebelucy_flutter/Page/CommonUI/LongList.dart';
import 'package:bebelucy_flutter/Page/WhiteNoise/WhiteNoiseProvider.dart';
import 'package:bebelucy_flutter/SupportUI.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WhiteNoiseTimerSetting extends StatefulWidget {
  final SupportUI _supportUI;
  final BebelucyColor _bebelucyColor;
  final BebelucyFont _bebelucyFont;
  final WhiteNoiseProvider whiteNoiseProvider;

  WhiteNoiseTimerSetting(Key? key, this._supportUI, this._bebelucyColor,
      this._bebelucyFont, this.whiteNoiseProvider)
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _WhiteNoiseTimerSetting();
}

class _WhiteNoiseTimerSetting extends State<WhiteNoiseTimerSetting> {
  late final SupportUI _supportUI = widget._supportUI;
  late final BebelucyColor _bebelucyColor = widget._bebelucyColor;
  late final BebelucyFont _bebelucyFont = widget._bebelucyFont;
  late final WhiteNoiseProvider whiteNoiseProvider = widget.whiteNoiseProvider;

  late final TextStyle timeTextStyle = TextStyle(
      fontFamily: _bebelucyFont.capmtonM,
      fontSize: _supportUI.resFontSize(35),
      color: _bebelucyColor.regentGray,
      fontWeight: FontWeight.w800);
  late final TextStyle timeUnitTextStyle = TextStyle(
      fontSize: _supportUI.resFontSize(20),
      fontFamily: _bebelucyFont.capmtonM,
      color: _bebelucyColor.regentGray);
  late final TextStyle titleTextStyle = TextStyle(
      fontSize: _supportUI.resFontSize(16),
      color: Colors.black,
      fontFamily: _bebelucyFont.appleM);
  late final TextStyle checkTextStyle = TextStyle(
      color: _bebelucyColor.white,
      fontSize: _supportUI.resFontSize(14),
      fontFamily: _bebelucyFont.appleEB);
  int minuteValue = 0;
  int hourValue = 0;
  final List<String> hourList = ['0', '1', '2'];
  final LongList longList = LongList();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: _bebelucyColor.white,
      insetPadding: EdgeInsets.symmetric(
          vertical: _supportUI.deviceHieght * 11 / 37,
          horizontal: _supportUI.deviceWidth * 7 / 36),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: SizedBox(
        width: _supportUI.deviceWidth * 11 / 18,
        height: _supportUI.deviceHieght / 4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: _supportUI.deviceWidth * 11 / 18,
              height: _supportUI.deviceHieght / 16,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: _supportUI.resHeight(2),
                  ),
                  SizedBox(
                    width: _supportUI.deviceWidth * 19 / 36,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: _supportUI.resWidth(12),
                        ),
                        SizedBox(
                          height: _supportUI.resHeight(20),
                          child: Text(
                            '재생 시간 설정',
                            style: titleTextStyle,
                          ),
                        ),
                        SizedBox(
                          height: _supportUI.resHeight(20),
                          child: Center(
                            child: GestureDetector(
                              onTap: () => Navigator.pop(context),
                              child: SizedBox(
                                width: _supportUI.resWidth(12),
                                height: _supportUI.resHeight(12),
                                child:
                                    Image.asset('images/soundplayer_close.png'),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: _supportUI.deviceHieght * 11 / 18,
                    height: _supportUI.resHeight(2),
                    color: _bebelucyColor.onahau,
                  )
                ],
              ),
            ),
            Expanded(
                child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: _supportUI.resWidth(30),
                    height: _supportUI.resHeight(38),
                    child: CupertinoPicker.builder(
                        selectionOverlay:
                            CupertinoPickerDefaultSelectionOverlay(
                          background: Colors.transparent,
                        ),
                        itemExtent: _supportUI.resHeight(38),
                        childCount: hourList.length,
                        onSelectedItemChanged: (value) {
                          setState(() {
                            hourValue = value;
                          });
                        },
                        itemBuilder: (context, idx) {
                          return Center(
                            child: Text(
                              hourList[idx],
                              style: timeTextStyle,
                            ),
                          );
                        }),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: _supportUI.resWidth(5)),
                    child: SizedBox(
                      height: _supportUI.resHeight(38),
                      child: Center(
                        child: Padding(
                          padding:
                              EdgeInsets.only(bottom: _supportUI.resHeight(10)),
                          child: Text(
                            '시간',
                            style: timeUnitTextStyle,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: _supportUI.resWidth(58),
                    height: _supportUI.resHeight(38),
                    child: CupertinoPicker.builder(
                        selectionOverlay:
                            CupertinoPickerDefaultSelectionOverlay(
                          background: Colors.transparent,
                        ),
                        itemExtent: _supportUI.resHeight(38),
                        childCount: longList.minuteList.length,
                        onSelectedItemChanged: (value) {
                          setState(() {
                            minuteValue = value;
                          });
                        },
                        itemBuilder: (context, idx) {
                          return Center(
                            child: Text(
                              longList.minuteList[idx],
                              style: timeTextStyle,
                            ),
                          );
                        }),
                  ),
                  SizedBox(
                    height: _supportUI.resHeight(38),
                    child: Center(
                      child: Padding(
                        padding:
                            EdgeInsets.only(bottom: _supportUI.resHeight(10)),
                        child: Text(
                          '분',
                          style: timeUnitTextStyle,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )),
            GestureDetector(
              onTap: () {
                if (whiteNoiseProvider.getTimerActivation()) {
                  whiteNoiseProvider.resetTimer();
                }
                whiteNoiseProvider.setMusicTimer(
                    context, hourValue * 60 + minuteValue);
                Navigator.pop(context);
              },
              child: Container(
                height: _supportUI.deviceHieght / 18,
                decoration: BoxDecoration(
                    color: _bebelucyColor.purpleHeart,
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(10))),
                child: Center(
                  child: Text(
                    '확인',
                    style: checkTextStyle,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
