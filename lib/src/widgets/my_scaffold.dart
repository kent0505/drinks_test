import 'package:flutter/material.dart';

import 'rotated_widget.dart';

class MyScaffold extends StatelessWidget {
  const MyScaffold({
    super.key,
    required this.body,
  });

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Image.asset(
            'assets/bg2.jpg',
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Positioned(
            top: -150,
            left: -200,
            child: RotatedWidget(
              degree: 175,
              child: Image.asset(
                'assets/bg1.png',
                height: 636,
                width: 636,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: -150,
            right: -150,
            child: RotatedWidget(
              degree: 5,
              child: Image.asset(
                'assets/bg1.png',
                height: 636,
                width: 636,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  const Color(0xffD9D9D9).withOpacity(0),
                  const Color(0xffA22AD5).withOpacity(0.6),
                  const Color(0xff5A17CB),
                ],
              ),
            ),
          ),
          body,
        ],
      ),
    );
  }
}
