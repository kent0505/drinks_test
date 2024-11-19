import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../core/config/fonts.dart';

class BigButton extends StatelessWidget {
  const BigButton({
    super.key,
    required this.title,
    this.width,
    required this.onPressed,
  });

  final String title;
  final double? width;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPressed,
      padding: EdgeInsets.zero,
      child: Container(
        height: 54,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 3,
            color: Colors.white,
          ),
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff8B28AB),
              Color(0xff5A17CB),
            ],
          ),
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 30,
              color: Colors.white,
              fontFamily: Fonts.w800,
            ),
          ),
        ),
      ),
    );
  }
}
