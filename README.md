# <center>JakomoProject</center>  
![Stack](https://img.shields.io/badge/flutter-02569B?style=for-the-badge&logo=Flutter&logoColor=white)
![Stack](https://img.shields.io/badge/android-3DDC84?style=for-the-badge&logo=Android&logoColor=white)
![Stack](https://img.shields.io/badge/apple-000000?style=for-the-badge&logo=IOS&logoColor=white)
![Stack](https://img.shields.io/badge/dart-0175C2?style=for-the-badge&logo=Dart&logoColor=white)
![Stack](https://img.shields.io/badge/kotlin-7F52FF?style=for-the-badge&logo=Kotlin&logoColor=white)
![Stack](https://img.shields.io/badge/swift-F05138?style=for-the-badge&logo=Swift&logoColor=white)
![Stack](https://img.shields.io/badge/firebase-FFCA28?style=for-the-badge&logo=Firebase&logoColor=white)
![Stack](https://img.shields.io/badge/bluetooth-0082FC?style=for-the-badge&logo=BLE&logoColor=white)
<table>
   <tr>
      <td>
         <img width="200px" src="./1.png">
      </td>
      <td>
         <img width="200px" src="./2.png">
      </td>
      <td>
         <img width="200px" src="./3.png">
      </td>
      <td>
         <img width="200px" src="./4.png">
      </td>
      <td>
         <img width="200px" src="./5.png">
      </td>
      <td>
         <img width="200px" src="./6.png">
      </td>
      <td>
         <img width="200px" src="./7.png">
      </td>      
   </tr>
   <tr>
      <td>
         <img width="200px" src="./8.png">
      </td>
      <td>
         <img width="200px" src="./9.png">
      </td>
      <td>
         <img width="200px" src="./10.png">
      </td>
      <td>
         <img width="200px" src="./11.png">
      </td>
      <td>
         <img width="200px" src="./12.png">
      </td>
      <td>
         <img width="200px" src="./13.png">
      </td>
    </tr>	
</table>

#### 해당 앱은 각 Store에서 내려가 동영상으로 대체합니다. 👉🏻[앱 동영상](https://drive.google.com/file/d/1ruBQovASZY0D_ppkiltXThmqzcCsqXss/view?usp=drive_link)

[1.프로젝트 소개](#😀-프로젝트-소개)    
[2.프로젝트내 담당 업무](#🧑‍💻-프로젝트내-담당-업무)  
[3.개발 기간](#⏳️-개발-기간)  
[3.기술 스택](#⚙️-기술-Stack)  
[3.협업 기관](#🙌-Contributing-and-Company)   
[3.주요 기능](#📌-주요-기능)  
[4.개발을 하고 싶어요](#Application-구조)


## 😀 프로젝트 소개  
여러 협업 기관과 함께 만든 IOT 서비스로 기기와 연동해 기기 제어 및 생체 신호 측정을 통한 건강 상태 분석등이 주요 기능인 휴식 테마의 앱입니다.    

### 🧑‍💻 프로젝트내 담당 업무  
+ 서비스 설계 -> 리메인과 기기 기반 서비스 설계 및 기획  
+ 서비스 개발 -> Flutter를 사용한 앱 개발, Firebase를 사용한 Serverless 구조 개발  
+ 배포 -> PlayStore, AppStore(현재는 Store에서 앱이 내려가 있습니다.)    

### ⏳️ 개발 기간  
* 서비스 설계 시작 : 2020.12  
* 앱 개발 시작 : 2021.01    

### ⚙️ 기술 Stack  
* 상태 관리 및 바인딩, 라우팅 -> GetX  
* 디자인 패턴 -> MVC  
* Device 통신 -> BLE  

### 🙌 Contributing and Company    
> Emmahc : 서비스 설계 및 개발, 배포, 팀 리딩  
> 생산기술연구원 : 리클라이너 설계 Support   
> Jakomo : 리클라이너 제조 및 설계  
> 리메인 : 기획 및 디자인    

### 📌 주요 기능  
* MemberShip 기능  
  * 로그인  
  * 회원가입/회원탈퇴  
  * 회원 정보 수정  
  * ID/PWD 찾기  
* 기기 제어  
<img width="600px" src="./screen.png">
* 생체 신호 측정 및 분석  
<img width="600px" src="./screen2.png">
* 건강 상태 측정 내역(Calendar, Graph)  
* AS / 1대1 문의 신청  
* 음악 플레이어(백그라운드)


### Application 구조
<details><summary>ApplicationTree</summary>
   
```bash
├── BLE
│   ├── BLEProvider.dart
│   ├── BabyMonitoringDto.dart
│   ├── BleProtocol.dart
│   └── EnviromentMonitoringDto.dart
├── BLECommunicate
│   ├── BLEProtocol.dart
│   ├── BLEProvider.dart
│   └── BabyEnviromentDto.dart
├── BebeSharedPreference.dart
├── BebelucyColor.dart
├── BebelucyFont.dart
├── CheckCountry
│   └── CheckCountryFactory.dart
├── FCM
│   └── FcmFactory.dart
├── InitSetting.dart
├── LocalDB
│   ├── BabyImageDto.dart
│   ├── DBFactory.dart
│   ├── HeartRateModel.dart
│   ├── LocalDBFactory.dart
│   ├── LocalDBProvider.dart
│   ├── ProfileBirthModel.dart
│   ├── ProfileBloodTypeModel.dart
│   ├── ProfileGenderModel.dart
│   ├── ProfileImageModel.dart
│   ├── ProfileNameModel.dart
│   └── WeightModel.dart
├── Logger
│   └── LoggerFactory.dart
├── MemberShip
│   ├── MemberShipFactory.dart
│   └── MembershipVariables.dart
├── Network
│   └── NetworkObserver.dart
├── Notification
│   └── NotiFactory.dart
├── Page
│   ├── BLEScan
│   │   ├── BLEIconAnimation.dart
│   │   ├── BLEScanDeviceName.dart
│   │   ├── BLEScanPage.dart
│   │   ├── BLEScanPercentAnimation.dart
│   │   ├── BLEScanProvider.dart
│   │   ├── BLEScanSpiralAnimation.dart
│   │   ├── BLESearchText.dart
│   │   └── SpiralPathPainter.dart
│   ├── Camera
│   │   ├── CameraLoadingPage.dart
│   │   └── CameraPage.dart
│   ├── CommonUI
│   │   ├── AutoPositionedList.dart
│   │   ├── BebeToast.dart
│   │   ├── ContextMenu.dart
│   │   ├── LoadingUI.dart
│   │   └── LongList.dart
│   ├── Enviroment
│   │   ├── ActivatedBar.dart
│   │   ├── BabyEnviromentComponent
│   │   │   ├── BabyEnviroment.dart
│   │   │   ├── FineDust.dart
│   │   │   ├── Humidity.dart
│   │   │   ├── Temperature.dart
│   │   │   └── UltraFineDust.dart
│   │   ├── BabyHeartRateComponent
│   │   │   ├── BabyHeartAverage.dart
│   │   │   ├── BabyHeartRate.dart
│   │   │   ├── BabyHeartRateLabel.dart
│   │   │   └── HeartRateGraph.dart
│   │   ├── BabyWeightComponent
│   │   │   ├── BabyNowWeight.dart
│   │   │   ├── BabyWeight.dart
│   │   │   ├── BabyWeightGraph.dart
│   │   │   └── BabyWeightGuideText.dart
│   │   ├── EnviromentCurrentTimeProvider.dart
│   │   ├── EnviromentPage.dart
│   │   ├── EnviromentProvider.dart
│   │   ├── EnviromentTime.dart
│   │   └── EnviromentTopNavigation.dart
│   ├── FAQ
│   │   ├── FAQApplicationLIst.dart
│   │   ├── FAQDrawer.dart
│   │   ├── FAQEtcList.dart
│   │   ├── FAQList.dart
│   │   ├── FAQNavigation.dart
│   │   ├── FAQPage.dart
│   │   ├── FAQProductList.dart
│   │   ├── FAQProvider.dart
│   │   └── FAQTop.dart
│   ├── FetusWhiteNoise
│   │   ├── FetusMomSound.dart
│   │   ├── FetusSlider.dart
│   │   ├── FetusThumb.dart
│   │   ├── FetusWhiteNoiseList.dart
│   │   ├── FetusWhiteNoisePage.dart
│   │   └── FetusWhiteNoiseTitle.dart
│   ├── Home
│   │   ├── HomeBottom.dart
│   │   ├── HomeIcon.dart
│   │   ├── HomePage.dart
│   │   ├── HomeProfile.dart
│   │   ├── HomeTop.dart
│   │   └── TopArc.dart
│   ├── Login
│   │   ├── LoginItem.dart
│   │   ├── LoginPage.dart
│   │   └── LoginUI.dart
│   ├── Profile
│   │   ├── ProfileBirth.dart
│   │   ├── ProfileBloodType.dart
│   │   ├── ProfileGender.dart
│   │   ├── ProfileImage.dart
│   │   ├── ProfileLinear.dart
│   │   ├── ProfileName.dart
│   │   └── ProfilePage.dart
│   ├── Setting
│   │   ├── LogoutButton.dart
│   │   ├── SettingAccountItem.dart
│   │   ├── SettingBLEItem.dart
│   │   ├── SettingCameraItem.dart
│   │   ├── SettingPage.dart
│   │   ├── SettingPushItem.dart
│   │   ├── SettingPushSwitch.dart
│   │   ├── SettingQuestionItem.dart
│   │   ├── SettingVoiceItem.dart
│   │   └── SettingVoiceSwitch.dart
│   ├── Shake
│   │   ├── ShakePage.dart
│   │   ├── ShakeProvider.dart
│   │   ├── ShakeRange.dart
│   │   ├── ShakeRangeAnimation.dart
│   │   ├── ShakeRangeAnimationPath.dart
│   │   ├── ShakeStep.dart
│   │   ├── ShakeTimer.dart
│   │   ├── ShakeTimerEditor.dart
│   │   ├── ShakeTimerIsolate.dart
│   │   └── ShakeTitle.dart
│   ├── Splash
│   │   ├── SplashOpacityAnimation.dart
│   │   ├── SplashPage.dart
│   │   ├── SplashProvider.dart
│   │   └── SplashRotationAnimation.dart
│   └── WhiteNoise
│       ├── MomWhiteNoise.dart
│       ├── PlayerSlider.dart
│       ├── WhiteNoisSliderThumb.dart
│       ├── WhiteNoiseItem.dart
│       ├── WhiteNoiseItemSlider.dart
│       ├── WhiteNoiseMain.dart
│       ├── WhiteNoisePage.dart
│       ├── WhiteNoisePlayer.dart
│       ├── WhiteNoiseProvider.dart
│       ├── WhiteNoiseTimer.dart
│       └── WhiteNoiseTimerSetting.dart
├── Permission
│   └── PermissionFunction.dart
├── RealtimeDB
│   └── RealtimeDBFactory.dart
├── Routes.dart
├── STT
│   └── SttFactory.dart
├── SupportUI.dart
├── TTS
│   └── TtsFactory.dart
├── TestUIPage.dart
├── UpdateApp
│   └── UpdateAlertUI.dart
└── main.dart
``` 
   
</details>
