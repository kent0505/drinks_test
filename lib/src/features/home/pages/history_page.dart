import 'package:flutter/material.dart';

import '../../../core/utils.dart';
import '../../../core/widgets/texts/title_text.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20 + getStatusBar(context)),
        const TitleText('HISTORY'),
      ],
    );
  }
}
