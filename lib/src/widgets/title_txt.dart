import 'package:flutter/material.dart';

import '../core/config/fonts.dart';
import 'text_stroke.dart';

class TitleTxt extends StatelessWidget {
  const TitleTxt(this.title, {super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextStroke(
        title,
        fontSize: 30,
        fontFamily: Fonts.w900,
        height: 0.8,
      ),
    );
  }
}
