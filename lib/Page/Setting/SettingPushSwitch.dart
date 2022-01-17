import 'dart:async';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:bebelucy_flutter/BebelucyColor.dart';
import 'package:bebelucy_flutter/SupportUI.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingPushSwitch extends StatefulWidget {
  final SupportUI supportUI;
  final BebelucyColor bebelucyColor;

  SettingPushSwitch(Key? key, this.supportUI, this.bebelucyColor)
      : super(key: key);

  @override
  State<StatefulWidget> createState() =>
      _SettingPushSwitch();
}

class _SettingPushSwitch extends State<SettingPushSwitch> {
  late final SupportUI _supportUI = widget.supportUI;
  late final BebelucyColor _bebelucyColor = widget.bebelucyColor;


  bool _swicthOn = false;

  final AwesomeNotifications awesomeNotifications = AwesomeNotifications();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        awesomeNotifications.requestPermissionToSendNotifications();
      },
      child: FutureBuilder(
        future: awesomeNotifications.isNotificationAllowed(),
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.done){
            Timer.periodic(const Duration(milliseconds: 100), (timer) {
              if(mounted){
                if(snapshot.data == true){
                  setState(() {
                    _swicthOn = true;
                  });
                }else{
                  setState(() {
                    _swicthOn = false;
                  });
                }
              }
              timer.cancel();
            });
          }
          return SizedBox(
            width: _supportUI.deviceWidth * 0.095,
            height: _supportUI.resHeight(20),
            child: Stack(
              children: [
                Center(
                  child: Container(
                    width: _supportUI.deviceWidth * 0.09,
                    height: _supportUI.resHeight(14),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        color: _swicthOn?_bebelucyColor.purpleHeart:_bebelucyColor.silver),
                  ),
                ),
                AnimatedAlign(
                    alignment: _swicthOn?AlignmentDirectional.centerStart:AlignmentDirectional.centerEnd,
                    child: Container(
                      width: _supportUI.deviceWidth*0.056,
                      decoration: BoxDecoration(
                          color: _bebelucyColor.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                                color: _bebelucyColor.grey.withOpacity(0.4),
                                spreadRadius: 0.01,
                                blurRadius: 1,
                                offset: Offset(-1.5, 2.0))
                          ]),
                    ),
                    duration: Duration(milliseconds: 200))
              ],
            ),
          );
        },
      ),
    );
  }
}

