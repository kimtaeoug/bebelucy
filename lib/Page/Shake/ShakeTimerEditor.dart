import 'package:bebelucy_flutter/BebelucyColor.dart';
import 'package:bebelucy_flutter/BebelucyFont.dart';
import 'package:bebelucy_flutter/Page/CommonUI/LongList.dart';
import 'package:bebelucy_flutter/Page/Shake/ShakeProvider.dart';
import 'package:bebelucy_flutter/SupportUI.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShakeTimerEditor extends StatefulWidget{
  final SupportUI _supportUI;
  final BebelucyColor _bebelucyColor;
  final BebelucyFont _bebelucyFont;
  final ShakeProvider _shakeProvider;
  ShakeTimerEditor(Key? key, this._supportUI, this._bebelucyColor, this._bebelucyFont, this._shakeProvider):super(key: key);
  @override
  State<StatefulWidget> createState() =>_ShakeTimerEditor();
}

class _ShakeTimerEditor extends State<ShakeTimerEditor>{
  late final SupportUI _supportUI = widget._supportUI;
  late final BebelucyColor _bebelucyColor = widget._bebelucyColor;
  late final BebelucyFont _bebelucyFont = widget._bebelucyFont;
  late final ShakeProvider _shakeProvider = widget._shakeProvider;

  final List<String> hourList = ['0','1'];
  final LongList longList = LongList();

  late final TextStyle titleTextStyle = TextStyle(
    fontSize: _supportUI.resFontSize(16),
    fontFamily: _bebelucyFont.appleM,
    color: _bebelucyColor.black
  );
  late final TextStyle hourTextStyle = TextStyle(
    fontFamily: _bebelucyFont.capmtonM,
    fontSize: _supportUI.resFontSize(35),
    fontWeight: FontWeight.w700,
    color: _bebelucyColor.regentGray
  );
  late final TextStyle unitTextStyle = TextStyle(
    fontFamily: _bebelucyFont.appleM,
    fontSize: _supportUI.resFontSize(20),
    color: _bebelucyColor.regentGray
  );
  late final TextStyle checkTextStyle = TextStyle(
    fontSize: _supportUI.resFontSize(14),
    fontFamily: _bebelucyFont.appleM,
    color: _bebelucyColor.white
  );
  int _hour = 0;
  int _minute = 0;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: _bebelucyColor.white,
      insetPadding: EdgeInsets.symmetric(
        vertical: _supportUI.deviceHieght*23/64,
        horizontal: _supportUI.deviceWidth*7/36
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10))
      ),
      child: SizedBox(
        width: _supportUI.deviceWidth*11/18,
        height: _supportUI.deviceHieght*9/32,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: _supportUI.deviceWidth*11/18,
              height: _supportUI.deviceHieght/16,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: _supportUI.resHeight(2),
                  ),
                  SizedBox(
                    width: _supportUI.deviceWidth*11/18 - _supportUI.resWidth(30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: _supportUI.resWidth(12),
                        ),
                        SizedBox(
                          width: _supportUI.deviceWidth*5/18,
                          height: _supportUI.resHeight(20),
                          child: Text('흔들기 시간 설정', style: titleTextStyle, textAlign: TextAlign.center,),
                        ),
                        SizedBox(
                          height: _supportUI.resHeight(28),
                          child: Center(
                            child: GestureDetector(
                              onTap: ()=>Navigator.pop(context),
                              child: SizedBox(
                                width: _supportUI.resWidth(12),
                                height: _supportUI.resHeight(12),
                                child: Image.asset('images/soundplayer_close.png'),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: _supportUI.deviceWidth*11/18,
                    height: _supportUI.resHeight(2),
                    color: _bebelucyColor.onahau,
                  )
                ],
              ),
            ),
            SizedBox(
              width: _supportUI.deviceWidth*11/24,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: _supportUI.resWidth(25),
                    height: _supportUI.resHeight(38),
                    child: CupertinoPicker.builder(
                        selectionOverlay: CupertinoPickerDefaultSelectionOverlay(background: Colors.transparent,),
                      backgroundColor: _bebelucyColor.white,
                        itemExtent: _supportUI.resHeight(38),
                        onSelectedItemChanged: (value){
                          setState(() {
                            _hour = value;
                          });
                        },
                        childCount: hourList.length,
                        itemBuilder: (context, idx){
                          return Center(
                            child: Text(hourList[idx], style: hourTextStyle, textAlign: TextAlign.center,),
                          );
                        }),
                  ),
                  SizedBox(
                    height: _supportUI.resHeight(38),
                    child: Center(
                      child: SizedBox(
                        width: _supportUI.resWidth(56),
                        height: _supportUI.resHeight(24),
                        child: Center(
                          child: Text('시간', style: unitTextStyle, textAlign: TextAlign.center,),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: _supportUI.resWidth(58),
                    height: _supportUI.resHeight(38),
                    child: CupertinoPicker.builder(
                        selectionOverlay: CupertinoPickerDefaultSelectionOverlay(background: Colors.transparent,),
                      backgroundColor: _bebelucyColor.white,
                        itemExtent: _supportUI.resHeight(38),
                        onSelectedItemChanged: (value){
                          setState(() {
                            _minute = value;
                          });
                        },
                        childCount: longList.minuteList.length,
                        itemBuilder: (context, idx){
                          return Center(
                            child: Text(longList.minuteList[idx], style: hourTextStyle, textAlign: TextAlign.center,),
                          );
                        }),
                  ),
                  SizedBox(
                    height: _supportUI.resHeight(38),
                    child: Center(
                      child: SizedBox(
                        height: _supportUI.resHeight(24),
                        child: Center(
                          child: Text('분', style: unitTextStyle,),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: (){
                if(_hour == 0 && _minute == 0){
                  _shakeProvider.resetShakeTimer();
                }else{
                  _shakeProvider.setShakeTime(context, _hour, _minute);
                }
                Navigator.pop(context);
              },
              child: Container(
                width: _supportUI.deviceWidth*11/18,
                height: _supportUI.deviceHieght/16,
                decoration: BoxDecoration(
                    color: _bebelucyColor.purpleHeart,
                    borderRadius: BorderRadius.vertical(bottom: Radius.circular(10))
                ),
                child: Center(
                  child: Text('확인', style: checkTextStyle,),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
