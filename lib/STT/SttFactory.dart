import 'dart:async';
import 'dart:io';
import 'dart:isolate';
import 'package:bebelucy_flutter/Logger/LoggerFactory.dart';
import 'package:bebelucy_flutter/TTS/TtsFactory.dart';
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class SttFactory{
  final SpeechToText speech = SpeechToText();
  static final SttFactory _sttFactory = SttFactory._init();
  SttFactory._init();
  factory SttFactory() => _sttFactory;
  final LoggerFactory loggerFactory = LoggerFactory();

  Future<void> initStt() async{
    await speech.initialize(
      onError:  errorListener,
      onStatus:  statusListener,
      debugLogging: true,
      finalTimeout: const Duration(milliseconds: 5)
    );
  }
  void errorListener(SpeechRecognitionError error){
    loggerFactory.logE('$error in SttFactory');
    sleep(const Duration(microseconds: 10));
    startListening();
  }
  void statusListener(String status){
    loggerFactory.logI('STT Status : $status');
  }
  void stopListening() async{
    await speech.stop();
  }
  void cancelListening() async{
    await speech.cancel();
  }
  void startListening()async{
    await speech.listen(
      onResult: resultListener,
      listenFor: const Duration(seconds: 30),
      pauseFor: const Duration(seconds: 5),
      partialResults: true,
      cancelOnError: false,
      listenMode: ListenMode.dictation
    );
  }
  static TtsFactory _ttsFactory = TtsFactory();
  void resultListener(SpeechRecognitionResult result){
    print('${result.recognizedWords}');
    _ttsFactory.speak();
    sleep(const Duration(microseconds: 10));
    startListening();
  }
}