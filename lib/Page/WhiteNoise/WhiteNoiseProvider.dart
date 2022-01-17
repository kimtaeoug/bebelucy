import 'dart:async';
import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:bebelucy_flutter/Logger/LoggerFactory.dart';
import 'package:bebelucy_flutter/Page/WhiteNoise/WhiteNoiseTimer.dart';
import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';

class WhiteNoiseProvider with ChangeNotifier {
  static final WhiteNoiseProvider whiteNoiseProvider =
      WhiteNoiseProvider._init();

  WhiteNoiseProvider._init();

  factory WhiteNoiseProvider() => whiteNoiseProvider;

  final LoggerFactory _log = LoggerFactory();

  bool waveActivation = false;
  bool windActivation = false;
  bool rainActivation = false;
  bool fallenleavesActivation = false;
  bool cricketActivation = false;
  bool bonfireActivation = false;
  bool shhActivation = false;
  bool streamActivation = false;
  bool birdActivation = false;

  bool getActivation(String title) {
    bool result = false;
    switch (title) {
      case 'wave':
        result = waveActivation;
        break;
      case 'wind':
        result = windActivation;
        break;
      case 'rain':
        result = rainActivation;
        break;
      case 'fallenleaves':
        result = fallenleavesActivation;
        break;
      case 'cricket':
        result = cricketActivation;
        break;
      case 'bonfire':
        result = bonfireActivation;
        break;
      case 'shh':
        result = shhActivation;
        break;
      case 'stream':
        result = streamActivation;
        break;
      case 'bird':
        result = birdActivation;
        break;
    }
    return result;
  }

  void setActivation(String title, bool activation) {
    switch (title) {
      case 'wave':
        waveActivation = activation;
        break;
      case 'wind':
        windActivation = activation;
        break;
      case 'rain':
        rainActivation = activation;
        break;
      case 'fallenleaves':
        fallenleavesActivation = activation;
        break;
      case 'cricket':
        cricketActivation = activation;
        break;
      case 'bonfire':
        bonfireActivation = activation;
        break;
      case 'shh':
        shhActivation = activation;
        break;
      case 'stream':
        streamActivation = activation;
        break;
      case 'bird':
        birdActivation = activation;
        break;
    }
    notifyListeners();
  }

  // 0 : mute, 1 : max
  double waveVolume = 0.5;
  double windVolume = 0.5;
  double rainVolume = 0.5;
  double fallenleavesVolume = 0.5;
  double cricketVolume = 0.5;
  double bonfireVolume = 0.5;
  double shhVolume = 0.5;
  double streamVolume = 0.5;
  double birdVolume = 0.5;

  void setVolume(String title, double volume) {
    switch (title) {
      case 'wave':
        waveVolume = volume;
        audioPlayerMap[title]!.setVolume(waveVolume);
        break;
      case 'wind':
        windVolume = volume;
        audioPlayerMap[title]!.setVolume(windVolume);
        break;
      case 'rain':
        rainVolume = volume;
        audioPlayerMap[title]!.setVolume(rainVolume);
        break;
      case 'fallenleaves':
        fallenleavesVolume = volume;
        audioPlayerMap[title]!.setVolume(fallenleavesVolume);
        break;
      case 'cricket':
        cricketVolume = volume;
        audioPlayerMap[title]!.setVolume(cricketVolume);
        break;
      case 'bonfire':
        bonfireVolume = volume;
        audioPlayerMap[title]!.setVolume(bonfireVolume);
        break;
      case 'shh':
        shhVolume = volume;
        audioPlayerMap[title]!.setVolume(shhVolume);
        break;
      case 'stream':
        streamVolume = volume;
        audioPlayerMap[title]!.setVolume(streamVolume);
        break;
      case 'bird':
        birdVolume = volume;
        audioPlayerMap[title]!.setVolume(birdVolume);
        break;
    }
    notifyListeners();
  }

  double getVolume(String title) {
    double result = 0.5;
    switch (title) {
      case 'wave':
        result = waveVolume;
        break;
      case 'wind':
        result = windVolume;
        break;
      case 'rain':
        result = rainVolume;
        break;
      case 'fallenleaves':
        result = fallenleavesVolume;
        break;
      case 'cricket':
        result = cricketVolume;
        break;
      case 'bonfire':
        result = bonfireVolume;
        break;
      case 'shh':
        result = shhVolume;
        break;
      case 'stream':
        result = streamVolume;
        break;
      case 'bird':
        result = birdVolume;
        break;
    }
    return result;
  }

  final Map<String, AudioPlayer> audioPlayerMap = {
    'wave': AudioPlayer(playerId: 'wave'),
    'wind': AudioPlayer(playerId: 'wind'),
    'rain': AudioPlayer(playerId: 'rain'),
    'fallenleaves': AudioPlayer(playerId: 'fallenleaves'),
    'cricket': AudioPlayer(playerId: 'cricket'),
    'bonfire': AudioPlayer(playerId: 'bonfire'),
    'shh': AudioPlayer(playerId: 'shh'),
    'stream': AudioPlayer(playerId: 'stream'),
    'bird': AudioPlayer(playerId: 'bird')
  };

  Future<void> playMusic(String title) async {
    try {
      AudioCache audioCache =
          AudioCache(prefix: 'audios/', fixedPlayer: audioPlayerMap[title]!);
      String musicPath = '${title}_sound.mp3';
      await audioCache.loop(musicPath, mode: PlayerMode.MEDIA_PLAYER);
      _log.logI('$title is Started...');
    } catch (e) {
      _log.logE('$e in playMusic');
    }
  }

  Future<void> stopMusic(String title) async {
    try {
      await audioPlayerMap[title]!.stop();
      _log.logI('$title is stop');
    } catch (e) {
      _log.logE('$e in stopMusic');
    }
  }

  int timerTime = 0;
  bool timerActivation = false;

  getTimerTime() => timerTime;

  getTimerActivation() => timerActivation;

  final WhiteNoiseTimer whiteNoiseTimer = WhiteNoiseTimer();

  void setMusicTimer(BuildContext context, int input) {
    whiteNoiseTimer.setWhiteNoiseTimer(context, input);
    timerTime = input;
    timerActivation = true;
    notifyListeners();
  }

  int lastTime = 0;

  void setLastTime(int input) {
    lastTime = input;
    notifyListeners();
  }

  getLastTime() => lastTime;

  void setAllActivationClear() {
    waveActivation = false;
    windActivation = false;
    rainActivation = false;
    fallenleavesActivation = false;
    cricketActivation = false;
    bonfireActivation = false;
    shhActivation = false;
    streamActivation = false;
    birdActivation = false;
    timerActivation = false;
    timerTime = 0;
    lastTime = 0;
    notifyListeners();
  }

  void stopAllAudioPlayer() {
    for (AudioPlayer player in audioPlayerMap.values) {
      player.stop();
    }
  }

  void resetTimer() {
    whiteNoiseTimer.killTheTime();
  }

  void stopTimer() {
    whiteNoiseTimer.killTheTime();
    stopAllAudioPlayer();
    setAllActivationClear();
    stopLocalMomSoundPlayer();
    timerActivation = false;
    notifyListeners();
  }

  String convertToKorean(String input) {
    String result = '파도';
    switch (input) {
      case 'wind':
        result = '바람';
        break;
      case 'rain':
        result = '비';
        break;
      case 'fallenleaves':
        result = '낙엽';
        break;
      case 'cricket':
        result = '풀벌레';
        break;
      case 'bonfire':
        result = '모닥불';
        break;
      case 'shh':
        result = '쉬';
        break;
      case 'stream':
        result = '시냇물';
        break;
      case 'bird':
        result = '새';
        break;
    }
    return result;
  }

  AudioPlayer localMomSoundPlayer = AudioPlayer(playerId: 'momSound');
  String localMomSoundFile = '';
  void setLocalMomSoundFile(String input){
    localMomSoundFile = input;
    notifyListeners();
  }
  String getLocalMomSoundFile() => localMomSoundFile;
  bool localMomSoundActivation = false;
  void setLocalMomSoundActivation(bool input){
    localMomSoundActivation = input;
    notifyListeners();
  }
  getLocalMomSoundActivation() => localMomSoundActivation;

  void initPlayLocalMomSound(){
    localMomSoundPlayer.setReleaseMode(ReleaseMode.LOOP);
  }
  Future<void> playLocalMomSound(String path) async{
    try{
      localMomSoundPlayer.play(localMomSoundFile, isLocal: true);
      setLocalMomSoundActivation(true);
    }catch(e){
      _log.logE('$e in playLocalMomSound');
    }
  }
  double localMomSoundPlayerVolume = 0.5;
  void setLocalMomSoundPlayerVolume(double volume){
    localMomSoundPlayerVolume = volume;
    localMomSoundPlayer.setVolume(volume);
    notifyListeners();
  }
  double getLocalMomSoundPlayerVolume() => localMomSoundPlayerVolume;
  void stopLocalMomSoundPlayer(){
    localMomSoundPlayer.stop();
    setLocalMomSoundActivation(false);
  }
}
