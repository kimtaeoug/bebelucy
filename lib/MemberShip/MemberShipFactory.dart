import 'dart:convert';
import 'package:bebelucy_flutter/Logger/LoggerFactory.dart';
import 'package:bebelucy_flutter/MemberShip/MembershipVariables.dart';
import 'package:bebelucy_flutter/Page/CommonUI/BebeToast.dart';
import 'package:bebelucy_flutter/Routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;

class MemberShipFactory{
  static final MemberShipFactory memberShipFactory = MemberShipFactory._init();

  MemberShipFactory._init();

  factory MemberShipFactory() => memberShipFactory;
  late final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  // late FToast fToast;
  bool isLogin = false;
  User? currentUser = null;
  final MembershipVariables membershipVariables = MembershipVariables();
  final LoggerFactory loggerFactory = LoggerFactory();
  String membershipAccount = 'SNS 연동 계정';
  //로그인 정보 없을 때 -> null
  void initLoginObserver(BuildContext context) {
    firebaseAuth.authStateChanges().listen((event) {
      currentUser = event;
      if (currentUser != null) {
        isLogin = true;
        if(currentUser!.email != null){
          membershipAccount = currentUser!.email!;
        }else{
          membershipAccount = '정보가 없습니다.';
        }
      } else {
        isLogin = false;
        membershipAccount = 'SNS 연동 계정';
      }
    });
  }

  User? getCurrentUser() => currentUser;

  final GoogleSignIn _googleSignIn = GoogleSignIn();
  //google login
  Future<UserCredential?> loginWithGoogle() async {
    try{
      GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      GoogleSignInAuthentication googleAuth =
      await googleUser!.authentication;
      GoogleAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      ) as GoogleAuthCredential;
      loggerFactory.logI('Login Using Google');
      return await firebaseAuth.signInWithCredential(credential);
    }catch(e){
      loggerFactory.logE('$e in loginWithGoogle');
    }
    return null;
  }

  //kakao login
  Future<UserCredential?> loginWithKakao() async {
    try{
      final String clientState = Uuid().v4();
      final url = Uri.https('kauth.kakao.com', '/oauth/authorize', {
        'response_type': 'code',
        'client_id': membershipVariables.kakaoApiKey,
        'response_mode': 'form_post',
        'redirect_uri': membershipVariables.kakaoSignUrl,
        'scope': 'account_email profile_nickname',
        'state': clientState
      });
      final result = await FlutterWebAuth.authenticate(
          url: url.toString(), callbackUrlScheme: 'webauthcallback');
      final body = Uri.parse(result).queryParameters;
      print('body code : ${body['code']}');
      final tokenUrl = Uri.https('kauth.kakao.com', '/oauth/token', {
        'grant_type': 'authorization_code',
        'client_id': membershipVariables.kakaoApiKey,
        'redirect_uri': membershipVariables.kakaoSignUrl,
        'code': body['code']
      });
      var responseTokens = await http.post(tokenUrl);
      Map<String, dynamic> accessTokenResult = json.decode(responseTokens.body);
      final Uri cloudTokenUrl = Uri.parse(membershipVariables.kakaoTokenUrl);
      Response response = await http.post(cloudTokenUrl,
          body: {"accessToken": accessTokenResult['access_token']});
      loggerFactory.logI('Login Using Kakao');
      return await firebaseAuth.signInWithCustomToken(response.body);
    }catch(e){
      loggerFactory.logE('$e in loginWithKakao');
    }
    return null;
  }

  //naver
  Future<UserCredential?> loginWithNaver() async {
    try{
      final clientState = Uuid().v4();
      final url = Uri.https('nid.naver.com', '/oauth2.0/authorize', {
        'response_type': 'code',
        'client_id': membershipVariables.naverClientId,
        'redirect_uri': membershipVariables.naverSignUrl,
        'state': clientState,
      });
      final result = await FlutterWebAuth.authenticate(
          url: url.toString(), callbackUrlScheme: "webauthcallback");
      final body = Uri.parse(result).queryParameters;
      final tokenUrl = Uri.https('nid.naver.com', '/oauth2.0/token', {
        'grant_type': 'authorization_code',
        'client_id': membershipVariables.naverClientId,
        'client_secret': membershipVariables.naverSecret,
        'code': body['code'],
        'state': clientState
      });
      var responseTokens = await http.post(tokenUrl);
      Map<String, dynamic> bodys = json.decode(responseTokens.body);
      final Uri cloudTokenUrl = Uri.parse(membershipVariables.naverTokenUrl);
      var response = await http
          .post(cloudTokenUrl, body: {"accessToken": bodys['access_token']});
      loggerFactory.logI('Login Using Naver');
      return await firebaseAuth.signInWithCustomToken(response.body);
    }catch(e){
      loggerFactory.logE('$e in loginWithNaver');
    }
    return null;
  }
  //facebook
  Future<UserCredential?> loginWithFaceBook() async{
    try{
      final LoginResult result = await FacebookAuth.instance.login();
      if(result.status == LoginStatus.success){
        final OAuthCredential credential =
        FacebookAuthProvider.credential(result.accessToken!.token);
        return await FirebaseAuth.instance.signInWithCredential(credential);
      }
    }catch(e){
      loggerFactory.logE('$e in loginWithFaceBook');
    }
    return null;
  }
  Future<UserCredential?> loginWithApple() async{
    try{
      final AuthorizationCredentialAppleID appleCredential = await SignInWithApple.getAppleIDCredential(scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName
      ]);
      final OAuthCredential oauthCredential = OAuthProvider("apple.com").credential(
        idToken: appleCredential.identityToken,
        accessToken: appleCredential.authorizationCode
      );
      return await FirebaseAuth.instance.signInWithCredential(oauthCredential);
    }catch(e){
      loggerFactory.logE('$e in loginWithApple');
    }
  }

  final BebeToast _bebeToast = BebeToast();
  //로그아웃
  Future<void> logout(BuildContext context) async {
    try {
      await firebaseAuth.signOut();
      _bebeToast.showInfoToast(context, '로그아웃 되었습니다.');
      Navigator.pushNamed(context, Routes.loginPage);
      loggerFactory.logI('Logout');
    } catch (e) {
      loggerFactory.logE('$e in logout');
    }
  }
  //MainPage로 넘어가기
  Future<void> moveToMainPage(BuildContext context) async{
    try{
      Navigator.pushNamedAndRemoveUntil(context, Routes.homePage, (route) => false);
    }catch(e){
      loggerFactory.logE('$e in MoveToMainPage');
    }
  }

}
