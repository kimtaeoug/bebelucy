import 'package:bebelucy_flutter/Page/FAQ/FAQList.dart';
import 'package:flutter/cupertino.dart';

class FAQProvider with ChangeNotifier{
  static final FAQProvider faqProvider = FAQProvider._init();
  FAQProvider._init();
  factory FAQProvider() => faqProvider;
  final FAQList faqList = FAQList();
  int faqIndex = 1;
  void setFAQIndex(int input){
    faqIndex = input;
    notifyListeners();
  }
  getFAQIndex() => faqIndex;

}