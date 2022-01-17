import 'package:bebelucy_flutter/BebelucyFont.dart';
import 'package:bebelucy_flutter/MemberShip/MemberShipFactory.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../BebelucyColor.dart';
import '../../Routes.dart';
import '../../SupportUI.dart';

class LogoutButton extends StatelessWidget {
  final SupportUI _supportUI;
  final BebelucyColor _bebelucyColor;
  final BebelucyFont _bebelucyFont;

  LogoutButton(Key? key, this._supportUI, this._bebelucyColor,
      this._bebelucyFont)
      : super(key: key);
  final MemberShipFactory _memberShipFactory = MemberShipFactory();

  late final TextStyle _logOutTextStyle = TextStyle(
      color: _bebelucyColor.boulder,
      fontFamily: _bebelucyFont.appleM,
      fontSize: _supportUI.resFontSize(16)
  );
  late final TextStyle _logOutCancelTextStyle = TextStyle(
      color: _bebelucyColor.indigoBlue,
      fontSize: _supportUI.resFontSize(14),
      fontFamily: _bebelucyFont.appleM
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: _supportUI.resHeight(24)),
      child: GestureDetector(
        onTap: () => _logoutDialog(context),
        child: Container(
          width: _supportUI.deviceWidth * 0.47,
          height: _supportUI.resHeight(32),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              color: _bebelucyColor.wildSand),
          child: Center(
            child: Text(
              '로그아웃',
              style: _logOutTextStyle,
            ),
          ),
        ),
      ),
    );
  }

  late final TextStyle _logOutDialogTextStyle = TextStyle(
      fontFamily: _bebelucyFont.appleM,
      fontSize: _supportUI.resFontSize(15),
      color: Colors.black
  );
  late final TextStyle _logOutConfirmTextStyle = TextStyle(
      color: _bebelucyColor.purpleHeart,
      fontSize: _supportUI.resFontSize(14),
      fontFamily: _bebelucyFont.appleM,
      fontWeight: FontWeight.bold);

  Future<void> _logoutDialog(BuildContext context) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        barrierColor: Colors.black.withOpacity(0.5),
        builder: (BuildContext context) {
          return Dialog(
            insetPadding: EdgeInsets.symmetric(
                horizontal: _supportUI.deviceWidth * 0.23,
                vertical: _supportUI.deviceHieght * 0.375),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(child: Center(
                  child: Text(
                    '정말 로그아웃을 \n 하시겠습니까?',
                    style: _logOutDialogTextStyle,
                  ),
                )),
                Container(
                  color: _bebelucyColor.onahau,
                  height: _supportUI.resHeight(2),
                ),
                SizedBox(
                  height: _supportUI.deviceHieght * 0.05,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: SizedBox(
                          width: _supportUI.deviceWidth * 0.27,
                          child: Center(
                            child: Text(
                              '취소',
                              style: _logOutCancelTextStyle,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () =>
                            _memberShipFactory.logout(context),
                        child: SizedBox(
                          width: _supportUI.deviceWidth * 0.27,
                          child: Center(
                              child: Text('로그아웃',
                                style: _logOutConfirmTextStyle,)
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }
}
