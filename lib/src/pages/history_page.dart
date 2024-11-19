import 'package:flutter/material.dart';

import '../core/utils.dart';
import '../widgets/history_card.dart';
import '../widgets/title_text.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        SizedBox(height: 20 + getStatusBar(context)),
        const TitleText('HISTORY'),
        const SizedBox(height: 40),
        ...List.generate(
          10,
          (int index) {
            return const HistoryCard();
          },
        ),
      ],
    );
  }
}
