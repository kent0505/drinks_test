import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../core/models/mix_model.dart';
import '../core/utils.dart';
import '../widgets/cuper_button.dart';
import '../widgets/custom_scaffold.dart';
import '../widgets/mix_button.dart';
import '../widgets/svg_widget.dart';
import '../widgets/title_text.dart';

class HistoryDetailPage extends StatefulWidget {
  const HistoryDetailPage({
    super.key,
    required this.mixModel,
  });

  final MixModel mixModel;

  @override
  State<HistoryDetailPage> createState() => _HistoryDetailPageState();
}

class _HistoryDetailPageState extends State<HistoryDetailPage> {
  @override
  void initState() {
    super.initState();
    logger(widget.mixModel.ingredients);
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Stack(
        children: [
          ListView(
            padding: EdgeInsets.zero,
            children: [
              SizedBox(height: 20 + getStatusBar(context)),
              TitleText(widget.mixModel.title.toUpperCase()),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Wrap(
                  spacing: 8,
                  runSpacing: 16,
                  children: widget.mixModel.ingredients
                      .map(
                        (title) => MixButton(
                          title: title,
                          current: title,
                          onPressed: (_) {},
                          readOnly: true,
                        ),
                      )
                      .toList(),
                ),
              ),
              const SizedBox(height: 100),
            ],
          ),
          Positioned(
            top: 11 + getStatusBar(context),
            left: 24,
            child: CuperButton(
              onPressed: () {
                context.pop();
              },
              minSize: 34,
              child: const SvgWidget('assets/back.svg'),
            ),
          ),
        ],
      ),
    );
  }
}
