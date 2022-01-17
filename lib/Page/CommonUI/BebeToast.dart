import 'package:bebelucy_flutter/BebelucyColor.dart';
import 'package:bebelucy_flutter/BebelucyFont.dart';
import 'package:bebelucy_flutter/SupportUI.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BebeToast {
  static final BebeToast bebeToast = BebeToast._init();

  BebeToast._init();

  factory BebeToast() => bebeToast;
  final SupportUI _supportUI = SupportUI();
  final BebelucyColor _bebelucyColor = BebelucyColor();
  final BebelucyFont _bebelucyFont = BebelucyFont();

  late final TextStyle toastTextStyle = TextStyle(
      fontSize: _supportUI.resFontSize(12),
      fontFamily: _bebelucyFont.appleEB,
      fontWeight: FontWeight.bold,
      color: _bebelucyColor.black);
  void showInfoToast(BuildContext context, String input){
    FToast fToast = FToast();
    fToast = fToast.init(context);
    fToast.showToast(
        child: Container(
          width: _supportUI.deviceWidth * 8 / 9,
          height: _supportUI.resHeight(50),
          decoration: BoxDecoration(
              color: _bebelucyColor.frenchPass,
              border: Border.all(color: _bebelucyColor.dodgerBlue, width: 2),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Center(
            child: SizedBox(
              width: _supportUI.deviceWidth * 29 / 36,
              height: _supportUI.resHeight(50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: _supportUI.resWidth(10)),
                    child: SizedBox(
                      width: _supportUI.resWidth(20),
                      height: _supportUI.resHeight(20),
                      child: Image.asset('images/warning_icon.png'),
                    ),
                  ),
                  SizedBox(
                    height: _supportUI.resHeight(20),
                    child: Text(
                      input,
                      style: toastTextStyle,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  // SizedBox(
                  //   height: _supportUI.resHeight(20),
                  //   child: Center(
                  //     child: SizedBox(
                  //       width: _supportUI.resWidth(12),
                  //       height: _supportUI.resHeight(12),
                  //       child: Image.asset('images/toast_close.png'),
                  //     ),
                  //   ),
                  // )
                ],
              ),
            ),
          ),
        ),
        gravity: ToastGravity.BOTTOM,
        toastDuration: const Duration(seconds: 2));
  }

  void showWarningToast(BuildContext context, String input){
    FToast fToast = FToast();
    fToast = fToast.init(context);
    fToast.showToast(
        child: Container(
          width: _supportUI.deviceWidth * 8 / 9,
          height: _supportUI.resHeight(50),
          decoration: BoxDecoration(
              color: _bebelucyColor.tequila,
              border: Border.all(color: _bebelucyColor.coral, width: 2),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Center(
            child: SizedBox(
              width: _supportUI.deviceWidth * 29 / 36,
              height: _supportUI.resHeight(50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: _supportUI.resWidth(10)),
                    child: SizedBox(
                      width: _supportUI.resWidth(20),
                      height: _supportUI.resHeight(20),
                      child: Image.asset('images/warning_icon.png'),
                    ),
                  ),
                  SizedBox(
                    height: _supportUI.resHeight(20),
                    child: Text(
                      input,
                      style: toastTextStyle,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  // SizedBox(
                  //   height: _supportUI.resHeight(20),
                  //   child: Center(
                  //     child: SizedBox(
                  //       width: _supportUI.resWidth(12),
                  //       height: _supportUI.resHeight(12),
                  //       child: Image.asset('images/toast_close.png'),
                  //     ),
                  //   ),
                  // )
                ],
              ),
            ),
          ),
        ),
        gravity: ToastGravity.BOTTOM,
        toastDuration: const Duration(seconds: 2));
  }

  void showErrorToast(BuildContext context, String input) {
    FToast fToast = FToast();
    fToast = fToast.init(context);
    fToast.showToast(
        child: Container(
          width: _supportUI.deviceWidth * 7 / 8,
          height: _supportUI.resHeight(50),
          decoration: BoxDecoration(
              color: _bebelucyColor.yourPink,
              border: Border.all(color: _bebelucyColor.red, width: 2),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Center(
            child: SizedBox(
              width: _supportUI.deviceWidth * 29 / 36,
              height: _supportUI.resHeight(50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: _supportUI.resWidth(10)),
                    child: SizedBox(
                      width: _supportUI.resWidth(20),
                      height: _supportUI.resHeight(20),
                      child: Image.asset('images/error_icon.png'),
                    ),
                  ),
                  SizedBox(
                    height: _supportUI.resHeight(20),
                    child: Text(
                      input,
                      style: toastTextStyle,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  // SizedBox(
                  //   height: _supportUI.resHeight(20),
                  //   child: Center(
                  //     child: SizedBox(
                  //       width: _supportUI.resWidth(12),
                  //       height: _supportUI.resHeight(12),
                  //       child: Image.asset('images/toast_close.png'),
                  //     ),
                  //   ),
                  // )
                ],
              ),
            ),
          ),
        ),
        gravity: ToastGravity.BOTTOM,
        toastDuration: const Duration(seconds: 2));
  }
}
