import 'package:flutter/material.dart';

import '../core/config/fonts.dart';
import 'custom_container.dart';
import 'my_svg_widget.dart';

class TxtField extends StatefulWidget {
  const TxtField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.onChanged,
  });

  final TextEditingController controller;
  final String hintText;
  final void Function(String) onChanged;

  @override
  State<TxtField> createState() => _TxtFieldState();
}

class _TxtFieldState extends State<TxtField> {
  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      borderRadius: 12,
      height: 55,
      child: TextField(
        controller: widget.controller,
        textCapitalization: TextCapitalization.sentences,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontFamily: Fonts.w400,
        ),
        decoration: InputDecoration(
          prefixIcon: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [MySvgWidget('assets/search.svg')],
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 0,
            horizontal: 16,
          ),
          hintText: widget.hintText,
          hintStyle: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontFamily: Fonts.w400,
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
        ),
        onTapOutside: (event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        onChanged: widget.onChanged,
      ),
    );
  }
}
