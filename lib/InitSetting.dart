import 'package:bebelucy_flutter/LocalDB/LocalDBFactory.dart';
import 'package:bebelucy_flutter/LocalDB/LocalDBProvider.dart';
import 'package:bebelucy_flutter/MemberShip/MemberShipFactory.dart';
import 'package:bebelucy_flutter/Network/NetworkObserver.dart';
import 'package:bebelucy_flutter/Page/CommonUI/BebeToast.dart';
import 'package:bebelucy_flutter/Page/Enviroment/EnviromentCurrentTimeProvider.dart';
import 'package:bebelucy_flutter/Permission/PermissionFunction.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'BebeSharedPreference.dart';
import 'CheckCountry/CheckCountryFactory.dart';
import 'Page/WhiteNoise/WhiteNoiseProvider.dart';

class InitSetting {
  late NetworkObserver networkObserver;
  // late PermissionFuncion permissionFuncion;
  late CheckCountryFactory checkCountryFactory;
  late EnviromentCurrentTimeProvider enviromentCurrentTimeProvider;
  late LocalDBFactory localDBFactory;
  late LocalDBProvider localDBProvider;
  late BebeSharedPreference _bebeSharedPreference;
  final MemberShipFactory _memberShipFactory = MemberShipFactory();
  //Notificaiton, Network, CheckCountry, Permission, Enviroment Timer
  Future<void> setAllInitSlpit(BuildContext context) async{
    //NetworkObserver 초기화
    // networkObserver = NetworkObserver();
    // networkObserver.setNetworkObserverContext(context);
    // await networkObserver.initNetworkObserver();
    // await networkObserver.startNetworkObserving();
    //나라 식별
    // checkCountryFactory = CheckCountryFactory();
    // checkCountryFactory.initCheckCountry();
    _memberShipFactory.initLoginObserver(context);
  }
  Future<void> setAllInitSplitLast(BuildContext context) async{
    //Local DB Factory init
    localDBFactory = LocalDBFactory();
    localDBProvider = Provider.of<LocalDBProvider>(context, listen: false);
    localDBFactory.initLocalDB().then((_)=> localDBProvider.initLocalDBProvider());
    //
    _bebeSharedPreference = BebeSharedPreference();
    _bebeSharedPreference.initSharedPreference();

    WhiteNoiseProvider whiteNoiseProvider = Provider.of<WhiteNoiseProvider>(context, listen: false);
    whiteNoiseProvider.initPlayLocalMomSound();
    //Enviroment 시간
    enviromentCurrentTimeProvider =
        Provider.of<EnviromentCurrentTimeProvider>(context, listen: false);
    enviromentCurrentTimeProvider.updateEnviromentCurrentTime();
  }

}
