import 'package:flutter/cupertino.dart';

class BLEScanProvider with ChangeNotifier{
  static final BLEScanProvider _bleScanProvider = BLEScanProvider._init();
  BLEScanProvider._init();
  factory BLEScanProvider() => _bleScanProvider;

  bool isPercentMaximum = false;
  bool isBLEIconAnimationDone = false;
  bool getIsPercentMaximum() => isPercentMaximum;
  void setIsPercentMaximum(bool input){
    isPercentMaximum = input;
    notifyListeners();
  }
  bool getIsBLEIconAnimationDone() => isBLEIconAnimationDone;
  void setIsBLEIconAnimationDone(bool input){
    isBLEIconAnimationDone = input;
    notifyListeners();
  }
}