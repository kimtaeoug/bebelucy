import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SupportUI{
  //디바이스 너비
  double deviceWidth = 0.0;
  //디바이스 높이
  double deviceHieght = 0.0;
  //디자인 너비
  final double designWidth = 360;
  //디자인 높이
  final double designHeight = 640;
  bool isTablet = false;
  static final SupportUI _supportUI = SupportUI._init();
  factory SupportUI() => _supportUI;
  SupportUI._init();
  late ScreenUtil screenUtil;
  ScreenUtil getScreenUtil(){
    ScreenUtil.init(
      BoxConstraints(maxWidth: this.deviceWidth, maxHeight: this.deviceHieght),
      designSize: Size(this.designWidth, this.designHeight),
      orientation: Orientation.portrait
    );
    screenUtil = ScreenUtil();
    return screenUtil;
  }
  double resWidth(double width) => screenUtil.setWidth(width);
  double resHeight(double height) => screenUtil.setHeight(height);
  double resFontSize(double sp) => screenUtil.setSp(sp);
}
