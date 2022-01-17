import 'package:flutter/cupertino.dart';

class EnviromentProvider with ChangeNotifier{
  int witchActivated = 1;
  void setWitchActivated(int input){
    witchActivated = input;
    notifyListeners();
  }
  getWitchActivated()=>witchActivated;
}