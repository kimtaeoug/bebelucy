import 'package:bebelucy_flutter/BebelucyColor.dart';
import 'package:bebelucy_flutter/BebelucyFont.dart';
import 'package:bebelucy_flutter/Page/CommonUI/ContextMenu.dart';
import 'package:bebelucy_flutter/Page/FAQ/FAQEtcList.dart';
import 'package:bebelucy_flutter/Page/FAQ/FAQList.dart';
import 'package:bebelucy_flutter/Page/FAQ/FAQProductList.dart';
import 'package:bebelucy_flutter/Page/FAQ/FAQProvider.dart';
import 'package:bebelucy_flutter/Page/FAQ/FAQTop.dart';
import 'package:bebelucy_flutter/SupportUI.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Routes.dart';
import 'FAQApplicationLIst.dart';

class FAQPage extends StatelessWidget{
  final SupportUI _supportUI = SupportUI();
  final BebelucyColor _bebelucyColor = BebelucyColor();
  final BebelucyFont _bebelucyFont = BebelucyFont();
  final FAQList faqList = FAQList();
  late int faqIndex;
  late final TextStyle titleTextStyle = TextStyle(
    color: _bebelucyColor.boulder,
    fontFamily: _bebelucyFont.appleM,
    fontSize: _supportUI.resFontSize(14)
  );
  @override
  Widget build(BuildContext context) {
    final FAQProvider faqProvider = Provider.of<FAQProvider>(context);
    faqIndex = faqProvider.getFAQIndex();
    return SafeArea(child: Scaffold(
      backgroundColor: Colors.white,
      body: WillPopScope(
        onWillPop: (){
          Navigator.pop(context);
          return Future(() => false);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ContextMenu(null, _supportUI, true, false),
            FAQTop(null, _supportUI, _bebelucyColor, _bebelucyFont, faqProvider),
            whichFAQ(faqIndex)
          ],
        ),
      ),
    ));
  }
  Widget whichFAQ(int input){
    Widget result = FAQApplicationLIst(null, _supportUI, _bebelucyColor, _bebelucyFont, faqList, titleTextStyle);
    if(input == 2){
      result = FAQProductList(null, _supportUI, _bebelucyColor, _bebelucyFont, faqList, titleTextStyle);
    }else if(input ==3){
      result = FAQEtcList(null, _supportUI, _bebelucyColor, _bebelucyFont, faqList, titleTextStyle);
    }
    return result;
  }
}