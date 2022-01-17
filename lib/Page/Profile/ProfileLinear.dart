import 'package:flutter/cupertino.dart';

import '../../BebelucyColor.dart';
import '../../SupportUI.dart';

class ProfileLinear extends StatelessWidget{
  final SupportUI _supportUI;
  final BebelucyColor _bebelucyColor;
  ProfileLinear(Key? key, this._supportUI, this._bebelucyColor):super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: _supportUI.deviceWidth * 0.83,
      height: _supportUI.resHeight(2),
      decoration: BoxDecoration(
        color: _bebelucyColor.mint,
        borderRadius: BorderRadius.all(Radius.circular(30))
      ),
    );
  }

}