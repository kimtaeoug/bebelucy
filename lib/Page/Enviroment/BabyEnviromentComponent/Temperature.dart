import 'package:bebelucy_flutter/BebelucyColor.dart';
import 'package:bebelucy_flutter/SupportUI.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Temperature extends StatelessWidget {
  final SupportUI _supportUI;
  final BebelucyColor _bebelucyColor;
  final TextStyle titleTextStyle;
  final TextStyle valueTextStyle;
  final TextStyle itemTextStyle;
  final double temperatureValue;
  Temperature(Key? key, this._supportUI, this._bebelucyColor,
      this.titleTextStyle, this.valueTextStyle, this.itemTextStyle,this.temperatureValue):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _supportUI.resWidth(150),
      height: _supportUI.resWidth(150)*16/15,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: _bebelucyColor.malachite, width: 2),
        borderRadius: BorderRadius.all(Radius.circular(15)),
        boxShadow: [
          BoxShadow(
              color:
                  _bebelucyColor.deYork,
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
                        child: Image.asset('images/temperature_bar.png'),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: _supportUI.resHeight(3),
                        left: _supportUI.resWidth(2)),
                    child: Align(
                      alignment: AlignmentDirectional.topStart,
                      child: SizedBox(
                        width: _supportUI.resWidth(43),
                        height: _supportUI.resHeight(15),
                        child: Text(
                          '현재 기온',
                          style: titleTextStyle,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Align(
                alignment: AlignmentDirectional.center,
                child: SizedBox(
                  width: _supportUI.resWidth(126),
                  height: _supportUI.resHeight(35),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(temperatureValue.toString(), style: valueTextStyle),
                      Padding(
                        padding: EdgeInsets.only(top: _supportUI.resHeight(10)),
                        child: Text(
                          ' °C',
                          style: itemTextStyle,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional.bottomEnd,
                child: SizedBox(
                  width: _supportUI.resWidth(34),
                  height: _supportUI.resHeight(34),
                  child: Image.asset('images/temperature.png'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
