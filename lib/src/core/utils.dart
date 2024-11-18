import 'dart:developer' as developer;

import 'package:flutter/material.dart';

int getCurrentTimestamp() => DateTime.now().millisecondsSinceEpoch ~/ 1000;
double getStatusBar(BuildContext context) =>
    MediaQuery.of(context).viewPadding.top;
double getBottom(BuildContext context) =>
    MediaQuery.of(context).viewPadding.bottom;
double getWidth(BuildContext context) => MediaQuery.of(context).size.width;
double getHeight(BuildContext context) => MediaQuery.of(context).size.height;

void logger(Object message) {
  try {
    developer.log(message.toString());
  } catch (e) {
    debugPrint(e.toString());
  }
}
