// import 'dart:convert';
// import 'dart:typed_data';
//
// import 'package:bebelucy_flutter/Logger/LoggerFactory.dart';
// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';
//
// import 'BabyImageDto.dart';
//
//
// class DBFactory{
//   static final DBFactory dbFactory = DBFactory._init();
//   DBFactory._init();
//   factory DBFactory() => dbFactory;
//   late Database _database;
//   final String babyImageTableName = 'babyImage';
//   final LoggerFactory loggerFactory = LoggerFactory();
//   void initDB() async{
//     String path = join(await getDatabasesPath(), 'bebelucyDB.db');
//     _database = await openDatabase(
//         path,
//         version: 1,
//         onCreate: (db, version) async{
//           await db.execute(
//               '''
//             CREATE TABLE $babyImageTableName(
//               id INTEGER PRIMARY KEY AUTOINCREMENT,
//               image TEXT
//             )
//           '''
//           ).then((_){
//             loggerFactory.logI('$babyImageTableName is created');
//           });
//         }
//     );
//   }
//
//   Future<void> insertBabyImageData(List<int> babyImageBytes)async{
//     String babyImage = base64Encode(babyImageBytes);
//     BabyImageDto babyImageDto = BabyImageDto(id: 1, image: babyImage);
//     await _database.insert(babyImageTableName, babyImageDto.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
//     loggerFactory.logI('Inserted BabyImageData');
//   }
//   Future<List<BabyImageDto>> getBabyImageDataFromDB() async{
//     List<Map<String, dynamic>> maps = await _database.rawQuery('SELECT * FROM $babyImageTableName WHERE id = 1');
//     return List.generate(maps.length, (index){
//       return BabyImageDto(id: maps[index]['id'], image: maps[index]['image']);
//     });
//   }
//   Future<Uint8List?> getBabyImage() async{
//     List<BabyImageDto> resultFromDB = await getBabyImageDataFromDB();
//     if(resultFromDB.isNotEmpty){
//       String imageEncoded = resultFromDB[0].image;
//       return Base64Decoder().convert(imageEncoded);
//     }else{
//       return null;
//     }
//   }
// }
//
