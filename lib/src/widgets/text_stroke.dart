import 'package:flutter/material.dart';

import '../core/config/fonts.dart';

class TextStroke extends StatelessWidget {
  const TextStroke(
    this.title, {
    super.key,
    this.fontSize = 20,
    this.strokeWidth = 4,
    this.height = 1,
    this.fontFamily = Fonts.w700,
    this.borderColor = const Color(0xff5418FF),
    this.textColor = Colors.white,
    this.shadows,
  });

  final String title;
  final double fontSize;
  final double strokeWidth;
  final double height;
  final String fontFamily;
  final Color borderColor;
  final Color textColor;
  final List<Shadow>? shadows;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        // border.
        Text(
          title,
          style: TextStyle(
            fontSize: fontSize,
            fontFamily: fontFamily,
            height: height,
            shadows: shadows,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = strokeWidth
              ..color = borderColor,
          ),
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: fontSize,
            fontFamily: fontFamily,
            height: height,
            color: textColor,
            shadows: shadows,
          ),
        ),
      ],
    );
  }
}
