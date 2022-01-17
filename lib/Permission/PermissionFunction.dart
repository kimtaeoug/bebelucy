import 'dart:io';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:bebelucy_flutter/Logger/LoggerFactory.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionFuncion {
  final LoggerFactory _log = LoggerFactory();
  //storage - android External Storage(photo)
  //photos - ios MPMediaLibrary
  final List<Permission> androidPermissionList = [
    Permission.location,
    Permission.storage,
    Permission.bluetooth,
    Permission.camera,
    Permission.notification,
    Permission.speech,
    Permission.microphone,
  ];
  final List<Permission> iosPermissionList = [
    Permission.location,
    Permission.bluetooth,
    Permission.camera,
    Permission.notification,
    Permission.speech,
    Permission.photos,
    Permission.microphone,
  ];

  Future<void> checkPermissionStatus() async {
    late Map<Permission, PermissionStatus> statuses;
    if (Platform.isAndroid) {
      statuses = await androidPermissionList.request();
    } else if (Platform.isIOS) {
      statuses = await iosPermissionList.request();
    }
    for (Permission permission in statuses.keys) {
      if (statuses[permission]!.isDenied) {
        await permission.request();
      }
    }
  }
  final List<Permission> androidImagePermission = [Permission.storage, Permission.camera];
  final List<Permission> iosImagePermission = [Permission.photos, Permission.camera];
  final List<Permission> blePermission = [Permission.bluetooth, Permission.location];
  final List<Permission> notificationPermission = [Permission.notification, Permission.accessNotificationPolicy];
  final List<Permission> speechPermission = [Permission.speech, Permission.microphone];
  Future<void> requestImagePermission() async{
    List<Permission> imagePermission = [];
    if(Platform.isAndroid){
      imagePermission = androidPermissionList;
    }else if(Platform.isIOS){
      imagePermission = iosPermissionList;
    }
    if(imagePermission.isNotEmpty){
      _log.logI('Request Image Permission');
      List.generate(imagePermission.length, (index)async{
        await imagePermission[index].request();
      });

    }else{
      _log.logE('ImagePermission is Empty');
    }
  }
  Future<bool> requestBLEPermission() async{
    try{
      _log.logI('Request BLE Permission');
      Map<Permission, PermissionStatus> statuses = await blePermission.request();
      for(Permission permission in statuses.keys){
        if(statuses[permission]!.isDenied){
          return false;
        }
      }
      return true;
    }catch(e){
      _log.logE('$e in requestBLEPermission');
    }
    return false;
  }
  Future<bool> requestMusicListPermission()async{
    try{
      _log.logI('Request MusicList Permission');
      List<Permission> musicListPermission = [Permission.storage];
      Map<Permission, PermissionStatus> statuses = await musicListPermission.request();
      for(Permission permission in statuses.keys){
        if(statuses[permission]!.isDenied){
          return false;
        }
      }
      return true;
    }catch(e){
      _log.logE('$e in requestMusicListPermission');
    }
    return false;
  }
  Future<bool> requestLocalNotificationPermission() async{
    try{
      _log.logI('Request Local Notification Permission');
      Map<Permission, PermissionStatus> statuses = await notificationPermission.request();
      for(Permission permission in statuses.keys){
        if(statuses[permission]!.isDenied){
          return false;
        }
      }
      return true;
    }catch(e){
      _log.logE('$e in requestLocalNotificationPermission');
    }
    return false;
  }
}
