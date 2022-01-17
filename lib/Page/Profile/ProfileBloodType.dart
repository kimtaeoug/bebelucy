import 'package:bebelucy_flutter/BebelucyFont.dart';
import 'package:bebelucy_flutter/LocalDB/LocalDBProvider.dart';
import 'package:bebelucy_flutter/Page/Profile/ProfileLinear.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../BebelucyColor.dart';
import '../../SupportUI.dart';

class ProfileBloodType extends StatelessWidget {
  final SupportUI _supportUI;
  final BebelucyColor _bebelucyColor;
  final BebelucyFont _bebelucyFont;
  final LocalDBProvider localDBProvider;

  ProfileBloodType(Key? key, this._supportUI, this._bebelucyColor,
      this._bebelucyFont, this.localDBProvider)
      : super(key: key);
  late final TextStyle rhTextStyle = TextStyle(
      color: _bebelucyColor.pickedBluewood,
      fontWeight: FontWeight.w500,
      fontSize: _supportUI.resFontSize(20),
      fontFamily: _bebelucyFont.capmtonM);
  late final TextStyle boolTypeTextStyle = TextStyle(
      color: _bebelucyColor.pickedBluewood,
      fontSize: _supportUI.resFontSize(24),
      fontFamily: _bebelucyFont.appleEB,
      fontWeight: FontWeight.bold);

  late String rawBloodType;
  late String rhValue;
  late String bloodTypeValue;

  @override
  Widget build(BuildContext context) {
    rawBloodType = localDBProvider.getProfileBloodType();
    if (rawBloodType == 'dummy') {
      rhValue = 'RH+';
      bloodTypeValue = 'A';
    } else {
      List<String> value = parseBloodType(rawBloodType);
      rhValue = value[0];
      bloodTypeValue = value[1];
    }
    return GestureDetector(
      onTap: () => editProfileBloodType(context),
      child: SizedBox(
        width: _supportUI.deviceWidth * 0.83,
        height: _supportUI.resHeight(60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: _supportUI.resHeight(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: _supportUI.resWidth(21),
                    height: _supportUI.resHeight(16),
                  ),
                  SizedBox(
                    height: _supportUI.resHeight(30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding:
                          EdgeInsets.only(top: _supportUI.resFontSize(8)),
                          child: Text(
                            rhValue,
                            style: rhTextStyle,
                          ),
                        ),
                        Text(
                          bloodTypeValue,
                          style: boolTypeTextStyle,
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: _supportUI.resWidth(5)),
                    child: SizedBox(
                      width: _supportUI.resWidth(16),
                      height: _supportUI.resHeight(16),
                      child: Image.asset('images/bloodtype_image.png'),
                    ),
                  ),
                ],
              ),
            ),
            ProfileLinear(null, _supportUI, _bebelucyColor)
          ],
        ),
      ),
    );
  }

  List<String> parseBloodType(String input) {
    return input.split(',');
  }

  Future<void> editProfileBloodType(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return ProfileBloodTypeEditor(
              null, _supportUI, _bebelucyColor, _bebelucyFont, localDBProvider);
        });
  }
}

class ProfileBloodTypeEditor extends StatefulWidget {
  late final SupportUI _supportUI;
  late final BebelucyColor _bebelucyColor;
  late final BebelucyFont _bebelucyFont;
  late final LocalDBProvider localDBProvider;

  ProfileBloodTypeEditor(Key? key, this._supportUI, this._bebelucyColor,
      this._bebelucyFont, this.localDBProvider)
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _ProfileBloodTypeEditor();
}

class _ProfileBloodTypeEditor extends State<ProfileBloodTypeEditor> {
  late final SupportUI _supportUI = widget._supportUI;
  late final BebelucyColor _bebelucyColor = widget._bebelucyColor;
  late final BebelucyFont _bebelucyFont = widget._bebelucyFont;
  late final LocalDBProvider localDBProvider = widget.localDBProvider;

  late final TextStyle titleTextStyle = TextStyle(
      color: _bebelucyColor.black,
      fontFamily: _bebelucyFont.appleM,
      fontSize: _supportUI.resFontSize(16));
  late final TextStyle saveTextStyle = TextStyle(
      color: _bebelucyColor.white,
      fontFamily: _bebelucyFont.appleB,
      fontSize: _supportUI.resFontSize(14),
      fontWeight: FontWeight.bold);

  final List<String> rhList = ['RH+', 'RH-'];
  final List<String> bloodTypeList = ['A', 'B', 'O', 'AB'];
  late final TextStyle rhTextStyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontFamily: _bebelucyFont.capmtonM,
      fontSize: _supportUI.resFontSize(20),
      color: _bebelucyColor.purpleHeart);
  late final TextStyle bloodTypeTextStyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: _supportUI.resFontSize(40),
      color: _bebelucyColor.purpleHeart,
      fontFamily: _bebelucyFont.capmtonM);
  int _rhIdx = 0;
  int _bloodTypeIdx = 0;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      insetPadding: EdgeInsets.symmetric(
          vertical: _supportUI.deviceHieght / 3,
          horizontal: _supportUI.deviceWidth / 6),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: SizedBox(
        width: (_supportUI.deviceWidth * 2) / 3,
        height: _supportUI.deviceHieght / 4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: (_supportUI.deviceWidth * 2) / 3,
              height: _supportUI.deviceHieght / 19,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: _supportUI.resHeight(2),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: _supportUI.resWidth(27),
                      ),
                      Text(
                        '혈액형 설정',
                        style: titleTextStyle,
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 15),
                        child: GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: SizedBox(
                            width: _supportUI.resWidth(12),
                            height: _supportUI.resHeight(12),
                            child: Image.asset('images/bloodtype_close.png'),
                          ),
                        ),
                      )
                    ],
                  ),
                  Container(
                    width: (_supportUI.deviceWidth * 2) / 3,
                    height: _supportUI.resHeight(2),
                    color: _bebelucyColor.onahau,
                  )
                ],
              ),
            ),
            SizedBox(
              width: (_supportUI.deviceWidth * 2) / 3,
              height: _supportUI.deviceHieght / 8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: _supportUI.resWidth(2),
                    height: _supportUI.deviceHieght / 16,
                    color: _bebelucyColor.coldPurple,
                  ),
                  SizedBox(
                    width: _supportUI.deviceWidth / 6,
                    height: _supportUI.deviceHieght / 16,
                    child: Center(
                      child: CupertinoPicker.builder(
                          selectionOverlay:
                              CupertinoPickerDefaultSelectionOverlay(
                            background: Colors.transparent,
                          ),
                          itemExtent: _supportUI.deviceHieght / 16,
                          onSelectedItemChanged: (value) {
                            setState(() {
                              _rhIdx = value;
                            });
                          },
                          childCount: rhList.length,
                          itemBuilder: (context, idx) {
                            return Center(
                              child: Text(rhList[idx], style: rhTextStyle,),
                            );
                          }),
                    ),
                  ),
                  Container(
                    width: _supportUI.resWidth(2),
                    height: _supportUI.deviceHieght / 16,
                    color: _bebelucyColor.coldPurple,
                  ),
                  SizedBox(
                    width: _supportUI.deviceWidth * 2 / 7,
                    height: _supportUI.deviceHieght / 16,
                    child: Center(
                      child: CupertinoPicker.builder(
                         selectionOverlay: CupertinoPickerDefaultSelectionOverlay(background: Colors.transparent,),
                          itemExtent: _supportUI.deviceHieght/16,
                          onSelectedItemChanged: (value){
                            setState(() {
                              _bloodTypeIdx = value;
                            });
                          },
                          childCount: bloodTypeList.length,
                          itemBuilder: (context, idx){
                           return Center(
                             child: Text(bloodTypeList[idx], style: bloodTypeTextStyle,),
                           );
                          }),
                    ),
                  ),
                  Container(
                    width: _supportUI.resWidth(2),
                    height: _supportUI.deviceHieght / 16,
                    color: _bebelucyColor.coldPurple,
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                localDBProvider.setProfileBloodType(
                    '${rhList[_rhIdx]},${bloodTypeList[_bloodTypeIdx]}');
                Navigator.pop(context);
              },
              child: Container(
                width: (_supportUI.deviceWidth * 2) / 3,
                height: _supportUI.deviceHieght / 19,
                decoration: BoxDecoration(
                    color: _bebelucyColor.purpleHeart,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10))),
                child: Center(
                  child: Text(
                    '저장',
                    style: saveTextStyle,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
