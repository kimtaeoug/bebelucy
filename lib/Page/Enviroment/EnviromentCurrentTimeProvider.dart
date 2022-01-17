import 'dart:async';
import 'dart:isolate';
import 'package:bebelucy_flutter/Logger/LoggerFactory.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:timezone/standalone.dart' as tz;

class EnviromentCurrentTimeProvider with ChangeNotifier{
  static final EnviromentCurrentTimeProvider enviromentCurrentTimeProvider = EnviromentCurrentTimeProvider._init();
  EnviromentCurrentTimeProvider._init();
  factory EnviromentCurrentTimeProvider() => enviromentCurrentTimeProvider;
  final LoggerFactory _log = LoggerFactory();
  late Isolate _timeIsolate;
  late ReceivePort _timeReceivePort;
  String nowTime = '';

  getCurrentTime() => nowTime;

  void updateEnviromentCurrentTime()async{
    try{
      _log.logI('start timer');
      final tz.Location seoulTime = tz.getLocation('Asia/Seoul');
      _timeReceivePort = ReceivePort();
      SendPort sendPort = _timeReceivePort.sendPort;
      _timeIsolate = await Isolate.spawn(executeTimeOnIsolate, [sendPort, seoulTime]);
      _timeReceivePort.listen((data) async{
        if(data is SendPort){
          data.send('start');
        }else{
          nowTime = data;
          notifyListeners();
        }
      });
    }catch(e){
      _log.logE('$e');
    }
  }
  static void executeTimeOnIsolate(List<Object> argument) async{
    SendPort sendPort = argument[0] as SendPort;
    tz.Location seoulTime = argument[1] as tz.Location;
    final ReceivePort isolateReceivePort = ReceivePort();
    final SendPort isolateSendPort = isolateReceivePort.sendPort;
    sendPort.send(isolateSendPort);
    tz.setLocalLocation(seoulTime);
    isolateReceivePort.listen((message) {
      if(message == 'start'){
        Timer.periodic(Duration(seconds: 30), (timer) {
          tz.TZDateTime now = tz.TZDateTime.now(seoulTime);
          String dayName = refineDayName(DateFormat('EEEE').format(now));
          String amPm = now.hour >= 12? '오후':'오전';
          String hour = now.hour >= 10? '${now.hour}':'0${now.hour}';
          String minute = now.minute > 10? '${now.minute}':'0${now.minute}';
          sendPort.send('${now.month}월 ${now.day}일 ($dayName) $amPm $hour:$minute 기준');
        });
      }
    });
  }
  static String refineDayName(String rawDayName){
    String result = '월';
    switch(rawDayName){
      case 'Monday':
        result = '월';
        break;
      case 'Tuesday':
        result = '화';
        break;
      case 'Wednesday':
        result = '수';
        break;
      case 'Thursday':
        result = '목';
        break;
      case 'Friday':
        result = '금';
        break;
      case 'Saturday':
        result = '토';
        break;
      case 'Sunday':
        result = '일';
        break;
    }
    return result;
  }
  void killEnviromentCurrentTime() {
    _timeReceivePort.close();
    _timeIsolate.kill(priority: Isolate.immediate);
    _log.logI('EnviromentCurrent is killed');
  }
}

