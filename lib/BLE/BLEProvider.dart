// import 'dart:async';
// import 'dart:developer';
//
// import 'package:bebelucy_flutter/BLE/BabyMonitoringDto.dart';
// import 'package:bebelucy_flutter/BLE/EnviromentMonitoringDto.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter_blue/flutter_blue.dart';
//
// import 'BleProtocol.dart';
//
// class BLEProvider with ChangeNotifier{
//   final String tag = 'BLE';
//   BluetoothDevice? selectDevice;
//   String sleeperImageUrl;
//   BabyMonitoringDto babyMonitoringDto;
//   EnviromentMonitoringDto enviromentMonitoringDto;
//   BLEProvider(this.selectDevice, this.sleeperImageUrl, this.babyMonitoringDto, this.enviromentMonitoringDto);
//   getSelectDevice() => selectDevice;
//   void setSelectDevice(BluetoothDevice device){
//     selectDevice = device;
//     notifyListeners();
//   }
//   getSleepImageUrl() => sleeperImageUrl;
//   void setSleepImageUrl(String url){
//     sleeperImageUrl = url;
//     notifyListeners();
//   }
//   getBabyMonitoringDto() => babyMonitoringDto;
//   void setBabyMonitoringDto(BabyMonitoringDto data){
//     babyMonitoringDto = data;
//     notifyListeners();
//   }
//   getEnviromentMonitoringDto() => enviromentMonitoringDto;
//   void setEnviromentMonitoringDto(EnviromentMonitoringDto data){
//     enviromentMonitoringDto = data;
//     print('data : ${data.humidity}');
//     notifyListeners();
//   }
//
//   String action = '';
//   late BluetoothCharacteristic readCharacteristic;
//   late BluetoothCharacteristic writeCharacteristic;
//
//   BleProtocol _bleProtocol = BleProtocol();
//
//   bool _alreadyConnected = false;
//   //Disconnect the ble device
//   Future<void> disconnectBleDevice() async{
//     await selectDevice!.disconnect();
//     _alreadyConnected = false;
//   }
//   Future<void> initConnect() async{
//     if(selectDevice != null){
//       try{
//         if(_alreadyConnected){
//           await disconnectBleDevice();
//         }else{
//           await selectDevice!.connect().then((value){
//             matchServiceCharacteristic();
//             _alreadyConnected = true;
//           });
//         }
//       }catch(e){
//         log('$e in initConnect', name: tag);
//       }
//     }else{
//       log('Device is null(in initConnect)', name: tag);
//     }
//   }
//
//   //Find matching service, characteristic with own service uuid and characteristic uuid
//   Future<void> matchServiceCharacteristic() async{
//     try{
//       List<BluetoothService> services = await selectDevice!.discoverServices();
//       services.forEach((service) {
//         if(service.uuid.toString() == _bleProtocol.serviceUUID){
//           service.characteristics.forEach((characteristic) async{
//             if(characteristic.uuid.toString() == _bleProtocol.txUUID){
//               writeCharacteristic = characteristic;
//             }else if(characteristic.uuid.toString() == _bleProtocol.rxUUID){
//               readCharacteristic = characteristic;
//               await setNotification(readCharacteristic).then((_){
//                 readDataFromBle(writeCharacteristic).then((_){
//                   getDetailData();
//                 });
//               });
//             }
//           });
//         }
//       });
//     }catch(e){
//       log('$e in matchServiceCharacteristic', name:tag);
//     }
//   }
//   //Read data from ble device
//   Future<void> setNotification(BluetoothCharacteristic readCharacteristic) async{
//     try{
//       await readCharacteristic.setNotifyValue(!readCharacteristic.isNotifying);
//       await readCharacteristic.read();
//     }catch(e){
//       log('$e in setNotification', name: tag);
//     }
//   }
//   Future<void> sendToData(List<int>? data, String actionName) async{
//     try{
//       action = actionName;
//       writeCharacteristic.write(data!, withoutResponse: true);
//     }catch(e){
//       log('$e in writeCharacteristic', name: tag);
//     }
//   }
//   Future<void> getSleepState() async{
//     try{
//       action = _bleProtocol.getSleepState;
//       writeCharacteristic.write(_bleProtocol.sleepLastState(), withoutResponse: true);
//     }catch(e){
//       log('$e in getSleepState', name: tag);
//     }
//   }
//   Future<void> getDetailData() async{
//     try{
//       Timer.periodic(Duration(seconds: 10), (timer) {
//         action = _bleProtocol.getDetailData;
//         writeCharacteristic.write(_bleProtocol.getData(), withoutResponse: true);
//       });
//     }catch(e){
//       log('$e in getDetailData', name: tag);
//     }
//   }
//
//   Future<void> readDataFromBle(BluetoothCharacteristic characteristic)async{
//     readCharacteristic.value.listen((event) async{
//       if(event.length == 6){
//         if(event[4] == 177){
//           setSleepImageUrl('images/button_sleep_1.png');
//         }else if(event[4] == 176){
//           setSleepImageUrl('images/button_sleep_0.png');
//         }
//       }
//       else if(event.length == 18){
//         //baby
//         setBabyMonitoringDto(BabyMonitoringDto(event[3], event[15], (((event[4] << 8) + event[5])/10.0), event[6]/10, event[7], event[8]));
//         //enviroment
//         setEnviromentMonitoringDto(EnviromentMonitoringDto(event[16], event[10], ((event[11] << 8) + event[12]), ((event[13] << 8) + event[14])));
//       }
//     });
//   }
//
// }
//
