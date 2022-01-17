import 'package:bebelucy_flutter/BebelucyColor.dart';
import 'package:bebelucy_flutter/BebelucyFont.dart';
import 'package:bebelucy_flutter/SupportUI.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BabyNowWeight extends StatelessWidget {
  final SupportUI _supportUI;
  final BebelucyColor _bebelucyColor;
  final BebelucyFont _bebelucyFont;

  BabyNowWeight(
      Key? key, this._supportUI, this._bebelucyColor, this._bebelucyFont)
      : super(key: key);
  late final TextStyle weightTitleTextStyle = TextStyle(
      fontFamily: _bebelucyFont.appleM,
      fontSize: _supportUI.resFontSize(12),
      fontWeight: FontWeight.w600,
      color: Colors.black);
  late final TextStyle weightTextStyle = TextStyle(
      fontFamily: _bebelucyFont.camptonBold,
      fontSize: _supportUI.resFontSize(45),
      color: Colors.black,
      fontWeight: FontWeight.w600);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _supportUI.deviceWidth * 8 / 9,
      height: _supportUI.resHeight(80),
      decoration: BoxDecoration(
          color: _bebelucyColor.hawkesBlue,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: _supportUI.resHeight(4)),
                child: SizedBox(
                  width: _supportUI.resWidth(116),
                  height: _supportUI.resHeight(15),
                  child: Center(
                    child: Text(
                      '현재 우리 아이의 몸무게',
                      style: weightTitleTextStyle,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: _supportUI.resWidth(116),
                height: _supportUI.resHeight(43),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: _supportUI.resWidth(86),
                      height: _supportUI.resHeight(43),
                      child: Center(
                        child: Text(
                          '3.5',
                          style: weightTextStyle,
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional.center,
                      child: SizedBox(
                        width: _supportUI.resWidth(30),
                        height: _supportUI.resHeight(28),
                        child: Image.asset('images/kg_img.png'),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          Padding(padding: EdgeInsets.symmetric(horizontal: _supportUI.resWidth(15)), child: SizedBox(
            width: _supportUI.resWidth(55),
            height: _supportUI.resHeight(3),
            child: Image.asset('images/multi_dot.png'),
          ),),
          SizedBox(
            width: _supportUI.resWidth(65),
            height: _supportUI.resHeight(65),
            child: Image.asset('images/weight.png', ),
          )
        ],
      ),
    );
  }
}
