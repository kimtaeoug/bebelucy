import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../BebelucyColor.dart';
import '../../SupportUI.dart';

class SettingVoiceSwitch extends StatefulWidget {
  final SupportUI supportUI;
  final BebelucyColor bebelucyColor;

  SettingVoiceSwitch(Key? key, this.supportUI, this.bebelucyColor)
      : super(key: key);

  @override
  State<StatefulWidget> createState() =>
      _SettingVoiceSwitch();
}

class _SettingVoiceSwitch extends State<SettingVoiceSwitch> {
  late final SupportUI _supportUI = widget.supportUI;
  late final BebelucyColor _bebelucyColor = widget.bebelucyColor;

  bool _swicthOn = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _swicthOn = !_swicthOn;
        });
      },
      child: SizedBox(
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
                    color: _swicthOn
                        ? _bebelucyColor.purpleHeart
                        : _bebelucyColor.silver),
              ),
            ),
            AnimatedAlign(
                alignment: _swicthOn
                    ? AlignmentDirectional.centerStart
                    : AlignmentDirectional.centerEnd,
                child: Container(
                  width: _supportUI.deviceWidth * 0.056,
                  decoration: BoxDecoration(
                      color: _bebelucyColor.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.4),
                            spreadRadius: 0.01,
                            blurRadius: 1,
                            offset: Offset(-1.5, 2.0))
                      ]),
                ),
                duration: Duration(milliseconds: 200))
          ],
        ),
      ),
    );
  }
}
