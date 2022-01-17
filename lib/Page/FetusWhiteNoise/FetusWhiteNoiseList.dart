import 'dart:async';
import 'dart:io';

import 'package:bebelucy_flutter/BebelucyColor.dart';
import 'package:bebelucy_flutter/BebelucyFont.dart';
import 'package:bebelucy_flutter/Page/CommonUI/LoadingUI.dart';
import 'package:bebelucy_flutter/Page/WhiteNoise/WhiteNoiseProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import '../../SupportUI.dart';

class FetusWhiteNoiseList extends StatefulWidget {
  final SupportUI _supportUI;
  final BebelucyColor _bebelucyColor;
  final BebelucyFont _bebelucyFont;
  final WhiteNoiseProvider _whiteNoiseProvider;

  FetusWhiteNoiseList(Key? key, this._supportUI, this._bebelucyColor,
      this._bebelucyFont, this._whiteNoiseProvider)
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _FetusWhiteNoiseList();
}

class _FetusWhiteNoiseList extends State<FetusWhiteNoiseList> {
  late final SupportUI _supportUI = widget._supportUI;
  late final BebelucyColor _bebelucyColor = widget._bebelucyColor;
  late final BebelucyFont _bebelucyFont = widget._bebelucyFont;
  late final WhiteNoiseProvider _whiteNoiseProvider = widget._whiteNoiseProvider;


  late final TextStyle fileNameTextStyle = TextStyle(
      fontSize: _supportUI.resFontSize(10),
      fontFamily: _bebelucyFont.appleL,
      color: Colors.black);
  late final TextStyle selectedFileNameTextStyle = TextStyle(
    fontSize: _supportUI.resFontSize(10),
    fontFamily: _bebelucyFont.appleL,
    color: _bebelucyColor.purpleHeart
  );
  List<String> fetusList = [];

  @override
  void initState() {
    super.initState();
    Platform.isAndroid? initFetusSoundOfAndroid():initFetusSoundOfAndroid();
    Timer.periodic(const Duration(seconds: 2), (timer) {
      setState(() {
        _isLoading = true;
      });
      timer.cancel();
    });
  }
  bool _isLoading = false;

  String _selectedFile = '';
  @override
  Widget build(BuildContext context) {
    _selectedFile = _whiteNoiseProvider.getLocalMomSoundFile();
    return _isLoading?ListView.builder(
        itemCount: fetusList.length,
        itemBuilder: (context, idx) {
          return GestureDetector(
            onTap: (){
              if(_selectedFile != fetusList[idx]) {
                _whiteNoiseProvider.setLocalMomSoundFile(fetusList[idx]);
              }else{
                _whiteNoiseProvider.setLocalMomSoundFile('');
              }
            },
            child: SizedBox(
              width: _supportUI.deviceWidth * 17 / 18,
              height: _supportUI.resHeight(56),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: _supportUI.resWidth(56),
                    height: _supportUI.resHeight(56),
                    child: Image.asset('images/fetus_item.png'),
                  ),
                  SizedBox(
                    width: _supportUI.deviceWidth * 3 / 4,
                    height: _supportUI.resHeight(56),
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: _supportUI.resWidth(14)),
                      child: Center(
                        child: Text(
                          getRefinedFileName(fetusList[idx]),
                          style: _selectedFile == fetusList[idx]?selectedFileNameTextStyle:fileNameTextStyle,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        }):LoadingUI(null, _supportUI);
  }
  Future<void> initFetusSoundOfAndroid() async{
    await getExternalStorageDirectory().then((directory){
      if(directory != null){
        Directory _rootDirectory = directory.parent.parent.parent.parent;
        _rootDirectory.list(recursive: true, followLinks: true).listen((file) { 
          if(file.path.contains('.')){
            int extensionIdx = file.path.lastIndexOf('.');
            String extension = file.path.substring(extensionIdx+1);
            if(extension == 'mp3'){
              setState(() {
                fetusList.add(file.path);
              });
            }
          }
        });
      }
    });
  }

  String getRefinedFileName(String input) {
    int pathLast = input.lastIndexOf('/');
    return input.substring(pathLast + 1);
  }
}
