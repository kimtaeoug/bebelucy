import 'package:bebelucy_flutter/BebelucyColor.dart';
import 'package:bebelucy_flutter/BebelucyFont.dart';
import 'package:bebelucy_flutter/Page/FAQ/FAQProvider.dart';
import 'package:bebelucy_flutter/SupportUI.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FAQNavigation extends StatelessWidget {
  final SupportUI _supportUI;
  final BebelucyColor _bebelucyColor;
  final BebelucyFont _bebelucyFont;
  final FAQProvider faqProvider;
  FAQNavigation(
      Key? key, this._supportUI, this._bebelucyColor, this._bebelucyFont, this.faqProvider)
      : super(key: key);
  
  late final TextStyle itemTextStyle = TextStyle(fontFamily: _bebelucyFont.appleM, fontSize: _supportUI.resFontSize(14), color: _bebelucyColor.boulder);
  late final TextStyle activatedItemTextStyle = TextStyle(fontFamily: _bebelucyFont.appleB, fontSize: _supportUI.resFontSize(14), color: Colors.white);
  late int faqIndex;
  @override
  Widget build(BuildContext context) {
    faqIndex = faqProvider.getFAQIndex();
    return Container(
      width: _supportUI.deviceWidth,
      height: _supportUI.resHeight(30),
      color: _bebelucyColor.whiteLilac2,
      child: Stack(
        children: [
          Center(
            child: SizedBox(
              width: _supportUI.deviceWidth*0.7,
              height: _supportUI.resHeight(17),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: ()=>faqProvider.setFAQIndex(1),
                    child: SizedBox(
                      child: Text('앱 관련',style: itemTextStyle,),
                    ),
                  ),
                  GestureDetector(
                    onTap: ()=>faqProvider.setFAQIndex(2),
                    child: SizedBox(
                      child: Text('제품 관련',style: itemTextStyle,),
                    ),
                  ),
                  GestureDetector(
                    onTap: ()=>faqProvider.setFAQIndex(3),
                    child: SizedBox(
                      child: Text('기타',style: itemTextStyle,),
                    ),
                  )
                ],
              ),
            ),
          ),
          Center(
            child: SizedBox(
              width: _supportUI.deviceWidth*0.85,
              height: _supportUI.resHeight(30),
              child: AnimatedAlign(
                duration: Duration(milliseconds: 300),
                alignment: whichFaqIndex(faqIndex),
                child: Container(
                  width: _supportUI.resWidth(85),
                  height: _supportUI.resHeight(30),
                  decoration: BoxDecoration(
                      color: _bebelucyColor.purpleHeart,
                      borderRadius: BorderRadius.all(Radius.circular(30))
                  ),
                  child: Center(
                    child: Text(whichTitle(faqIndex), style: activatedItemTextStyle,),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
  AlignmentGeometry whichFaqIndex(int idx){
    AlignmentGeometry result = AlignmentDirectional.centerStart;
    switch(idx){
      case 2:
        result = AlignmentDirectional.center;
        break;
      case 3:
        result = AlignmentDirectional.centerEnd;
        break;
    }
    return result;
  }
  String whichTitle(int idx){
    String result = '앱 관련';
    switch(idx){
      case 2:
        result = '제품 관련';
        break;
      case 3:
        result = '기타';
        break;
    }
    return result;
  }
}
