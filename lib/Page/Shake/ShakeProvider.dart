import 'package:bebelucy_flutter/Page/Shake/ShakeRangeAnimationPath.dart';
import 'package:bebelucy_flutter/Page/Shake/ShakeTimerIsolate.dart';
import 'package:bebelucy_flutter/SupportUI.dart';
import 'package:flutter/cupertino.dart';

class ShakeProvider with ChangeNotifier{
  static final ShakeProvider shakeProvider = ShakeProvider._init();
  ShakeProvider._init();
  factory ShakeProvider() => shakeProvider;

  bool shakeActivated = false;
  void setShakeActivated(bool input){
    shakeActivated = input;
    notifyListeners();
  }
  getShakeActivated()=>shakeActivated;


  AnimationController? shakeAnimationController = null;
  void initShakeAnimationController(AnimationController input){
    shakeAnimationController = input;
  }
  AnimationController? getShakeAnimationController()=>shakeAnimationController;

  final ShakeRangeAnimationPath _path = ShakeRangeAnimationPath();
  bool isInitShake = false;
  void initShakeAnimationPath(GlobalKey globalKey){
    BuildContext? _boxContext = globalKey.currentContext;
    if(_boxContext != null){
      RenderBox _renderBox = _boxContext.findRenderObject() as RenderBox;
      _path.initShakeRangePathOffset(_renderBox);
      isInitShake = true;
      notifyListeners();
    }else{
      print('BuildContext is null');
    }
  }
  bool getIsInitShake() => isInitShake;

  String currentPosition = '1';
  late Path routedPath = _path.leftToRight();

  bool isPathCompleted = false;
  void setIsPathCompleted(bool input){
    isPathCompleted = input;
    notifyListeners();
  }
  bool getIsPathCompleted() => isPathCompleted;
  Offset completedPath(){
    Offset offset = _path.leftPosition();
    if(currentPosition == '2'){
      offset = _path.centerPosition();
    }else if(currentPosition == '3'){
      offset = _path.rightPosition();
    }
    return offset;
  }
  void positionRouter(String title){
    switch(currentPosition){
      case '1':
        if(title == '2'){
          routedPath = _path.leftToCenter();
        }else if(title == '3'){
          routedPath = _path.leftToRight();
        }
        break;
      case '2':
        if(title == '1'){
          routedPath = _path.centerToLeft();
        }else if(title == '3'){
          routedPath = _path.centerToRight();
        }
        break;
      case '3':
        if(title == '1'){
          routedPath = _path.rightToLeft();
        }else if(title == '2'){
          routedPath = _path.rightToCenter();
        }
    }
    currentPosition = title;
    isPathCompleted = false;
    notifyListeners();
  }
  String getCurrentPosition() => currentPosition;
  Path getCurrentPath() => routedPath;
  void stopShake(){
    setShakeActivated(false);
  }
  final ShakeTimerIsolate _shakeTimerIsolate = ShakeTimerIsolate();
  int shakeTime = 0;
  void setShakeTime(BuildContext context, int hour, int minute){
    shakeTime = hour*60 + minute;
    _shakeTimerIsolate.setShakeTimer(context, shakeTime);
    setShakeActivated(true);
  }
  String lastTime = '';
  void setShakeTimerLast(String input){
    lastTime = input;
    notifyListeners();
  }
  String getShakeTimerLast() => lastTime;

  void resetShakeTimer(){
    _shakeTimerIsolate.killShakeTimer();
    setShakeActivated(false);
  }

}