import 'package:bebelucy_flutter/BebelucyColor.dart';
import 'package:bebelucy_flutter/BebelucyFont.dart';
import 'package:bebelucy_flutter/SupportUI.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AutoPositionedList extends StatefulWidget{
  final SupportUI _supportUI = SupportUI();
  final BebelucyColor _bebelucyColor = BebelucyColor();
  final BebelucyFont _bebelucyFont = BebelucyFont();
  final List dummy = ['1','2','3','4','5'];
  @override
  State<StatefulWidget> createState()=>_AutoPositionedList();
}

class _AutoPositionedList extends State<AutoPositionedList>{
  late final SupportUI _supportUI = widget._supportUI;
  late final BebelucyColor _bebelucyColor = widget._bebelucyColor;
  late final BebelucyFont _bebelucyFont = widget._bebelucyFont;
  late final List dummy = widget.dummy;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _supportUI.resWidth(50),
      height: _supportUI.resHeight(30),
      child: Center(
        child: CupertinoPicker.builder(
          selectionOverlay: CupertinoPickerDefaultSelectionOverlay(background: Colors.transparent,),
            itemExtent: 10,
            onSelectedItemChanged: (value){

        }, itemBuilder: (context, idx){
            return Text(dummy[1]);
        }),
          // child: CupertinoPicker(
          //   itemExtent: 10,
          //   children: List.generate(dummy.length, (index) => Text(dummy[index])),
          //   onSelectedItemChanged: (value){
          //
          //   },
          // )
      ),
    );
  }
  
}


//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: _supportUI.deviceWidth * 2 / 7,
//       height: _supportUI.deviceHieght / 16,
//       child: Center(
//         child: ListWheelScrollView(
//           itemExtent: _supportUI.deviceHieght / 16,
//           children: List.generate(
//               bloodTypeList.length,
//               (index) => Center(
//                     child: Text(
//                       bloodTypeList[index],
//                       style: bloodTypeTextStyle,
//                     ),
//                   )),
//         ),
//       ),
//     );
//   }
// }

