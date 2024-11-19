import 'package:flutter/material.dart';

import '../core/config/fonts.dart';
import 'cuper_button.dart';

class DeleteDialog extends StatelessWidget {
  const DeleteDialog({
    super.key,
    required this.onDelete,
  });

  final void Function() onDelete;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: const Color(0xff000D99),
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff6000B5),
              Color(0xff000D99),
            ],
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text(
              'Delete?',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontFamily: Fonts.w900,
              ),
            ),
            const Spacer(),
            Row(
              children: [
                const SizedBox(width: 20),
                _Button(
                  title: 'No',
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const Spacer(),
                _Button(
                  title: 'Yes',
                  onPressed: () {
                    Navigator.pop(context);
                    onDelete();
                  },
                ),
                const SizedBox(width: 20),
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

class _Button extends StatelessWidget {
  const _Button({
    required this.title,
    required this.onPressed,
  });

  final String title;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return CuperButton(
      padding: 0,
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontFamily: Fonts.w600,
            ),
          ),
        ],
      ),
    );
  }
}
