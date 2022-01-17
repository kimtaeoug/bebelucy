import 'package:bebelucy_flutter/BebelucyColor.dart';
import 'package:bebelucy_flutter/BebelucyFont.dart';
import 'package:bebelucy_flutter/SupportUI.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'EnviromentCurrentTimeProvider.dart';

class EnviromentTime extends StatelessWidget {
  final SupportUI _supportUI;
  final BebelucyColor _bebelucyColor;
  final BebelucyFont _bebelucyFont;

  EnviromentTime(
      Key? key, this._supportUI, this._bebelucyColor, this._bebelucyFont);
  @override
  Widget build(BuildContext context) {
    final EnviromentCurrentTimeProvider enviromentTimeProvider = Provider.of<EnviromentCurrentTimeProvider>(context);
    return Padding(
      padding: EdgeInsets.only(right: _supportUI.resWidth(20)),
      child: SizedBox(
        height: _supportUI.resHeight(15),
        child: Text(
          enviromentTimeProvider.getCurrentTime(),
          style: TextStyle(
              fontFamily: _bebelucyFont.camptonLight,
              color: _bebelucyColor.boulder,
              fontWeight: FontWeight.bold,
              fontSize: _supportUI.resFontSize(12)),
          textAlign: TextAlign.end,
        ),
      ),
    );
  }
}
