import 'dart:typed_data';

import 'package:bebelucy_flutter/LocalDB/HeartRateModel.dart';
import 'package:bebelucy_flutter/LocalDB/LocalDBFactory.dart';
import 'package:bebelucy_flutter/LocalDB/WeightModel.dart';
import 'package:bebelucy_flutter/Logger/LoggerFactory.dart';
import 'package:flutter/cupertino.dart';

class LocalDBProvider with ChangeNotifier {
  static final LocalDBProvider localDBProvider = LocalDBProvider._init();

  LocalDBProvider._init();

  factory LocalDBProvider() => localDBProvider;
  final LoggerFactory _log = LoggerFactory();
  final LocalDBFactory _localDBFactory = LocalDBFactory();

  Future<void> initLocalDBProvider() async {
    try {
      loadProfileData();
      loadWeightData();
      loadHeartRateData();
    } catch (e) {
      _log.logE('$e');
    }
  }

  late Uint8List? image;
  late String name;
  late String gender;
  late int birth;
  late String bloodType;

  //loadProfileData
  void loadProfileData() async {
    try {
      image = await _localDBFactory.selectProfileImage();
      name = await _localDBFactory.selectProfileName();
      gender = await _localDBFactory.selectProfileGender();
      birth = await _localDBFactory.selectProfileBirth();
      if(birth != 0){
        setAfterBirth(birth);
      }
      bloodType = await _localDBFactory.selectProfileBloodType();
    } catch (e) {
      _log.logE('$e');
    }
  }

  void setProfileImage(Uint8List input) async {
    image = input;
    notifyListeners();
    _localDBFactory.updateProfileImage(input);
  }

  getProfileImage() => image;

  void setProfileName(String input) async {
    name = input;
    notifyListeners();
    _localDBFactory.updateProfileName(input);
  }

  getProfileName() => name;

  void setProfileGender(String input) async {
    gender = input;
    notifyListeners();
    _localDBFactory.updateProfileGender(input);
  }

  getProfileGender() => gender;

  void setProfileBirth(int input) async {
    birth = input;
    setAfterBirth(input);
    notifyListeners();
    _localDBFactory.updateProfileBirth(input);
  }

  getProfileBirth() => birth;

  void setProfileBloodType(String input) async {
    bloodType = input;
    notifyListeners();
    _localDBFactory.updateProfileBloodType(input);
  }

  getProfileBloodType() => bloodType;

  int afterBirth = 0;
  void setAfterBirth(int input)async{
    DateTime inputDate = DateTime.fromMillisecondsSinceEpoch(input);
    afterBirth = DateTime.now().difference(inputDate).inDays;
    // afterBirth = AgeCalculator.dateDifference(fromDate: inputDate, toDate: DateTime.now()).days;
    notifyListeners();
  }
  getAfterBirth() => afterBirth;
  //Weight data
  List<WeightModel> weightDataList = [];
  int weightIdx = 0;

  void loadWeightData() async {
    try {
      weightDataList = await _localDBFactory.selectWeightData();
      if (weightDataList.isNotEmpty) {
        weightIdx = weightDataList.last.id;
        _log.logI('Select Weight Data is executed');
      } else {
        _log.logI('Select Weight Data is executed. But that is empty.');
      }
    } catch (e) {
      _log.logE('$e');
    }
  }

  void addWeightData(double weight, String date) async {
    try {
      weightIdx = weightIdx + 1;
      weightDataList
          .add(WeightModel(id: weightIdx, weight: weight, date: date));
      notifyListeners();
      await _localDBFactory
          .insertWeightData(weight, date)
          .then((_) => _log.logI('Weight Data is added'));
    } catch (e) {
      _log.logE('$e');
    }
  }

  getWeightData() => weightDataList;

  //HeartRate data
  List<HeartRateModel> heartRateDataList = [];
  int heartRateIdx = 0;

  void loadHeartRateData() async {
    try {
      heartRateDataList = await _localDBFactory.selectHeartRateData();
      if (heartRateDataList.isNotEmpty) {
        heartRateIdx = heartRateDataList.last.id;
        _log.logI('Select HeartRate Data is executed');
      } else {
        _log.logI('Select HeartRate Data is executed. But that is empty.');
      }
    } catch (e) {
      _log.logE('$e');
    }
  }

  void addHeartRateData(double systolic, double diastolic, String date) async {
    try {
      heartRateIdx = heartRateIdx + 1;
      heartRateDataList.add(HeartRateModel(
          id: heartRateIdx,
          systolic: systolic,
          diastolic: diastolic,
          date: date));
      notifyListeners();
      await _localDBFactory
          .insertHeartRateData(systolic, diastolic, date)
          .then((_) => _log.logI('HeartRate Data is added'));
    } catch (e) {
      _log.logE('$e');
    }
  }

  getHeartRateData() => heartRateDataList;
}
