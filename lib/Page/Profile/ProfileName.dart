import 'package:bebelucy_flutter/BebelucyFont.dart';
import 'package:bebelucy_flutter/LocalDB/LocalDBProvider.dart';
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../BebelucyColor.dart';
import '../../SupportUI.dart';
import 'ProfileLinear.dart';

class ProfileName extends StatelessWidget {
  final SupportUI _supportUI;
  final BebelucyColor _bebelucyColor;
  final BebelucyFont bebelucyFont;
  final LocalDBProvider localDBProvider;

  ProfileName(Key? key, this._supportUI, this._bebelucyColor, this.bebelucyFont,
      this.localDBProvider)
      : super(key: key);
  late final TextStyle profileTextStyle = TextStyle(
    color: _bebelucyColor.pickedBluewood,
    fontFamily: bebelucyFont.appleB,
    fontSize: _supportUI.resFontSize(30),
  );
  late String name;

  @override
  Widget build(BuildContext context) {
    name = localDBProvider.getProfileName();
    return GestureDetector(
      onTap: () => editProfileName(context),
      child: SizedBox(
        width: _supportUI.deviceWidth * 0.83,
        height: _supportUI.resHeight(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: _supportUI.resHeight(11)),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: _supportUI.resWidth(21),
                      height: _supportUI.resHeight(16),
                    ),
                    SizedBox(
                      width: _supportUI.resWidth(162),
                      height: _supportUI.resHeight(36),
                      child: Center(
                        child: Text(
                          name != 'dummy' ? name : '김엠마',
                          style: profileTextStyle,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: _supportUI.resWidth(5)),
                      child: SizedBox(
                        height: _supportUI.resHeight(36),
                        child: Align(
                          alignment: AlignmentDirectional.bottomCenter,
                          child: SizedBox(
                            width: _supportUI.resWidth(16),
                            height: _supportUI.resHeight(16),
                            child: Image.asset('images/edit_image.png'),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ProfileLinear(null, _supportUI, _bebelucyColor)
          ],
        ),
      ),
    );
  }

  Future<void> editProfileName(BuildContext context) async {
    return showDialog(
        context: context,
        // barrierDismissible: false,
        builder: (BuildContext context) {
          return ProfileNameEditor(
              null, _supportUI, _bebelucyColor, bebelucyFont, localDBProvider);
        });
  }
}

class ProfileNameEditor extends StatelessWidget {
  final SupportUI _supportUI;
  final BebelucyColor _bebelucyColor;
  final BebelucyFont _bebelucyFont;
  final LocalDBProvider localDBProvider;

  ProfileNameEditor(Key? key, this._supportUI, this._bebelucyColor,
      this._bebelucyFont, this.localDBProvider)
      : super(key: key);

  final TextEditingController nameController = TextEditingController();
  late final TextStyle nameTextStyle = TextStyle(
      color: _bebelucyColor.white,
      fontFamily: _bebelucyFont.appleB,
      fontSize: _supportUI.resFontSize(30));

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: (_supportUI.deviceWidth * 8) / 9,
            height: _supportUI.deviceHieght / 32,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: SizedBox(
                    child: Text(
                      '취소',
                      style: TextStyle(
                          color: _bebelucyColor.white,
                          fontSize: _supportUI.resFontSize(18),
                          fontFamily: _bebelucyFont.appleB),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (nameController.text != '') {
                      localDBProvider.setProfileName(nameController.text);
                      Navigator.pop(context);
                    }
                  },
                  child: SizedBox(
                    child: Text(
                      '확인',
                      style: TextStyle(
                          color: _bebelucyColor.silverChalice2,
                          fontSize: _supportUI.resFontSize(18),
                          fontFamily: _bebelucyFont.appleB),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            width: (_supportUI.deviceWidth * 8) / 9,
            height: _supportUI.resHeight(45),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: _supportUI.resWidth(24),
                    ),
                    SizedBox(
                      width: _supportUI.deviceWidth / 2,
                      height: _supportUI.resHeight(36),
                      child: TextField(
                        keyboardType: TextInputType.name,
                        controller: nameController,
                        decoration:
                            InputDecoration(focusedBorder: InputBorder.none),
                        cursorWidth: 4.0,
                        autofocus: true,
                        textInputAction: TextInputAction.go,
                        cursorColor: _bebelucyColor.purpleHeart,
                        textAlign: TextAlign.center,
                        style: nameTextStyle,
                        onSubmitted: (value) async {
                          if (value != '') {
                            localDBProvider.setProfileName(value);
                            Navigator.pop(context);
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      width: _supportUI.resWidth(24),
                      height: _supportUI.resHeight(36),
                      child: Center(
                        child: GestureDetector(
                          onTap: () => nameController.clear(),
                          child: SizedBox(
                            width: _supportUI.resWidth(24),
                            height: _supportUI.resHeight(24),
                            child: Image.asset('images/name_close.png'),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: _supportUI.resHeight(5)),
                  child: Container(
                    width: (_supportUI.deviceWidth * 8) / 9,
                    height: _supportUI.resHeight(2),
                    color: _bebelucyColor.white,
                  ),
                )
              ],
            ),
          ),
          Container()
        ],
      ),
    );
  }
}
