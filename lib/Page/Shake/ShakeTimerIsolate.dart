import 'dart:async';
import 'dart:isolate';

import 'package:bebelucy_flutter/BLECommunicate/BLEProvider.dart';
import 'package:bebelucy_flutter/Page/Shake/ShakeProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class ShakeTimerIsolate{
  late Isolate _shakeIsolate;
  late ReceivePort _shakeReceivePort;
  void setShakeTimer(BuildContext context, int time) async {
    final ShakeProvider _shakeProvider = Provider.of<ShakeProvider>(context, listen: false);
    final BLEProvider _bleProvider = Provider.of<BLEProvider>(context, listen: false);
    _shakeReceivePort = ReceivePort();
    SendPort _sendPort = _shakeReceivePort.sendPort;
    _shakeIsolate = await Isolate.spawn(startShakeTimerOnIsolate, [_sendPort, time]);
    _shakeReceivePort.listen((message) {
      if(message == 'stop'){
        _shakeProvider.stopShake();
        _bleProvider.stopShake();
        _shakeReceivePort.close();
        _shakeIsolate.kill(priority: Isolate.immediate);
      }else{
        _shakeProvider.setShakeTimerLast(message);
      }
    });
  }
  static void startShakeTimerOnIsolate(List<Object> arguments) async{
    SendPort _sendPort = arguments[0] as SendPort;
    int time = arguments[1] as int;
    DateTime inputTime = DateTime.now().add(Duration(minutes: time));
    Timer.periodic(Duration(seconds: 1), (timer) {
      DateTime now = DateTime.now();
      int lastTime = inputTime.difference(now).inSeconds;
      if(lastTime == 0){
        _sendPort.send('stop');
        timer.cancel();
      }else{
        int rawMinute = lastTime ~/ 60;
        int rawSecond = lastTime - rawMinute*60;
        String minute = rawMinute>=10?'$rawMinute':'0$rawMinute';
        String second = rawSecond>=10?'$rawSecond':'0$rawSecond';
        _sendPort.send('$minute,$second');
      }
    });
  }
  void killShakeTimer(){
    _shakeReceivePort.close();
    _shakeIsolate.kill(priority: Isolate.immediate);
  }
}
