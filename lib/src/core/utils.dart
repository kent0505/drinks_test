import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'models/mix_model.dart';

int getTimestamp() => DateTime.now().millisecondsSinceEpoch ~/ 1000;
String formatTimestamp(int timestamp) {
  DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
  return DateFormat('hh:mm a').format(dateTime);
}

double statusBar(BuildContext context) =>
    MediaQuery.of(context).viewPadding.top;

void logger(Object msg) => developer.log(msg.toString());

String boxname = 'drinks_test_box';
String keyname = 'drinks_test_models';
List<MixModel> mixesList = [];
bool onboard = true;

Future<void> initializeDb() async {
  await Hive.initFlutter();
  Hive.registerAdapter(MixModelAdapter());
  final prefs = await SharedPreferences.getInstance();
  // await prefs.clear();
  onboard = prefs.getBool('onboard') ?? true;
}

Future getMixes() async {
  final bx = await Hive.openBox(boxname);
  List data = bx.get(keyname) ?? [];
  mixesList = data.cast<MixModel>();
}

Future updateMixes() async {
  final bx = await Hive.openBox(boxname);
  bx.put(keyname, mixesList);
  mixesList = await bx.get(keyname);
}
