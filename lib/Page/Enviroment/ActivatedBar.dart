import 'package:bebelucy_flutter/BebelucyColor.dart';
import 'package:bebelucy_flutter/SupportUI.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ActivatedBar extends StatelessWidget {
  final SupportUI supportUI;
  final BebelucyColor bebelucyColor;
  final bool isActivated;

  ActivatedBar(Key? key, this.supportUI, this.bebelucyColor, this.isActivated)
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: supportUI.resWidth(60),
      height: supportUI.resHeight(3),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          color: isActivated
              ? bebelucyColor.bigStone
              : Colors.transparent),
    );
  }
}
