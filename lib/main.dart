import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:bebelucy_flutter/BLECommunicate/BLEProvider.dart';
import 'package:bebelucy_flutter/LocalDB/LocalDBProvider.dart';
import 'package:bebelucy_flutter/Page/BLEScan/BLEScanPage.dart';
import 'package:bebelucy_flutter/Page/BLEScan/BLEScanProvider.dart';
import 'package:bebelucy_flutter/Page/Camera/CameraLoadingPage.dart';
import 'package:bebelucy_flutter/Page/Camera/CameraPage.dart';
import 'package:bebelucy_flutter/Page/Enviroment/EnviromentPage.dart';
import 'package:bebelucy_flutter/Page/Enviroment/EnviromentProvider.dart';
import 'package:bebelucy_flutter/Page/FAQ/FAQPage.dart';
import 'package:bebelucy_flutter/Page/FAQ/FAQProvider.dart';
import 'package:bebelucy_flutter/Page/FetusWhiteNoise/FetusWhiteNoisePage.dart';
import 'package:bebelucy_flutter/Page/Home/HomePage.dart';
import 'package:bebelucy_flutter/Page/Login/LoginPage.dart';
import 'package:bebelucy_flutter/Page/Profile/ProfilePage.dart';
import 'package:bebelucy_flutter/Page/Setting/SettingPage.dart';
import 'package:bebelucy_flutter/Page/Shake/ShakePage.dart';
import 'package:bebelucy_flutter/Page/Shake/ShakeProvider.dart';
import 'package:bebelucy_flutter/Page/Splash/SplashPage.dart';
import 'package:bebelucy_flutter/Page/Splash/SplashProvider.dart';
import 'package:bebelucy_flutter/Page/WhiteNoise/WhiteNoiseProvider.dart';
import 'package:bebelucy_flutter/TestUIPage.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'Page/Enviroment/EnviromentCurrentTimeProvider.dart';
import 'Page/WhiteNoise/WhiteNoisePage.dart';
import 'Routes.dart';
import 'package:timezone/data/latest.dart' as tz;

// void main() {
//   tz.initializeTimeZones();
//   runApp(DevicePreview(
//     builder: (BuildContext context) {
//       return MyApp();
//     },
//   ));
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     SystemChrome.setPreferredOrientations(
//         [DeviceOrientation.portraitUp]); //세로 고정
//     return MultiProvider(
//       providers: [
//         // ChangeNotifierProvider<BLEProvider>(
//         //     create: (context) => BLEProvider(
//         //         null,
//         //         'images/button_sleep_0.png',
//         //         BabyMonitoringDto(81, 30, 26.4, 4.0, 26, 0),
//         //         EnviromentMonitoringDto(23, 31, 13, 120))),
//         ChangeNotifierProvider<BLEScanProvider>(
//             create: (context) => BLEScanProvider()),
//         ChangeNotifierProvider<EnviromentProvider>(
//             create: (context) => EnviromentProvider()),
//         ChangeNotifierProvider<EnviromentCurrentTimeProvider>(
//             create: (context) => EnviromentCurrentTimeProvider()),
//         ChangeNotifierProvider<FAQProvider>(create: (context) => FAQProvider()),
//         ChangeNotifierProvider<LocalDBProvider>(
//             create: (context) => LocalDBProvider()),
//         ChangeNotifierProvider<WhiteNoiseProvider>(
//             create: (context) => WhiteNoiseProvider()),
//         ChangeNotifierProvider<ShakeProvider>(
//           create: (context) => ShakeProvider(),
//         ),
//         ChangeNotifierProvider<SplashProvider>(
//           create: (context) => SplashProvider(),
//         )
//       ],
//       child: MaterialApp(
//         initialRoute: '/',
//         onGenerateRoute: (RouteSettings settings) {
//           return Routes.fadeThrough(settings, (context) {
//             switch (settings.name) {
//               case Routes.SplashPage:
//                 return SplashPage();
//               case Routes.bleScanPage:
//                 return BLEScanPage();
//               case Routes.loginPage:
//                 return LoginPage();
//               case Routes.homePage:
//                 return HomePage();
//               case Routes.settingPage:
//                 return SettingPage();
//               case Routes.profilePage:
//                 return ProfilePage();
//               case Routes.enviromentPage:
//                 return EnviromentPage();
//               case Routes.whiteNoisePage:
//                 return WhiteNoisePage();
//               case Routes.faqPage:
//                 return FAQPage();
//               case Routes.cameraPage:
//                 return CameraPage();
//               case Routes.cameraLoadingPage:
//                 return CameraLoadingPage();
//               case Routes.testUIPage:
//                 return TestUIPage();
//               case Routes.shakePage:
//                 return ShakePage();
//               case Routes.fetusPage:
//                 return FetusWhiteNoisePage();
//               default:
//                 return SizedBox.shrink();
//             }
//           });
//         },
//         localizationsDelegates: [
//           GlobalMaterialLocalizations.delegate,
//           GlobalWidgetsLocalizations.delegate
//         ],
//         theme: ThemeData(
//           primarySwatch: Colors.blue,
//         ),
//         home: SplashPage(),
//         debugShowCheckedModeBanner: false,
//         //for device_preview
//         useInheritedMediaQuery: true,
//         locale: DevicePreview.locale(context),
//       ),
//     );
//   }
// }

void main() async{
  tz.initializeTimeZones();
  //firebase core initialize
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(interceptFCMBackgroundHandler);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp]); //세로 고정
    return MultiProvider(
      providers: [
        // ChangeNotifierProvider<BLEProvider>(
        //     create: (context) => BLEProvider(
        //         null,
        //         'images/button_sleep_0.png',
        //         BabyMonitoringDto(81, 30, 26.4, 4.0, 26, 0),
        //         EnviromentMonitoringDto(23, 31, 13, 120))),

        ChangeNotifierProvider<BLEProvider>(create: (context) => BLEProvider()),
        ChangeNotifierProvider<BLEScanProvider>(create: (context) => BLEScanProvider()),
        ChangeNotifierProvider<EnviromentProvider>(create: (context) => EnviromentProvider()),
        ChangeNotifierProvider<EnviromentCurrentTimeProvider>(create: (context) => EnviromentCurrentTimeProvider()),
        ChangeNotifierProvider<FAQProvider>(create: (context) => FAQProvider()),
        ChangeNotifierProvider<LocalDBProvider>(create:(context)=>LocalDBProvider()),
        ChangeNotifierProvider<WhiteNoiseProvider>(create: (context)=>WhiteNoiseProvider()),
        ChangeNotifierProvider<ShakeProvider>(create: (context) => ShakeProvider(),),
        ChangeNotifierProvider<SplashProvider>(create: (context) => SplashProvider(),)
      ],
      child: MaterialApp(
        initialRoute: '/',
        onGenerateRoute: (RouteSettings settings) {
          return Routes.fadeThrough(settings, (context) {
            switch (settings.name) {
              case Routes.SplashPage:
                return SplashPage();
              case Routes.bleScanPage:
                return BLEScanPage();
              case Routes.loginPage:
                return LoginPage();
              case Routes.homePage:
                return HomePage();
              case Routes.settingPage:
                return SettingPage();
              case Routes.profilePage:
                return ProfilePage();
              case Routes.enviromentPage:
                return EnviromentPage();
              case Routes.whiteNoisePage:
                return WhiteNoisePage();
              case Routes.faqPage:
                return FAQPage();
              case Routes.cameraPage:
                return CameraPage();
              case Routes.cameraLoadingPage:
                return CameraLoadingPage();
              case Routes.testUIPage:
                return TestUIPage();
              case Routes.shakePage:
                return ShakePage();
              case Routes.fetusPage:
                return FetusWhiteNoisePage();
              default:
                return SizedBox.shrink();
            }
          });
        },
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate
        ],
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SplashPage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
Future<void> interceptFCMBackgroundHandler(RemoteMessage message) async{
  await Firebase.initializeApp();
  AwesomeNotifications().createNotificationFromJsonData(message.data);
  final Logger logger = Logger(
      printer: PrettyPrinter(
          colors: true,
          printEmojis: true,
          printTime: true
      )
  );
  logger.i('from fcm  :${message.messageId}');
}
