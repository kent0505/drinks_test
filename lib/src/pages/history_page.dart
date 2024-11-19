import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/mix/mix_bloc.dart';
import '../core/utils.dart';
import '../widgets/history_card.dart';
import '../widgets/title_text.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MixBloc, MixState>(
      builder: (context, state) {
        if (state is MixLoadedState) {
          return ListView(
            padding: EdgeInsets.zero,
            children: [
              SizedBox(height: 20 + getStatusBar(context)),
              const TitleText('HISTORY'),
              const SizedBox(height: 40),
              ...List.generate(
                state.mixes.length,
                (int index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 32),
                    child: HistoryCard(model: state.mixes[index]),
                  );
                },
              ),
            ],
          );
        }

        return Container();
      },
    );
  }
}
