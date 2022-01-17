import 'package:bebelucy_flutter/BebelucyColor.dart';
import 'package:flutter/material.dart';

class WhiteNoisSliderThumb extends SliderComponentShape {
  final double width;
  final double height;
  final BebelucyColor _bebelucyColor;
  const WhiteNoisSliderThumb(this.width, this.height, this._bebelucyColor);

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size(width,height);
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

    final rect = Rect.fromCircle(center: center, radius: height);

    final rrect = RRect.fromRectAndRadius(
      Rect.fromPoints(
        Offset(rect.left , rect.top -4),
        Offset(rect.right , rect.bottom+4),
      ),
      Radius.circular(3),
    );

    final fillPaint = Paint()
      ..color = _bebelucyColor.purpleHeart
      ..style = PaintingStyle.fill;
    canvas.drawRRect(rrect, fillPaint);
  }
}
