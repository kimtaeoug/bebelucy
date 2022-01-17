import 'dart:async';

import 'package:flutter/cupertino.dart';

class SplashProvider with ChangeNotifier{
  static final SplashProvider _splashProvider = SplashProvider._init();
  SplashProvider._init();
  factory SplashProvider() => _splashProvider;

  bool isRotationEnd = false;
  void setIsRotationEnd(bool input){
    isRotationEnd = input;
    notifyListeners();
  }
  bool getIsRotationEnd() => isRotationEnd;



}