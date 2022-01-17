import 'package:flutter/cupertino.dart';

import '../../../BebelucyColor.dart';
import '../../../SupportUI.dart';

class UltraFineDust extends StatelessWidget{
  final SupportUI _supportUI;
  final BebelucyColor _bebelucyColor;
  final TextStyle titleTextStyle;
  final TextStyle valueTextStyle;
  final TextStyle itemTextStyle2;
  final int ultraFineDustValue;
  UltraFineDust(Key? key, this._supportUI, this._bebelucyColor, this.titleTextStyle,
      this.valueTextStyle, this.itemTextStyle2, this.ultraFineDustValue) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _supportUI.resWidth(150),
      height: _supportUI.resWidth(150)*16/15,
      decoration: BoxDecoration(
        color: _bebelucyColor.white,
        border: Border.all(color: _bebelucyColor.outrageousOrange, width: 2),
        borderRadius: BorderRadius.all(Radius.circular(15)),
        boxShadow: [
          BoxShadow(
              color:
              _bebelucyColor.monaLisa,
              spreadRadius: 2,
              blurRadius: 2,
              offset: Offset(4.0, 2.0)),
        ],
      ),
      child: Center(
        child: SizedBox(
          width: _supportUI.resWidth(126),
          height: _supportUI.resHeight(145),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                    alignment: AlignmentDirectional.topStart,
                    child: Padding(
                      padding: EdgeInsets.only(top: _supportUI.resHeight(10)),
                      child: SizedBox(
                        width: _supportUI.resWidth(60),
                        height: _supportUI.resHeight(3),
                        child: Image.asset('images/ultrafinedust_bar.png'),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: _supportUI.resHeight(3),
                        left: _supportUI.resWidth(2)
                    ),
                    child: Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: SizedBox(
                        width: _supportUI.resWidth(90),
                        height: _supportUI.resHeight(20),
                        child: Text(
                          '현재 초미세먼지',
                          style: titleTextStyle,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: SizedBox(
                  width: _supportUI.resWidth(126),
                  height: _supportUI.resHeight(35),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(ultraFineDustValue.toString(), style: valueTextStyle),
                      Padding(padding: EdgeInsets.only(top: _supportUI.resHeight(10)), child: Text(
                        ' ㎍/㎥',
                        style: itemTextStyle2,
                      ),)
                    ],
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional.bottomEnd,
                child: SizedBox(
                  width: _supportUI.resWidth(34),
                  height: _supportUI.resHeight(34),
                  child: Image.asset('images/finedust.png'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}