import 'dart:async';
import 'dart:io';

import 'package:bebelucy_flutter/BLECommunicate/BabyEnviromentDto.dart';
import 'package:bebelucy_flutter/Logger/LoggerFactory.dart';
import 'package:bebelucy_flutter/Page/CommonUI/BebeToast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_blue/flutter_blue.dart';

import 'BLEProtocol.dart';

class BLEProvider with ChangeNotifier {
  static final BLEProvider bleProvider = BLEProvider._init();

  BLEProvider._init();

  factory BLEProvider() => bleProvider;
  final LoggerFactory _log = LoggerFactory();
  final BLEProtocol _bleProtocol = BLEProtocol();

  late BluetoothDevice _selectDevice;
  late BluetoothCharacteristic _readCharacteristic;
  late BluetoothCharacteristic _writeCharacteristic;

  bool _isConnected = false;

  bool getIsConnected() => _isConnected;

  void setBLEDevice(BluetoothDevice input) {
    _selectDevice = input;
    notifyListeners();
  }

  final BebeToast _bebeToast = BebeToast();
  late BuildContext _buildContext;

  void setBLEProviderBLEContext(BuildContext input) {
    _buildContext = input;
  }

  void observeBLEConnectionStatus() {
    _selectDevice.state.listen((event) {
      //connected
      if (event == BluetoothDeviceState.connected) {
        _isConnected = true;
      }
      //disconnected
      else if (event == BluetoothDeviceState.disconnected) {
        _isConnected = false;
      }
    });
  }

  void showDeviceConnectionToast() =>
      _bebeToast.showInfoToast(_buildContext, '기기와 연결되었습니다.');

  void showDeviceConnectionFailToast() =>
      _bebeToast.showErrorToast(_buildContext, '기기와의 연결에 실패했습니다');

  Future<void> initConnect() async {
    try {
      if (!_isConnected) {
        await _selectDevice.connect().then((_) {
          matchServiceCharacteristic();
        });
        observeBLEConnectionStatus();
      }
    } catch (e) {
      _log.logE('$e in initConnect');
      _isConnected = false;
    }
  }

  Future<void> disconnectBLE() async {
    try {
      await _selectDevice.disconnect();
      _log.logI('BLE Device is disconnected');
    } catch (e) {
      _log.logE('$e in disconnectBLE');
    }
  }

  Future<void> matchServiceCharacteristic() async {
    try {
      List<BluetoothService> services = await _selectDevice.discoverServices();
      services.forEach((service) {
        if (service.uuid.toString() == _bleProtocol.serviceUUID) {
          service.characteristics.forEach((characteristic) async {
            if (characteristic.uuid.toString() == _bleProtocol.txUUID) {
              _writeCharacteristic = characteristic;
            } else if (characteristic.uuid.toString() == _bleProtocol.rxUUID) {
              _readCharacteristic = characteristic;
              await setNotification(_readCharacteristic).then((_) async {
                await openStreamReadDataFromBLE()
                    .then((_) => getEnviromentData());
              });
            }
          });
        }
      });
    } catch (e) {
      _log.logE('$e in matchServiceCharactertistic');
    }
  }

  Future<void> setNotification(BluetoothCharacteristic input) async {
    try {
      await input.setNotifyValue(!input.isNotifying);
      await input.read();
    } catch (e) {
      _log.logE('$e in setNotification');
    }
  }

  Future<void> getEnviromentData() async {
    try {
      Timer.periodic(const Duration(seconds: 10), (timer) {
        _writeCharacteristic.write(_bleProtocol.enviromentDataProtocol,
            withoutResponse: true);
      });
    } catch (e) {
      _log.logE('$e in getEnviromentData');
    }
  }

  Future<void> openStreamReadDataFromBLE() async {
    _readCharacteristic.value.listen((event) {
      if (event.length == 18) {
        setBabyEnviromentDto((((event[4] << 8) + event[5]) / 10.0), event[16],
            ((event[11] << 8) + event[12]), ((event[13] << 8) + event[14]));
      }
    });
  }

  late BabyEnviromentDto babyEnviromentDto;

  void setBabyEnviromentDto(
      double temperature, int humidity, int fineDust, int ultraFineDust) {
    babyEnviromentDto =
        BabyEnviromentDto(temperature, humidity, fineDust, ultraFineDust);
    notifyListeners();
  }

  BabyEnviromentDto getBabyEnviromentData() => babyEnviromentDto;

  Future<void> stopShake() async {
    try {
      await _writeCharacteristic.write(_bleProtocol.shakeOffProtocol,
          withoutResponse: true);
    } catch (e) {
      _log.logE('$e in stopShake');
    }
  }

  Future<void> activateShake(String level) async {
    try {
      late List<int> shakeLevel;
      switch (level) {
        case '1':
          shakeLevel = _bleProtocol.shakeLevel1Protocol;
          break;
        case '2':
          shakeLevel = _bleProtocol.shakeLevel2Protocol;
          break;
        case '3':
          shakeLevel = _bleProtocol.shakeLevel3Protocol;
          break;
      }
      stopShake();
      sleep(const Duration(milliseconds: 300));
      _writeCharacteristic.write(shakeLevel, withoutResponse: true);
    } catch (e) {
      _log.logE('$e in activateShake');
    }
  }
}
//         //baby
//         setBabyMonitoringDto(BabyMonitoringDto(event[3], event[15], (((event[4] << 8) + event[5])/10.0), event[6]/10, event[7], event[8]));
//         //enviroment
//         setEnviromentMonitoringDto(EnviromentMonitoringDto(event[16], event[10], ((event[11] << 8) + event[12]), ((event[13] << 8) + event[14])));
//       }
//class BabyMonitoringDto{
//   int heartRate;
//   int respiratoryRate;
//   double bodyTemperature;
//   double bodyWeight;
//   int bedTemperature;
//   int infantStatus;
//   BabyMonitoringDto(this.heartRate, this.respiratoryRate, this.bodyTemperature, this.bodyWeight, this.bedTemperature, this.infantStatus);
// }

//class EnviromentMonitoringDto{
//   int humidity;
//   int breath;
//   int pm25;
//   int co2;
//   EnviromentMonitoringDto(this.humidity, this.breath, this.pm25, this.co2);
// }
