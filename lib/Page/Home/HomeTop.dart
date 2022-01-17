import 'dart:typed_data';

import 'package:bebelucy_flutter/BebelucyColor.dart';
import 'package:bebelucy_flutter/LocalDB/LocalDBProvider.dart';
import 'package:bebelucy_flutter/Page/CommonUI/ContextMenu.dart';
import 'package:bebelucy_flutter/Page/Home/TopArc.dart';
import 'package:bebelucy_flutter/SupportUI.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Routes.dart';

class HomeTop extends StatelessWidget {
  final SupportUI _supportUI;
  final BebelucyColor _bebelucyColor;
  final LocalDBProvider localDBProvider;

  HomeTop(Key? key, this._supportUI, this._bebelucyColor, this.localDBProvider)
      : super(key: key);
  late Uint8List? image;

  @override
  Widget build(BuildContext context) {
    image = localDBProvider.getProfileImage();
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ContextMenu(null, _supportUI, false, true),
        Padding(
          padding: EdgeInsets.only(top: _supportUI.resHeight(20)),
          child: GestureDetector(
            onTap: () => Navigator.pushNamed(context, Routes.profilePage),
            child: SizedBox(
              width: _supportUI.resWidth(120),
              height: _supportUI.resHeight(120),
              child: image != null
                  ? CircleAvatar(
                      backgroundImage: MemoryImage(image!),
                    )
                  : Image.asset('images/baby_image.png'),
            ),
          ),
        )
      ],
    );
  }
}
