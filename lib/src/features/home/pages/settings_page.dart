import 'package:drinks_test/src/core/widgets/texts/title_text.dart';
import 'package:flutter/material.dart';

import '../../../core/utils.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20 + getStatusBar(context)),
        const TitleText('SETTINGS'),
      ],
    );
  }
}
