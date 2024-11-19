import 'package:drinks_test/src/widgets/delete_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../blocs/mix/mix_bloc.dart';
import '../core/config/fonts.dart';
import '../core/models/mix_model.dart';
import '../core/utils.dart';
import 'arrow_right.dart';
import 'cuper_button.dart';
import 'custom_container.dart';
import 'svg_widget.dart';
import 'text_stroke.dart';

class HistoryCard extends StatelessWidget {
  const HistoryCard({
    super.key,
    required this.model,
  });

  final MixModel model;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        extentRatio: 0.2,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              CuperButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return DeleteDialog(
                        title: 'Delete?',
                        onYes: () {
                          context
                              .read<MixBloc>()
                              .add(DeleteMixEvent(mix: model));
                        },
                      );
                    },
                  );
                },
                child: Container(
                  height: 48,
                  width: 48,
                  margin: const EdgeInsets.all(1),
                  decoration: BoxDecoration(
                    color: const Color(0xFFEB5757),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Center(
                    child: SvgWidget('assets/delete.svg'),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      child: CustomContainer(
        height: 82,
        horizontal: 24,
        borderRadius: 36,
        child: Row(
          children: [
            const SizedBox(width: 32),
            SizedBox(
              width: 54,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 14),
                child: SvgWidget('assets/glass${model.id}.svg'),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextStroke(
                    model.title,
                    borderColor: const Color(0xffA22AD5),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SvgWidget('assets/clock.svg'),
                      const SizedBox(width: 8),
                      Text(
                        formatTimestamp(model.date),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontFamily: Fonts.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const ArrowRight(),
            const SizedBox(width: 32),
          ],
        ),
      ),
    );
  }
}
