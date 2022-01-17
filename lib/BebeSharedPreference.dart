import 'package:shared_preferences/shared_preferences.dart';

class BebeSharedPreference {
  static final BebeSharedPreference bebeSharedPreference =
      BebeSharedPreference._init();

  BebeSharedPreference._init();

  factory BebeSharedPreference() => bebeSharedPreference;

  late final SharedPreferences _prefs;

  Future<void> initSharedPreference() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<void> saveFetusFile(String input) async {
    await _prefs.setString('fetus', input);
  }

  String getFetusFile()=>_prefs.getString('fetus')!=null?_prefs.getString('fetus')!:'';
}
