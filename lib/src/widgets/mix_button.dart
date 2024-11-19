import 'package:flutter/material.dart';

import '../core/config/fonts.dart';
import 'my_button.dart';

class MixButton extends StatelessWidget {
  const MixButton({
    super.key,
    required this.title,
    required this.current,
    required this.onPressed,
    this.readOnly = false,
  });

  final String title;
  final String current;
  final bool readOnly;
  final void Function(String) onPressed;

  @override
  Widget build(BuildContext context) {
    return MyButton(
      onPressed: readOnly
          ? null
          : () {
              onPressed(title);
            },
      minSize: 40,
      child: Container(
        height: 40,
        margin: const EdgeInsets.only(right: 8),
        padding: const EdgeInsets.symmetric(horizontal: 24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: identical(title, current) ? null : const Color(0xff2C0040),
          border: Border.all(
            width: 1,
            color:
                identical(title, current) ? Colors.transparent : Colors.white,
          ),
          gradient: identical(title, current)
              ? const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xff8B28AB),
                    Color(0xff5A17CB),
                  ],
                )
              : null,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontFamily: Fonts.w400,
            ),
          ),
        ),
      ),
    );
  }
}
