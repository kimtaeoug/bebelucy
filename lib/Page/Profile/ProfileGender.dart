import 'package:bebelucy_flutter/BebelucyColor.dart';
import 'package:bebelucy_flutter/LocalDB/LocalDBProvider.dart';
import 'package:bebelucy_flutter/SupportUI.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ProfileLinear.dart';

class ProfileGender extends StatelessWidget {
  final SupportUI _supportUI;
  final BebelucyColor _bebelucyColor;
  final LocalDBProvider localDBProvider;

  ProfileGender(
      Key? key, this._supportUI, this._bebelucyColor, this.localDBProvider)
      : super(key: key);
  late String gender;

  @override
  Widget build(BuildContext context) {
    gender = localDBProvider.getProfileGender();
    return Padding(
      padding: EdgeInsets.only(top: _supportUI.resHeight(5)),
      child: SizedBox(
        width: _supportUI.deviceWidth * 0.83,
        height: _supportUI.resHeight(55),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: _supportUI.resHeight(3)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: _supportUI.resWidth(21),
                    height: _supportUI.resHeight(16),
                  ),
                  SizedBox(
                    height: _supportUI.resHeight(45),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            if (gender == 'male') {
                              localDBProvider.setProfileGender('female');
                            } else {
                              localDBProvider.setProfileGender('male');
                            }
                          },
                          child: SizedBox(
                            height: _supportUI.resHeight(45),
                            child: Image.asset(
                              gender == 'male'
                                  ? 'images/activated_male.png'
                                  : 'images/inactivate_male.png',
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(left: _supportUI.resWidth(10)),
                          child: GestureDetector(
                            onTap: () {
                              if (gender == 'male') {
                                localDBProvider.setProfileGender('female');
                              } else {
                                localDBProvider.setProfileGender('male');
                              }
                            },
                            child: SizedBox(
                              height: _supportUI.resHeight(45),
                              child: Image.asset(
                                gender == 'female'
                                    ? 'images/activated_female.png'
                                    : 'images/inactivate_female.png',
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: _supportUI.resWidth(5)),
                    child: SizedBox(
                      height: _supportUI.resHeight(30),
                      child: Align(
                        alignment: AlignmentDirectional.bottomCenter,
                        child: SizedBox(
                          width: _supportUI.resWidth(16),
                          height: _supportUI.resHeight(16),
                          child: Image.asset('images/gender_image.png'),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            ProfileLinear(null, _supportUI, _bebelucyColor)
          ],
        ),
      ),
    );
  }
}
