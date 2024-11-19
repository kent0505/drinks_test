import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/config/fonts.dart';
import '../widgets/my_button.dart';
import '../widgets/big_button.dart';
import '../widgets/my_scaffold.dart';
import '../widgets/my_svg_widget.dart';
import '../widgets/text_stroke.dart';

class OnboardPage extends StatefulWidget {
  const OnboardPage({super.key});

  @override
  State<OnboardPage> createState() => _OnboardPageState();
}

class _OnboardPageState extends State<OnboardPage> {
  void onStart() async {
    SharedPreferences.getInstance().then((prefs) {
      prefs.setBool('onboard', false);
    });
    context.go('/home');
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const Spacer(),
            const MySvgWidget('assets/onboard.svg'),
            const SizedBox(height: 40),
            const Row(
              children: [
                TextStroke(
                  'Welcome to\nPlinbar Drinks',
                  fontSize: 36,
                ),
              ],
            ),
            const SizedBox(height: 24),
            const Text(
              'Have fun, discover new ingredient combinations and become a true cocktail guru with Plinbar Drinks!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: Fonts.w400,
              ),
            ),
            const SizedBox(height: 24),
            BigButton(
              title: 'Start',
              onPressed: onStart,
            ),
            const SizedBox(height: 24),
            MyButton(
              onPressed: () {},
              minSize: 20,
              child: Text(
                'Terms of use  |  Privacy Policy',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.5),
                  fontSize: 14,
                  fontFamily: Fonts.w400,
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
