import 'dart:async';

import 'package:bebelucy_flutter/Logger/LoggerFactory.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NetworkObserver {
  static final NetworkObserver networkObserver = NetworkObserver._init();
  NetworkObserver._init();
  factory NetworkObserver() => networkObserver;
  final LoggerFactory _loggerFactory = LoggerFactory();
  late ConnectivityResult connectivityResult;
  late Connectivity connectivity;
  late StreamSubscription<ConnectivityResult> connectivitySubscription;
  // late FToast fToast;
  late BuildContext networkObserverContext;
  Future<void> initNetworkObserver()async{
    connectivityResult = ConnectivityResult.none;
    connectivity = Connectivity();
    // fToast = FToast();
    // fToast.init(networkObserverContext);
    connectivitySubscription = connectivity.onConnectivityChanged.listen(updateConnectionStatus);
  }
  Future<void> setNetworkObserverContext(BuildContext context) async{
    networkObserverContext = context;
  }
  Future<void> startNetworkObserving() async{
    late ConnectivityResult result;
    try{
      result = await connectivity.checkConnectivity();
    }on PlatformException catch(e){
      _loggerFactory.logE('$e in NetworkObserver');
      return;
    }
    _loggerFactory.logI('Start NetworkObserving');
    return updateConnectionStatus(result);
  }
  Future<void> cancelNetworkObserving() async{
    connectivitySubscription.cancel();
  }
  Future<void> updateConnectionStatus(ConnectivityResult inputResult) async{
    connectivityResult = inputResult;
    if(connectivityResult == ConnectivityResult.none){
      // showToast();
    }
  }
  // void showToast(){
  //   Widget toast = Container(
  //     padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
  //     decoration: BoxDecoration(
  //       color: Colors.greenAccent,
  //       borderRadius: BorderRadius.all(Radius.circular(30))
  //     ),
  //     child: Row(
  //       mainAxisSize: MainAxisSize.min,
  //       children: [
  //         Padding(padding: EdgeInsets.only(right: 12), child: Icon(Icons.warning_amber_rounded),),
  //         Text('인터넷 연결을 확인해주세요.')
  //       ],
  //     ),
  //   );
  //   fToast.showToast(child: toast, gravity: ToastGravity.BOTTOM, toastDuration: Duration(seconds: 2));
  // }
}

