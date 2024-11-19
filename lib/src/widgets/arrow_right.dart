import 'package:flutter/material.dart';

class ArrowRight extends StatelessWidget {
  const ArrowRight({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 26,
      width: 54,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(26),
      ),
      child: const Center(
        child: Icon(
          Icons.arrow_forward,
          color: Color(0xffD13535),
          size: 20,
        ),
      ),
    );
  }
}
