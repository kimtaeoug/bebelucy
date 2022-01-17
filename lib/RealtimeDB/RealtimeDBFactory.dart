import 'package:bebelucy_flutter/MemberShip/MemberShipFactory.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class RealtimeDBFactory{
  static final RealtimeDBFactory realtimeDBFactory = RealtimeDBFactory._init();
  RealtimeDBFactory._init();
  factory RealtimeDBFactory() => realtimeDBFactory;

  final MemberShipFactory _memberShipFactory = MemberShipFactory();
  final FirebaseDatabase _firebaseDatabase = FirebaseDatabase.instance;
  late final DatabaseReference _ref = _firebaseDatabase.reference();
  String uuid = '';
  bool checkCurrentUser(){
    User? user = _memberShipFactory.getCurrentUser();
    if(user != null){
      uuid = user.uid;
      return true;
    }else{
      return false;
    }
  }
//https://pub.dev/packages/firebase_database/example
//https://ichi.pro/ko/flutterlo-firebase-silsigan-deiteobeiseuleul-sayonghaneun-bangbeob-259319567887505
}