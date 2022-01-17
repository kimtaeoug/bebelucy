import 'package:bebelucy_flutter/BebelucyColor.dart';
import 'package:flutter/material.dart';

class FetusThumb extends SliderComponentShape {
  final double _width;
  final double _height;
  final BebelucyColor _bebelucyColor;

  const FetusThumb(this._width, this._height, this._bebelucyColor);

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size(_width, _height);
  }

  @override
  void paint(PaintingContext context, Offset center,
      {required Animation<double> activationAnimation,
      required Animation<double> enableAnimation,
      required bool isDiscrete,
      required TextPainter labelPainter,
      required RenderBox parentBox,
      required SliderThemeData sliderTheme,
      required TextDirection textDirection,
      required double value,
      required double textScaleFactor,
      required Size sizeWithOverflow}) {
    final Canvas canvas = context.canvas;
    final rect = Rect.fromCircle(center: center, radius: _height*2/3);
    final rrect = RRect.fromRectAndRadius(
        Rect.fromPoints(
            Offset(rect.left+5, rect.top), Offset(rect.right-5, rect.bottom)),
        Radius.circular(3));
    final fillPaint = Paint()
      ..color = _bebelucyColor.purpleHeart
      ..style = PaintingStyle.fill;
    canvas.drawRRect(rrect, fillPaint);
  }
}
