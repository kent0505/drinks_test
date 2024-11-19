import 'package:hive_flutter/hive_flutter.dart';

import '../models/mix_model.dart';
import '../utils.dart';
import 'prefs.dart';

String boxName = 'drinks_test_box';
String keyName = 'drinks_test_models';
List<MixModel> mixesList = [];

Future<void> initDB() async {
  try {
    await Hive.initFlutter();
    await getData();
    // await Hive.deleteBoxFromDisk(DB.boxName);
    Hive.registerAdapter(MixModelAdapter());
  } catch (e) {
    logger(e);
  }
}

Future<void> getModels() async {
  try {
    final box = await Hive.openBox(boxName);
    List data = box.get(keyName) ?? [];
    mixesList = data.cast<MixModel>();
    logger(mixesList.length);
  } catch (e) {
    logger(e);
  }
}

Future<void> updateModels() async {
  try {
    final box = await Hive.openBox(boxName);
    box.put(keyName, mixesList);
    mixesList = await box.get(keyName);
  } catch (e) {
    logger(e);
  }
}
