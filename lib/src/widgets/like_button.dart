import 'package:flutter/material.dart';

import 'my_button.dart';
import 'my_svg_widget.dart';

class LikeButton extends StatelessWidget {
  const LikeButton({
    super.key,
    required this.like,
  });

  final bool like;

  @override
  Widget build(BuildContext context) {
    return MyButton(
      onPressed: () {},
      minSize: 32,
      child: Container(
        height: 32,
        width: 32,
        decoration: BoxDecoration(
          color: const Color(0xffD9D9D9),
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            width: 1,
            color: const Color(0xffA22AD5),
          ),
        ),
        child: Center(
          child: MySvgWidget(like ? 'assets/like1.svg' : 'assets/like2.svg'),
        ),
      ),
    );
  }
}
