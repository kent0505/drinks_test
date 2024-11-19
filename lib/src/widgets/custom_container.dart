import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
    this.height,
    this.horizontal = 0,
    required this.borderRadius,
    required this.child,
  });

  final double? height;
  final double horizontal;
  final double borderRadius;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      margin: EdgeInsets.only(
        bottom: 16,
        left: horizontal,
        right: horizontal,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(
          width: 1,
          color: Colors.white,
        ),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xff6000B5),
            Color(0xff000D99),
          ],
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0xffA22AD5),
            blurRadius: 10,
            spreadRadius: 5,
          ),
        ],
      ),
      child: child,
    );
  }
}
