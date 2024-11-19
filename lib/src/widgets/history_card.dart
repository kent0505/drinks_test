import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'cuper_button.dart';
import 'custom_container.dart';
import 'svg_widget.dart';

class HistoryCard extends StatelessWidget {
  const HistoryCard({super.key});

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
                onPressed: () {},
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
      child: const CustomContainer(
        height: 82,
        horizontal: 24,
        borderRadius: 36,
        child: Row(
          children: [
            Column(
              children: [],
            ),
          ],
        ),
      ),
    );
  }
}
