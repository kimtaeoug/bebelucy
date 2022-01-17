import 'package:bebelucy_flutter/BLECommunicate/BLEProvider.dart';
import 'package:bebelucy_flutter/BebelucyColor.dart';
import 'package:bebelucy_flutter/BebelucyFont.dart';
import 'package:bebelucy_flutter/Page/BLEScan/BLEScanProvider.dart';
import 'package:bebelucy_flutter/Page/CommonUI/BebeToast.dart';
import 'package:bebelucy_flutter/SupportUI.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Routes.dart';

class BLEScanDeviceName extends StatelessWidget{
  final SupportUI _supportUI;
  final BebelucyColor _bebelucyColor;
  final BebelucyFont _bebelucyFont;
  final BLEScanProvider _bleScanProvider;
  final BLEProvider _bleProvider;
  BLEScanDeviceName(Key? key, this._supportUI, this._bebelucyColor, this._bebelucyFont, this._bleScanProvider, this._bleProvider):super(key: key);
  late final TextStyle _deviceTextStyle = TextStyle(
    color: _bebelucyColor.lynch,
    fontFamily: _bebelucyFont.appleM,
    fontSize: _supportUI.resFontSize(20),
    fontWeight: FontWeight.bold
  );
  late bool _isPercentMaximum;
  late bool _isConnect;
  @override
  Widget build(BuildContext context) {
    _isPercentMaximum = _bleScanProvider.getIsPercentMaximum();
    _isConnect = _bleProvider.getIsConnected();
    return AnimatedOpacity(
      opacity: _isPercentMaximum? 1:0,
      duration: const Duration(milliseconds: 500),
      child: Container(
        width: _supportUI.deviceWidth * 8 / 9,
        height: _supportUI.deviceHieght / 8,
        color: _bebelucyColor.white,
        child: Center(
          child: Text(
            _isPercentMaximum&&_isConnect?'BABYCRIB':'기기 연결 실패',
            style: _deviceTextStyle,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
