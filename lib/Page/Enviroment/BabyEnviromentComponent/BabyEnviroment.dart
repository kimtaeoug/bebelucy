import 'package:bebelucy_flutter/BLECommunicate/BLEProvider.dart';
import 'package:bebelucy_flutter/BLECommunicate/BabyEnviromentDto.dart';
import 'package:bebelucy_flutter/BebelucyColor.dart';
import 'package:bebelucy_flutter/BebelucyFont.dart';
import 'package:bebelucy_flutter/Page/Enviroment/BabyEnviromentComponent/FineDust.dart';
import 'package:bebelucy_flutter/Page/Enviroment/BabyEnviromentComponent/Humidity.dart';
import 'package:bebelucy_flutter/Page/Enviroment/BabyEnviromentComponent/Temperature.dart';
import 'package:bebelucy_flutter/Page/Enviroment/BabyEnviromentComponent/UltraFineDust.dart';
import 'package:bebelucy_flutter/SupportUI.dart';
import 'package:flutter/cupertino.dart';

class BabyEnviroment extends StatelessWidget {
  final SupportUI _supportUI;
  final BebelucyColor _bebelucyColor;
  final BebelucyFont _bebelucyFont;
  final BLEProvider _bleProvider;
  BabyEnviroment(
      Key? key, this._supportUI, this._bebelucyColor, this._bebelucyFont, this._bleProvider)
      : super(key: key);

  late final TextStyle titleTextStyle = TextStyle(
      color: _bebelucyColor.codGray,
      fontFamily: _bebelucyFont.appleM,
      fontSize: _supportUI.resFontSize(12));
  late final TextStyle valueTextStyle = TextStyle(
      color: _bebelucyColor.codGray,
      fontFamily: _bebelucyFont.camptonBold,
      fontWeight: FontWeight.w700,
      fontSize: _supportUI.resFontSize(35));
  late final TextStyle itemTextStyle = TextStyle(
      color: _bebelucyColor.codGray,
      fontFamily: _bebelucyFont.capmtonM,
      fontSize: _supportUI.resFontSize(28));
  late final TextStyle itemTextStyle2 = TextStyle(
      color: _bebelucyColor.codGray,
      fontFamily: _bebelucyFont.capmtonM,
      fontSize: _supportUI.resFontSize(16),
      fontWeight: FontWeight.bold);

  late BabyEnviromentDto _babyEnviromentDto;
  late double temperatureValue;
  late int humidityValue;
  late int fineDustValue;
  late int ultraFineDustValue;
  @override
  Widget build(BuildContext context) {
    _babyEnviromentDto = _bleProvider.getBabyEnviromentData();
    temperatureValue = _babyEnviromentDto.temperature;
    humidityValue = _babyEnviromentDto.humidity;
    fineDustValue = _babyEnviromentDto.fineDust;
    ultraFineDustValue = _babyEnviromentDto.ultraFineDust;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
              top: _supportUI.resHeight(25), bottom: _supportUI.resWidth(40)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Temperature(null, _supportUI, _bebelucyColor, titleTextStyle,
                  valueTextStyle, itemTextStyle, temperatureValue),
              SizedBox(
                width: _supportUI.resWidth(15),
              ),
              Humidity(null, _supportUI, _bebelucyColor, titleTextStyle,
                  valueTextStyle, itemTextStyle, humidityValue)
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FineDust(null, _supportUI, _bebelucyColor, titleTextStyle,
                valueTextStyle, itemTextStyle2, fineDustValue),
            SizedBox(
              width: _supportUI.resWidth(15),
            ),
            UltraFineDust(null, _supportUI, _bebelucyColor,
                titleTextStyle, valueTextStyle, itemTextStyle2, ultraFineDustValue)
          ],
        )
      ],
    );
  }
}
