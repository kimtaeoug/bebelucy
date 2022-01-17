import 'package:bebelucy_flutter/SupportUI.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Routes.dart';

class ContextMenu extends StatelessWidget {
  final SupportUI _supportUI;
  final bool needBack;
  final bool needSetting;

  ContextMenu(Key? key, this._supportUI, this.needBack, this.needSetting)
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: _supportUI.deviceHieght * 0.03),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          needBack
              ? Padding(
                  padding: EdgeInsets.only(left: _supportUI.resWidth(20)),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SizedBox(
                      width: _supportUI.resWidth(20),
                      height: _supportUI.resHeight(20),
                      child: Image.asset('images/back_button.png'),
                    ),
                  ),
                )
              : SizedBox(
                  width: _supportUI.resWidth(36),
                ),
          SizedBox(
            width: _supportUI.resWidth(110),
            height: _supportUI.resHeight(20),
            child: Image.asset('images/top_logo.png'),
          ),
          needSetting
              ? Padding(
                  padding: EdgeInsets.only(right: _supportUI.resWidth(20)),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.settingPage);
                    },
                    child: SizedBox(
                      width: _supportUI.resWidth(16),
                      height: _supportUI.resHeight(16),
                      child: Image.asset('images/setting_button.png'),
                    ),
                  ),
                )
              : Container(
                  width: _supportUI.resWidth(36),
                )
        ],
      ),
    );
  }
}
