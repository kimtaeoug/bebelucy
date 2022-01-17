
import 'dart:typed_data';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

//Int64List highVibrationPattern =
//     Int64List.fromList([0, 1000, 200, 200, 200, 200, 200, 200]);
//Notification Channel - Notification을 채널이라는 그룹으로 묶을 수 있으며, 같은 채널 별로 메시지에 대한 설정을 따로 할 수 있게 된다.
//알림 메시지를 채널이라는 그룹으로 묶을 수 있으며 같은 채널 별로 메시지에 대한 설정을 따로 할 수 있게 된다
class NotiFactory {
  static final NotiFactory notiFactory = NotiFactory._init();
  NotiFactory._init();
  factory NotiFactory() => notiFactory;

  AwesomeNotifications awesomeNotifications = AwesomeNotifications();
  final Int64List highVibrationPattern = Int64List.fromList([0, 1000, 200, 200, 200, 200, 200, 200]);
  Future<void> initNotification() async {
    await requestNotificationPermission();
    //채널 -
    awesomeNotifications.initialize('resource://drawable/next_icon', [
      NotificationChannel(
        channelKey: 'basic_channel',
        channelName: 'Basic notification',
        channelDescription: 'Notification channel for basic tests',
        defaultColor: Color(0xFF9D50DD),
        ledColor: Colors.white
      ),
      NotificationChannel(
        channelKey: 'alert_channel',
        channelName: 'Alert Notification',
        channelDescription: 'Notification channel for alert',
        defaultColor: Colors.redAccent,
        ledColor: Colors.red,
        vibrationPattern: highVibrationPattern,
        enableVibration: true,
        enableLights: true,
        ledOnMs: 1000,
        ledOffMs: 500,
        importance: NotificationImportance.Max
      ),
      NotificationChannel(
        channelKey: 'audio_channel',
        channelName: 'Audio Notifcation',
        channelDescription: 'Notifcation channel for audio',
        locked: true,
        defaultPrivacy: NotificationPrivacy.Public,
        enableVibration: false,
        enableLights: false,
        playSound: false
      ),
      NotificationChannel(
          channelKey: 'media_player',
          channelName: 'Media player controller',
          channelDescription: 'Media player controller',
          defaultPrivacy: NotificationPrivacy.Public,
          enableVibration: false,
          enableLights: false,
          playSound: false,
          locked: true)
    ]);
  }
  //permission
  Future<void> requestNotificationPermission() async{
    awesomeNotifications.isNotificationAllowed().then((value){
      if(!value){
        awesomeNotifications.requestPermissionToSendNotifications();
      }
    });
  }
  Future<void> showNotification() async{
    awesomeNotifications.createNotification(content: NotificationContent(
      id: 1,
      channelKey: 'basic_channel',
      title: 'Simple Notification',
      body: 'Simple body',
      //asset://assets/images/melted-clock.png
      bigPicture: 'asset://images/button_baby.png',
      displayOnBackground: true,
      notificationLayout: NotificationLayout.Inbox
    ));
  }
  //schedule

  //alert notification
  Future<void> showAlertNotification() async{
    awesomeNotifications.createNotification(content: NotificationContent(
      id: 2,
      channelKey: 'alert_channel',
      title: 'Baby abnormality detection',
      body: 'Baby ?',
      backgroundColor: Colors.orangeAccent,
      displayOnForeground: true,
      notificationLayout: NotificationLayout.Messaging
    ));
  }
  //NotificationLayout.MEDIA_PLAYER 방법은 사용 못함.
  Future<void> showMusicNotification() async{
    awesomeNotifications.createNotification(content: NotificationContent(
      id: 3,
      channelKey: 'audio_channel',
      title: 'Baby Music',
      body: '<b>NowPlaying...</b>\n' '<b>태야</b>',
      notificationLayout: NotificationLayout.MediaPlayer,
      autoCancel: false,
      showWhen: false
    ),
    actionButtons: [
      NotificationActionButton(
        key: 'DISMIIS',
        label: '중단',
        buttonType: ActionButtonType.DisabledAction,
        autoCancel: true,
        icon: 'asset://images/stop_black.png'
      )
    ]);
  }
  void updateNotificationMediaPlayer() {
    AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: 4,
            channelKey: 'media_player',
            title: 'test',
            body: 'test',
            summary: 'Now playing',
            notificationLayout: NotificationLayout.MediaPlayer,
            largeIcon: 'asset://images/button_baby.png',
            color: Colors.purple.shade700,
            autoCancel: false,
            showWhen: false),
        actionButtons: [
          NotificationActionButton(
              key: 'MEDIA_CLOSE',
              icon: 'asset://images/stop_black.png',
              label: 'Close',
              autoCancel: true,
              buttonType: ActionButtonType.KeepOnTop)
        ]);
  }
}
