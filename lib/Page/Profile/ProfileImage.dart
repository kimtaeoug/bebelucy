import 'dart:typed_data';

import 'package:bebelucy_flutter/BebelucyColor.dart';
import 'package:bebelucy_flutter/BebelucyFont.dart';
import 'package:bebelucy_flutter/LocalDB/LocalDBProvider.dart';
import 'package:bebelucy_flutter/SupportUI.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileImage extends StatelessWidget {
  final SupportUI _supportUI;
  final BebelucyColor _bebelucyColor;
  final BebelucyFont _bebelucyFont;
  final LocalDBProvider localDBProvider;

  ProfileImage(Key? key, this._supportUI, this._bebelucyColor,
      this._bebelucyFont, this.localDBProvider)
      : super(key: key);
  late Uint8List? image;

  @override
  Widget build(BuildContext context) {
    image = localDBProvider.getProfileImage();
    return Padding(
      padding: EdgeInsets.only(
          top: _supportUI.resHeight(40),
          bottom: _supportUI.resHeight(30)),
      child: SizedBox(
        width: _supportUI.deviceWidth * 0.5,
        height: _supportUI.deviceWidth * 0.5,
        child: Stack(
          children: [
            Container(
              width: _supportUI.deviceWidth * 0.5,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _bebelucyColor.hawkesBlue,
                  border:
                      Border.all(color: _bebelucyColor.purpleHeart, width: 2),
                  boxShadow: [
                    BoxShadow(
                        color: _bebelucyColor.purpleHeart.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset: Offset(2.0, 3.0))
                  ]),
              child: Center(
                child: SizedBox(
                  width: image!=null?_supportUI.deviceWidth*0.5:_supportUI.resWidth(140),
                  height: image!=null?_supportUI.deviceWidth*0.5:_supportUI.resHeight(140),
                  child: image != null
                      ? CircleAvatar(
                    backgroundImage: MemoryImage(image!),
                  )
                      : Image.asset('images/babyphoto_image.png'),
                ),
              ),
            ),
            GestureDetector(
              onTap: () => selectImage(context),
              child: Align(
                alignment: AlignmentDirectional.bottomEnd,
                child: SizedBox(
                  width: _supportUI.resWidth(32),
                  height: _supportUI.resHeight(32),
                  child: Image.asset('images/editbabyimage.png'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  late final TextStyle selectImageTitleTextStyle = TextStyle(
      color: _bebelucyColor.black,
      fontWeight: FontWeight.w400,
      fontFamily: _bebelucyFont.appleM,
      fontSize: _supportUI.resFontSize(14));
  late final TextStyle selectImageTextStyle = TextStyle(
      color: _bebelucyColor.purpleHeart,
      fontFamily: _bebelucyFont.appleM,
      fontSize: _supportUI.resFontSize(14),
      fontWeight: FontWeight.bold);
  final ImagePicker _imagePicker = ImagePicker();

  Future<void> selectImage(BuildContext context) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        barrierColor: _bebelucyColor.black.withOpacity(0.5),
        builder: (BuildContext context) {
          return Dialog(
            insetPadding: EdgeInsets.symmetric(
                horizontal: _supportUI.deviceWidth * 0.23,
                vertical: _supportUI.deviceHieght * 0.41),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                    flex: 3,
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: _supportUI.resHeight(2),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: _supportUI.resWidth(17),
                        ),
                        Text('이미지 설정', style: selectImageTitleTextStyle, textAlign: TextAlign.center,),
                        Padding(padding: EdgeInsets.only(right: _supportUI.resWidth(5)), child: GestureDetector(
                          onTap: ()=>Navigator.pop(context),
                          child: SizedBox(
                            width: _supportUI.resWidth(12),
                            child: Image.asset('images/soundplayer_close.png', fit: BoxFit.fitWidth,),
                          ),
                        ),)
                      ],
                    ),
                    Container(
                      height: _supportUI.resHeight(2),
                      color: _bebelucyColor.onahau,
                    )
                  ],
                )),
                Expanded(
                  flex: 4,
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        selectHow(1).then((_) => Navigator.pop(context));
                      },
                      child: SizedBox(
                        width: _supportUI.deviceWidth * 0.27,
                        child: Center(
                          child: Text(
                            'Gallery',
                            style: selectImageTextStyle,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        selectHow(2).then((_) => Navigator.pop(context));
                      },
                      child: SizedBox(
                        width: _supportUI.deviceWidth * 0.27,
                        child: Center(
                          child: Text(
                            'Camera',
                            style: selectImageTextStyle,
                          ),
                        ),
                      ),
                    )
                  ],
                ))
              ],
            ),
          );
        });
  }
  Future<void> selectHow(int how) async {
    if (how == 1) {
      XFile? selected =
          await _imagePicker.pickImage(source: ImageSource.gallery);
      if(selected == null){
        return;
      }
      localDBProvider.setProfileImage(await selected.readAsBytes());

    } else {
      XFile? selected =
          await _imagePicker.pickImage(source: ImageSource.camera);
      if(selected == null){
        return;
      }
      localDBProvider.setProfileImage(await selected.readAsBytes());
    }
  }
}
