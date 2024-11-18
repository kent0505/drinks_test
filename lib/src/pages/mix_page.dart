import 'package:flutter/material.dart';

import '../core/utils.dart';
import '../widgets/title_text.dart';

class MixPage extends StatelessWidget {
  const MixPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20 + getStatusBar(context)),
        const TitleText('CREATE YOUR\nOWN COCTAIL'),
      ],
    );
  }
}
