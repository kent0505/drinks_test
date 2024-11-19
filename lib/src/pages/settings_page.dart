import 'package:flutter/material.dart';

import '../core/config/fonts.dart';
import '../core/utils.dart';
import '../widgets/cuper_button.dart';
import '../widgets/custom_container.dart';
import '../widgets/svg_widget.dart';
import '../widgets/title_text.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20 + getStatusBar(context)),
        const TitleText('SETTINGS'),
        const Spacer(),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: CustomContainer(
            borderRadius: 12,
            child: Column(
              children: [
                SizedBox(height: 22),
                _Button(id: 1, title: 'Share with friends'),
                _Button(id: 2, title: 'Privacy Policy'),
                _Button(id: 3, title: 'Terms of use'),
                _Button(id: 4, title: 'Logout'),
                SizedBox(height: 22),
              ],
            ),
          ),
        ),
        const Spacer(flex: 2),
      ],
    );
  }
}

class _Button extends StatelessWidget {
  const _Button({
    required this.id,
    required this.title,
  });

  final int id;
  final String title;

  @override
  Widget build(BuildContext context) {
    return CuperButton(
      onPressed: () {},
      child: SizedBox(
        height: 56,
        child: Row(
          children: [
            const SizedBox(width: 20),
            SvgWidget('assets/set$id.svg'),
            const SizedBox(width: 14),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontFamily: Fonts.w800,
                  color: Colors.white,
                ),
              ),
            ),
            const Icon(
              Icons.chevron_right,
              color: Color(0xff33FF00),
            ),
            const SizedBox(width: 14),
          ],
        ),
      ),
    );
  }
}
