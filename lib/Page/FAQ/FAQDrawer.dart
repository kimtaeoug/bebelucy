import 'package:bebelucy_flutter/BebelucyColor.dart';
import 'package:bebelucy_flutter/BebelucyFont.dart';
import 'package:bebelucy_flutter/SupportUI.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FAQDrawer extends StatefulWidget {
  final SupportUI _supportUI;
  final BebelucyColor _bebelucyColor;
  final BebelucyFont _bebelucyFont;
  final String title;
  final String mainText;

  FAQDrawer(Key? key, this._supportUI, this._bebelucyColor, this._bebelucyFont,
      this.title, this.mainText)
      : super(key: key);

  @override
  State<StatefulWidget> createState() =>
      _FAQDrawer();
}

class _FAQDrawer extends State<FAQDrawer> {
  late final SupportUI _supportUI = widget._supportUI;
  late final BebelucyColor _bebelucyColor = widget._bebelucyColor;
  late final BebelucyFont _bebelucyFont = widget._bebelucyFont;
  late  final String title = widget.title;
  late final String mainText = widget.mainText;


  late final TextStyle titleTextStyle = TextStyle(
      color: _bebelucyColor.black,
      fontFamily: _bebelucyFont.appleM,
      fontSize: _supportUI.resFontSize(14),
      fontWeight: FontWeight.bold);
  late final TextStyle mainTextStyle = TextStyle(
      color: _bebelucyColor.boulder,
      fontSize: _supportUI.resFontSize(12),
      fontFamily: _bebelucyFont.appleM);

  bool _isClicked = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: _supportUI.resHeight(3)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                _isClicked = !_isClicked;
              });
            },
            child: SizedBox(
              width: _supportUI.deviceWidth * 0.9,
              height: _supportUI.resHeight(27),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: _supportUI.deviceWidth * 0.9,
                    height: _supportUI.resHeight(2),
                    color: _bebelucyColor.lavender.withOpacity(0.7),
                  ),
                  Container(
                    width: _supportUI.deviceWidth * 0.9,
                    height: _supportUI.resHeight(25),
                    decoration: BoxDecoration(
                        color: _bebelucyColor.zumthor,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10))),
                    child: Center(
                      child: SizedBox(
                        width: _supportUI.deviceWidth * 0.87,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              title,
                              style: titleTextStyle,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(
                              width: _supportUI.resWidth(12),
                              height: _supportUI.resHeight(12),
                              child: Image.asset(_isClicked
                                  ? 'images/drawer_close.png'
                                  : 'images/drawer_open.png'),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 600),
            width: _supportUI.deviceWidth * 0.87,
            height: _isClicked
                ? _getTextSize(mainText).height
                : _supportUI.resHeight(0),
            curve: Curves.easeIn,
            child: Padding(
              padding: EdgeInsets.only(left: _supportUI.resWidth(20)),
              child: Text(
                mainText,
                style: mainTextStyle,
              ),
            ),
          )
        ],
      ),
    );
  }

  Size _getTextSize(String text) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: mainTextStyle),
      textDirection: TextDirection.ltr,
    )..layout(
        minWidth: _supportUI.deviceWidth * 0.87,
        maxWidth: _supportUI.deviceWidth * 0.87);
    return textPainter.size;
  }
}
