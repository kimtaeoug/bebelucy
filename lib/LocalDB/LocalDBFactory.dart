import 'dart:convert';
import 'dart:typed_data';

import 'package:bebelucy_flutter/LocalDB/ProfileBirthModel.dart';
import 'package:bebelucy_flutter/LocalDB/ProfileBloodTypeModel.dart';
import 'package:bebelucy_flutter/LocalDB/ProfileGenderModel.dart';
import 'package:bebelucy_flutter/LocalDB/ProfileImageModel.dart';
import 'package:bebelucy_flutter/LocalDB/ProfileNameModel.dart';
import 'package:bebelucy_flutter/Logger/LoggerFactory.dart';
import 'package:camera/camera.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'HeartRateModel.dart';
import 'WeightModel.dart';

class LocalDBFactory {
  static final LocalDBFactory localDBFactory = LocalDBFactory._init();

  LocalDBFactory._init();

  factory LocalDBFactory() => localDBFactory;
  final LoggerFactory _log = LoggerFactory();
  final String localDBName = 'bebelucyDB.db';
  final String profileImageTableName = 'profileImageTable';
  final String profileNameTableName = 'profileNameTable';
  final String profileGenderTableName = 'profileGenderTable';
  final String profileBirthTableName = 'profileBirthTable';
  final String profileBloodTypeTableName = 'profileBloodTypeTable';
  final String weightTableName = 'weightTable';
  final String heartRateTableName = 'heartRateTable';
  late Database _database;

  Future<void> initLocalDB() async {
    String path = join(await getDatabasesPath(), localDBName);
    _database =
        await openDatabase(path, version: 1, onCreate: (db, version) async {
      //profile table
      await db.execute('''
        CREATE TABLE $profileImageTableName(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          image BLOB
        )
      ''').then((_) =>  _log.logI('ProfileImage Table is created'));
      //  //   await _database.rawInsert('INSERT INTO $profileImageTableName(image) VALUES(?)', image).then((value) => _log.logI('ImageData'))
      await db.execute('''
        CREATE TABLE $profileNameTableName(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name TEXT
        )
      ''').then((_) async {
        await db.execute('INSERT INTO $profileNameTableName(name) VALUES(?)',
            ['dummy']).then((_) => _log.logI('ProfileName Table is created'));
      });
      await db.execute('''
        CREATE TABLE $profileGenderTableName(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          gender TEXT
        )
      ''').then((_) async {
        db.execute('INSERT INTO $profileGenderTableName(gender) VALUES(?)',
            ['dummy']).then((_) => _log.logI('ProfileGender Table is created'));
      });
      await db.execute('''
        CREATE TABLE $profileBirthTableName(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          birth INTEGER
        )
      ''').then((_) async {
        db.execute('INSERT INTO $profileBirthTableName(birth) VALUES(?)',
            [0]).then((_) => _log.logI('ProfileBirth Table is created'));
      });
      await db.execute('''
        CREATE TABLE $profileBloodTypeTableName(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          bloodType TEXT
        )
      ''').then((_) async {
        db.execute(
            'INSERT INTO $profileBloodTypeTableName(bloodType) VALUES(?)', [
          'dummy'
        ]).then((_) => _log.logI('ProfileBloodType Table is created'));
      });
      //weight table
      await db.execute('''
          CREATE TABLE $weightTableName(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            weight REAL,
            date TEXT
          )
          ''').then((_) => _log.logI('Weight Table is created'));
      //heartRate Table
      await db.execute('''
          CREATE TABLE $heartRateTableName(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            systolic REAL,
            diastolic REAL,
            date TEXT
          ) 
          ''').then((value) => _log.logI('HeartRate Table is created'));
    });
  }

  Future<void> updateProfileImage(Uint8List input) async {
    _database.rawUpdate(
        'UPDATE $profileImageTableName SET image = ? WHERE id = 1',
        [input]).then((value) => _log.logI('Profile image is updated'));
  }

  Future<Uint8List?> selectProfileImage() async {
    List<Map<String, dynamic>> maps = await _database
        .rawQuery('SELECT * FROM $profileImageTableName WHERE id = 1');
    List<ProfileImageModel> result = List.generate(
        maps.length,
        (index) => ProfileImageModel(
            id: maps[index]['id'], image: maps[index]['image']));
    if(result.isEmpty){
      return null;
    }
    Uint8List encodingImage = result[0].image;
    return encodingImage;
  }

  Future<void> updateProfileName(String input) async {
    _database.rawUpdate(
        'UPDATE $profileNameTableName SET name = ? WHERE id = 1',
        [input]).then((_) => _log.logI('Profile Name is updated'));
  }

  Future<String> selectProfileName() async {
    List<Map<String, dynamic>> maps =
        await _database.rawQuery('SELECT * FROM $profileNameTableName');
    List<ProfileNameModel> result = List.generate(
        maps.length,
        (index) =>
            ProfileNameModel(id: maps[index]['id'], name: maps[index]['name']));
    String selectedName = result[0].name;
    return selectedName;
  }

  Future<void> updateProfileGender(String input) async {
    _database.rawUpdate(
        'UPDATE $profileGenderTableName SET gender = ? WHERE id = 1',
        [input]).then((_) => _log.logI('Profile Gender is updated'));
  }

  Future<String> selectProfileGender() async {
    List<Map<String, dynamic>> maps =
        await _database.rawQuery('SELECT * FROM $profileGenderTableName');
    List<ProfileGenderModel> result = List.generate(
        maps.length,
        (index) => ProfileGenderModel(
            id: maps[index]['id'], gender: maps[index]['gender']));
    String selectedGender = result[0].gender;
    return selectedGender;
  }

  Future<void> updateProfileBirth(int input) async {
    await _database.rawUpdate(
        'UPDATE $profileBirthTableName SET birth = ? WHERE id = 1',
        [input]).then((value) => _log.logI('Profile Birth is updated'));
  }

  Future<int> selectProfileBirth() async {
    List<Map<String, dynamic>> maps = await _database
        .rawQuery('SELECT * FROM $profileBirthTableName WHERE id = 1');
    List<ProfileBirthModel> result = List.generate(
        maps.length,
        (index) => ProfileBirthModel(
            id: maps[index]['id'], birth: maps[index]['birth']));
    int selectedBirth = result[0].birth;
    return selectedBirth;
  }

  Future<void> updateProfileBloodType(String input) async {
    await _database.rawUpdate(
        'UPDATE $profileBloodTypeTableName SET bloodType = ? WHERE id = 1',
        [input]).then((_) => _log.logI('Profile BloodType is updated'));
  }

  Future<String> selectProfileBloodType() async {
    List<Map<String, dynamic>> maps = await _database
        .rawQuery('SELECT * FROM $profileBloodTypeTableName WHERE id = 1');
    List<ProfileBloodTypeModel> result = List.generate(
        maps.length,
        (index) => ProfileBloodTypeModel(
            id: maps[index]['id'], bloodType: maps[index]['bloodType']));
    String selectedBloodType = result[0].bloodType;
    return selectedBloodType;
  }

  Future<void> insertWeightData(double weight, String date) async {
    await _database.rawInsert(
        'INSERT INTO $weightTableName(weight, date) VALUES(?, ?)',
        [weight, date]).then((_) => _log.logI('Weight Data is Inserted'));
  }

  Future<List<WeightModel>> selectWeightData() async {
    List<Map<String, dynamic>> maps =
        await _database.rawQuery('SELECT * FROM $weightTableName');
    return List.generate(
        maps.length,
        (index) => WeightModel(
            id: maps[index]['id'],
            weight: maps[index]['weight'],
            date: maps[index]['date']));
  }

  Future<void> insertHeartRateData(
      double systolic, double diastolic, String date) async {
    await _database.rawInsert(
        'INSERT INTO $heartRateTableName(systolic, diastolic, date) VALUES(?, ?, ?)',
        [
          systolic,
          diastolic,
          date
        ]).then((_) => _log.logI('HeartRate Data is Inserted'));
  }

  Future<List<HeartRateModel>> selectHeartRateData() async {
    List<Map<String, dynamic>> maps =
        await _database.rawQuery('SELECT * FROM $heartRateTableName');
    return List.generate(
        maps.length,
        (index) => HeartRateModel(
            id: maps[index]['id'],
            systolic: maps[index]['systolic'],
            diastolic: maps[index]['diastolic'],
            date: maps[index]['date']));
  }
}
