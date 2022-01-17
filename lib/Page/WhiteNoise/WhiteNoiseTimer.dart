import 'dart:async';
import 'dart:isolate';

import 'package:audioplayers/audioplayers.dart';
import 'package:bebelucy_flutter/Logger/LoggerFactory.dart';
import 'package:bebelucy_flutter/Page/WhiteNoise/WhiteNoiseProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class WhiteNoiseTimer{
  late Isolate _timerIsolate;
  late ReceivePort _timerReceiverPort;
  void setWhiteNoiseTimer(BuildContext context, int time) async{
    final WhiteNoiseProvider _whiteNoiseProvider = Provider.of<WhiteNoiseProvider>(context, listen: false);
    final Map<String, AudioPlayer> audioPlayerMap = _whiteNoiseProvider.audioPlayerMap;
    _timerReceiverPort = ReceivePort();
    SendPort _sendPort = _timerReceiverPort.sendPort;
    _timerIsolate = await Isolate.spawn(startMusicTimerOnIsolate, [_sendPort, time]);
    _timerReceiverPort.listen((message) async{
      if(message == 'stop'){
        _whiteNoiseProvider.stopAllAudioPlayer();
        _whiteNoiseProvider.stopLocalMomSoundPlayer();
        _whiteNoiseProvider.setAllActivationClear();
        _timerReceiverPort.close();
        _timerIsolate.kill(priority: Isolate.immediate);
      }else{
        _whiteNoiseProvider.setLastTime(message);
      }
    });
  }
  static void startMusicTimerOnIsolate(List<Object> arguments) async{
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
        _sendPort.send(inputTime.difference(now).inSeconds);
      }
    });
  }
  void killTheTime(){
    _timerReceiverPort.close();
    _timerIsolate.kill(priority: Isolate.immediate);
  }

}
