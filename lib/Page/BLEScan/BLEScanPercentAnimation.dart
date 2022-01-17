import 'dart:async';

import 'package:bebelucy_flutter/BLECommunicate/BLEProvider.dart';
import 'package:bebelucy_flutter/BebelucyColor.dart';
import 'package:bebelucy_flutter/BebelucyFont.dart';
import 'package:bebelucy_flutter/MemberShip/MemberShipFactory.dart';
import 'package:bebelucy_flutter/Page/BLEScan/BLEScanProvider.dart';
import 'package:bebelucy_flutter/Page/CommonUI/LongList.dart';
import 'package:bebelucy_flutter/SupportUI.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Routes.dart';

class BLEScanPercentAnimation extends StatefulWidget{
  final SupportUI _supportUI;
  final BebelucyColor _bebelucyColor;
  final BebelucyFont _bebelucyFont;
  final BLEScanProvider _bleScanProvider;
  final BLEProvider _bleProvider;
  BLEScanPercentAnimation(Key? key, this._supportUI, this._bebelucyColor,
      this._bebelucyFont, this._bleScanProvider, this._bleProvider)
      : super(key: key);
  @override
  State<StatefulWidget> createState() => _BLEScanPercentAnimation();
}


class _BLEScanPercentAnimation extends State<BLEScanPercentAnimation> {
  late final SupportUI _supportUI = widget._supportUI;
  late final BebelucyColor _bebelucyColor = widget._bebelucyColor;
  late final BebelucyFont _bebelucyFont = widget._bebelucyFont;
  late final BLEScanProvider _bleScanProvider = widget._bleScanProvider;
  late final BLEProvider _bleProvider = widget._bleProvider;

  final ScrollController _scrollController = ScrollController();
  final LongList _longList = LongList();
  late final TextStyle percentTextStyle = TextStyle(
      fontSize: _supportUI.resFontSize(12),
      fontFamily: _bebelucyFont.capmtonM,
      color: _bebelucyColor.bigStone);

  final MemberShipFactory _memberShipFactory = MemberShipFactory();
  @override
  void initState() {
    super.initState();
    int idx = 0;
    Timer.periodic(const Duration(seconds: 2), (timer)async {
      idx += 1;
      if(idx == 1){
        await _scrollController.animateTo(
            _scrollController.position.maxScrollExtent,
            duration: const Duration(seconds: 10),
            curve: Curves.linear);
      }
      if(idx == 7){
        _bleScanProvider.setIsPercentMaximum(true);
        if(_bleProvider.getIsConnected()) {
          _bleProvider.showDeviceConnectionToast();
        }else{
          _bleProvider.showDeviceConnectionFailToast();
        }
      }
      if(idx == 8){
        if(_bleProvider.getIsConnected()){
          if(_memberShipFactory.getCurrentUser() != null){
            Navigator.pushNamedAndRemoveUntil(context, Routes.homePage, (route) => false);
          }else{
            Navigator.pushNamedAndRemoveUntil(context, Routes.loginPage, (route) => false);
          }
        }else{
          //연결실패시
          Navigator.pushNamedAndRemoveUntil(context, Routes.bleScanPage, (route) => false);
          _bleScanProvider.setIsPercentMaximum(false);
        }
        timer.cancel();
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          bottom: _supportUI.resHeight(40), top: _supportUI.resWidth(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: _supportUI.resWidth(40),
            height: _supportUI.resHeight(15),
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                controller: _scrollController,
                shrinkWrap: true,
                itemCount: _longList.hundred.length,
                itemBuilder: (context, idx) {
                  return SizedBox(
                    height: _supportUI.resHeight(15),
                    child: Text(
                      _longList.hundred[idx],
                      style: percentTextStyle,
                      textAlign: TextAlign.end,
                    ),
                  );
                }),
          ),
          SizedBox(
            width: _supportUI.resWidth(15),
            height: _supportUI.resHeight(15),
            child: Text(
              '%',
              style: percentTextStyle,
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
