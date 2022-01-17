import 'dart:async';

import 'package:bebelucy_flutter/BLECommunicate/BLEProvider.dart';
import 'package:bebelucy_flutter/BebelucyColor.dart';
import 'package:bebelucy_flutter/BebelucyFont.dart';
import 'package:bebelucy_flutter/Page/BLEScan/BLEScanProvider.dart';
import 'package:bebelucy_flutter/SupportUI.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_blue/flutter_blue.dart';

class BLESearchText extends StatefulWidget{
  final SupportUI _supportUI;
  final BebelucyColor _bebelucyColor;
  final BebelucyFont _bebelucyFont;
  final BLEScanProvider _bleScanProvider;
  final BLEProvider _bleProvider;
  BLESearchText(Key? key, this._supportUI, this._bebelucyColor, this._bebelucyFont, this._bleScanProvider, this._bleProvider):super(key: key);

  @override
  State<StatefulWidget> createState() => _BLESearchText();
}

class _BLESearchText extends State<BLESearchText>{
  late final SupportUI _supportUI = widget._supportUI;
  late final BebelucyColor _bebelucyColor = widget._bebelucyColor;
  late final BebelucyFont _bebelucyFont = widget._bebelucyFont;
  late final BLEScanProvider _bleScanProvider = widget._bleScanProvider;
  late final BLEProvider _bleProvider = widget._bleProvider;

  final FlutterBlue _flutterBlue = FlutterBlue.instance;
  @override
  void initState() {
    scanBLEDevice();
    if(mounted){
      _bleProvider.setBLEProviderBLEContext(context);
    }
    super.initState();
  }
  late final TextStyle searchTextStyle = TextStyle(
    color: _bebelucyColor.bigStone,
    fontFamily: _bebelucyFont.appleM,
    fontSize: _supportUI.resFontSize(18),
  );
  final String _searchText = '블루투스를 검색중입니다';
  final String _completionText = '블루투스 검색 완료';
  late bool _isPercentComplete;
  late final double completionOpacity = _isPercentComplete?1:0;
  late final double opacityLevel = _isPercentComplete?0:1;
  @override
  Widget build(BuildContext context) {
    _isPercentComplete = _bleScanProvider.getIsPercentMaximum();

    return _isPercentComplete?AnimatedOpacity(
      opacity: completionOpacity,
      duration: const Duration(milliseconds: 500),
      child: SizedBox(
        height: _supportUI.resHeight(20),
        child: Text(
          _completionText, style: searchTextStyle, textAlign: TextAlign.center,
        ),
      ),
    ):AnimatedOpacity(
      opacity: opacityLevel,
      duration: const Duration(milliseconds: 500),
      child: SizedBox(
        height: _supportUI.resHeight(20),
        child: Text(
          _searchText, style: searchTextStyle, textAlign: TextAlign.center,
        ),
      ),
    );
  }
  late StreamSubscription _streamSubscription;
  void scanBLEDevice(){
    _flutterBlue.startScan(timeout: const Duration(seconds: 10));
    _streamSubscription = _flutterBlue.scanResults.listen((event) {
      for(ScanResult r in event){
        if(r.device.name == 'BABYCRIB'){
          _bleProvider.setBLEDevice(r.device);
          _streamSubscription.pause();
        }
      }
      if(_streamSubscription.isPaused){
        _bleProvider.initConnect();
        _streamSubscription.cancel();
      }
    });
  }
}


