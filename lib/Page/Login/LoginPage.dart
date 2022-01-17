import 'package:bebelucy_flutter/BebelucyColor.dart';
import 'package:bebelucy_flutter/MemberShip/MemberShipFactory.dart';
import 'package:bebelucy_flutter/Page/Login/LoginUI.dart';
import 'package:bebelucy_flutter/SupportUI.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class LoginPage extends StatelessWidget {
  final SupportUI _supportUI = SupportUI();
  final BebelucyColor bebelucyColor = BebelucyColor();
  final MemberShipFactory _memberShipFactory = MemberShipFactory();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: bebelucyColor.hawkesBlue,
      body: WillPopScope(
        child: LoginUI(null, _supportUI, _memberShipFactory,),
        onWillPop: () => Future(()=>false),
      ),
    ));
  }
}

