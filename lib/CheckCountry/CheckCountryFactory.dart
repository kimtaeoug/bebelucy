import 'package:devicelocale/devicelocale.dart';

class CheckCountryFactory{
  static final CheckCountryFactory checkCountryFactory = CheckCountryFactory._init();
  CheckCountryFactory._init();
  factory CheckCountryFactory() => checkCountryFactory;

  late String language;
  late String locale;
  Future<void> initCheckCountry()async{
    List? rawlanguages = await Devicelocale.preferredLanguages;
    String? rawlocale = await Devicelocale.currentLocale;
    if(rawlanguages!=null && rawlocale != null){
      language = rawlanguages.first;
      locale = rawlocale;
    }
  }
}