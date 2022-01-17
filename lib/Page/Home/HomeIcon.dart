import 'package:bebelucy_flutter/BebelucyColor.dart';
import 'package:bebelucy_flutter/BebelucyFont.dart';
import 'package:bebelucy_flutter/SupportUI.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeIcon extends StatelessWidget {
  final SupportUI _supportUI;
  final BebelucyColor _bebelucyColor;
  final BebelucyFont _bebelucyFont;
  final String homeIconName;
  final String homeIconImage;
  final String homeIconNavigationName;

  HomeIcon(Key? key, this._supportUI, this._bebelucyColor, this._bebelucyFont,
      this.homeIconName, this.homeIconImage, this.homeIconNavigationName)
      : super(key: key);
  late final TextStyle titleTextStyle = TextStyle(
      color: _bebelucyColor.bigStone,
      fontWeight: FontWeight.bold,
      fontSize: _supportUI.resFontSize(13),
      fontFamily: _bebelucyFont.appleB);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>Navigator.pushNamed(context, homeIconNavigationName),
      child: _supportUI.isTablet?SizedBox(
        width: _supportUI.resWidth(101),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: _supportUI.resHeight(5)),
              child: SizedBox(
                width: _supportUI.resWidth(96),
                child: Center(
                  child: Text(
                    homeIconName,
                    style: titleTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            Container(
              width: _supportUI.resWidth(80),
              height: _supportUI.resWidth(80),
              decoration: BoxDecoration(
                  color: _bebelucyColor.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  border: Border.all(color: _bebelucyColor.purpleHeart),
                  boxShadow: [
                    BoxShadow(
                        color: _bebelucyColor.sail,
                        spreadRadius: 2,
                        blurRadius: 3,
                        offset: Offset(2.0, 3.0))
                  ]),
              child: Center(
                child: SizedBox(
                  height: _supportUI.resHeight(48),
                  child: Image.asset('images/$homeIconImage.png', fit: BoxFit.fitHeight,),
                ),
              ),
            )
          ],
        ),
      ):SizedBox(
        width: _supportUI.resWidth(101),
        height: _supportUI.resHeight(117),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: _supportUI.resHeight(5)),
              child: SizedBox(
                width: _supportUI.resWidth(96),
                height: _supportUI.resHeight(14),
                child: Center(
                  child: Text(
                    homeIconName,
                    style: titleTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            Container(
              width: _supportUI.resWidth(96),
              height: _supportUI.resWidth(96),
              decoration: BoxDecoration(
                  color: _bebelucyColor.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  border: Border.all(color: _bebelucyColor.purpleHeart),
                  boxShadow: [
                    BoxShadow(
                        color: _bebelucyColor.sail,
                        spreadRadius: 2,
                        blurRadius: 3,
                        offset: Offset(2.0, 3.0))
                  ]),
              child: Center(
                child: SizedBox(
                  width: _supportUI.resWidth(48),
                  child: Image.asset('images/$homeIconImage.png', fit: BoxFit.fitWidth,),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
