import 'package:bebelucy_flutter/SupportUI.dart';
import 'package:flutter/cupertino.dart';

class LoginItem extends StatelessWidget{
  final SupportUI _supportUI;
  final String _loginValue;
  LoginItem(Key? key, this._supportUI, this._loginValue,):super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _supportUI.deviceWidth * 5 / 6,
      height: _supportUI.deviceHieght / 16,
      child: Image.asset('images/${_loginValue}_login.png'),
    );
  }

}