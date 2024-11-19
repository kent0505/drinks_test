import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

int getTimestamp() => DateTime.now().millisecondsSinceEpoch ~/ 1000;
String formatTimestamp(int timestamp) {
  DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
  return DateFormat('hh:mm a').format(dateTime);
}

double getStatusBar(BuildContext context) =>
    MediaQuery.of(context).viewPadding.top;
// double getWidth(BuildContext context) => MediaQuery.of(context).size.width;
// double getHeight(BuildContext context) => MediaQuery.of(context).size.height;

void logger(Object msg) => developer.log(msg.toString());
