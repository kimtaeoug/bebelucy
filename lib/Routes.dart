import 'package:animations/animations.dart';
import 'package:flutter/widgets.dart';

class Routes {
  static const String start = "/";
  static const String SplashPage = '/SplashPage';
  static const String bleScanPage = '/BLEScanPage';
  static const String loginPage = '/LoginPage';
  static const String homePage = '/HomePage';
  static const String settingPage = '/SettingPage';
  static const String profilePage = '/ProfilePage';
  static const String enviromentPage = '/EnviromentPage';
  static const String whiteNoisePage = '/WhiteNoisePage';
  static const String faqPage = '/FAQPage';
  static const String cameraPage = '/CameraPage';
  static const String cameraLoadingPage = '/CameraLoadingPage';
  static const String shakePage = '/ShakePage';
  static const String fetusPage = '/FetusWhiteNoisePage';
  static const String testUIPage = '/TestUIPage';
  static Route<T> fadeThrough<T>(RouteSettings settings, WidgetBuilder page,
      {int duration = 300}) {
    return PageRouteBuilder<T>(
      settings: settings,
      transitionDuration: Duration(milliseconds: duration),
      pageBuilder: (context, animation, secondaryAnimation) => page(context),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeScaleTransition(animation: animation, child: child);
      },
    );
  }
}