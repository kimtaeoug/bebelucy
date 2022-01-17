import 'package:flutter_tts/flutter_tts.dart';

class TtsFactory{
  final FlutterTts flutterTts = FlutterTts();
  static final TtsFactory _ttsFactory = TtsFactory._init();
  TtsFactory._init();
  factory TtsFactory() => _ttsFactory;
  Future<void> initTTS()async{
    await flutterTts.setLanguage('en-US');
    await flutterTts.setPitch(0.9);
    await flutterTts.setSpeechRate(1.0);
    await flutterTts.setVolume(1.0);
    await flutterTts.awaitSpeakCompletion(true);
  }
  Future<void> speak() async{
    await flutterTts.speak('Run the command');
  }
}
