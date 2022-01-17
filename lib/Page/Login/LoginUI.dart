import 'dart:async';
import 'dart:io';

import 'package:bebelucy_flutter/MemberShip/MemberShipFactory.dart';
import 'package:bebelucy_flutter/Page/CommonUI/BebeToast.dart';
import 'package:bebelucy_flutter/Page/CommonUI/LoadingUI.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../../SupportUI.dart';
import 'LoginItem.dart';

class LoginUI extends StatefulWidget {
  final SupportUI _supportUI;
  final MemberShipFactory _memberShipFactory;
  LoginUI(
      Key? key, this._supportUI, this._memberShipFactory)
      : super(key: key);

  @override
  State<StatefulWidget> createState() =>
      _LoginUI();
}

class _LoginUI extends State<LoginUI> {
  late final SupportUI _supportUI = widget._supportUI;
  late final MemberShipFactory _memberShipFactory = widget._memberShipFactory;

  @override
  initState() {
    _memberShipFactory.initLoginObserver(context);
    super.initState();
  }

  late Future<UserCredential?> _future;
  bool _isClicked = false;
  final BebeToast _bebeToast = BebeToast();
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(top: _supportUI.resHeight(50)),
                child: SizedBox(
                  width: _supportUI.resWidth(150),
                  height: _supportUI.resHeight(110),
                  child: Image.asset('images/splash_log.png'),
                ),
              ),
              SizedBox(
                height: _supportUI.deviceHieght/2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          routingLogin('google');
                          _isClicked = true;
                        });
                      },
                      child: LoginItem(null, _supportUI, 'google',),
                    ),
                    // GestureDetector(
                    //   onTap: (){
                    //     setState(() {
                    //       routingLogin('kakao');
                    //       _isClicked = true;
                    //     });
                    //   },
                    //   child: LoginItem(null, _supportUI, 'kakao',),
                    // ),
                    // GestureDetector(
                    //   onTap: (){
                    //     setState(() {
                    //       routingLogin('naver');
                    //       _isClicked = true;
                    //     });
                    //   },
                    //   child: LoginItem(null, _supportUI, 'naver',),
                    // ),
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          routingLogin('facebook');
                          _isClicked = true;
                        });
                      },
                      child: LoginItem(null, _supportUI, 'facebook',),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: _supportUI.resHeight(50)),
                      child: Platform.isAndroid?Container():GestureDetector(
                        onTap: (){
                          setState(() {
                            routingLogin('apple');
                            _isClicked = true;
                          });
                        },
                        child: LoginItem(null, _supportUI, 'apple',),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        _isClicked? Center(
          child: FutureBuilder(
              future: _future,
              builder: (context, snapshot){
                if(snapshot.connectionState == ConnectionState.done){
                  Timer.periodic(const Duration(seconds: 1), (timer) {
                    if(mounted){
                      if(snapshot.data == null){
                        setState(() {
                          _isClicked = false;
                        });
                        _bebeToast.showErrorToast(context, '로그인에 실패했습니다.');
                      }else{
                        _bebeToast.showInfoToast(context, '로그인에 성공했습니다.');
                        _memberShipFactory.moveToMainPage(context);
                      }
                    }
                    timer.cancel();
                  });
                }
                return LoadingUI(null, _supportUI);
              }),
        ):Container()
      ],
    );
  }
  void routingLogin(String input){
    switch(input){
      case 'google':
        _future = _memberShipFactory.loginWithGoogle();
        break;
      case 'kakao':
        _future =_memberShipFactory.loginWithKakao();
        break;
      case 'naver':
        _future = _memberShipFactory.loginWithNaver();
        break;
      case 'facebook':
        _future = _memberShipFactory.loginWithFaceBook();
        break;
      case 'apple':
        _future = _memberShipFactory.loginWithApple();
        break;
    }
  }
}
