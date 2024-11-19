import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';

import '../blocs/mix/mix_bloc.dart';
import '../core/config/fonts.dart';
import '../core/models/mix_model.dart';
import '../core/utils.dart';
import 'arrow_right.dart';
import 'my_button.dart';
import 'custom_container.dart';
import 'delete_dialog.dart';
import 'my_svg_widget.dart';
import 'text_stroke.dart';

class HistoryCard extends StatefulWidget {
  const HistoryCard({
    super.key,
    required this.model,
  });

  final MixModel model;

  @override
  State<HistoryCard> createState() => _HistoryCardState();
}

class _HistoryCardState extends State<HistoryCard>
    with SingleTickerProviderStateMixin {
  late final SlidableController slidableController;

  @override
  void initState() {
    super.initState();
    slidableController = SlidableController(this);
  }

  void closeSlidable() {
    slidableController.close();
  }

  @override
  void dispose() {
    slidableController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Slidable(
      controller: slidableController,
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        extentRatio: 0.2,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              MyButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return DeleteDialog(
                        onDelete: () {
                          context
                              .read<MixBloc>()
                              .add(DelMixEvent(mix: widget.model));
                          slidableController.close();
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
                    child: MySvgWidget('assets/delete.svg'),
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
        child: MyButton(
          onPressed: () {
            context.push('/history', extra: widget.model);
          },
          child: Row(
            children: [
              const SizedBox(width: 32),
              SizedBox(
                width: 54,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  child: MySvgWidget('assets/glass${widget.model.id}.svg'),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextStroke(
                      widget.model.title,
                      borderColor: const Color(0xffA22AD5),
                      shadows: const [
                        BoxShadow(
                          color: Color(0xffB300FF),
                          blurRadius: 22,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const MySvgWidget('assets/clock.svg'),
                        const SizedBox(width: 8),
                        Text(
                          formatTimestamp(widget.model.date),
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
      ),
    );
  }
}
