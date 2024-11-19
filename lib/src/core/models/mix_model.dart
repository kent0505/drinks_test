import 'package:hive_flutter/hive_flutter.dart';

@HiveType(typeId: 0)
class MixModel {
  MixModel({
    required this.id,
    required this.date,
    required this.title,
    required this.ingredients,
  });

  @HiveField(0)
  int id;
  @HiveField(1)
  int date;
  @HiveField(2)
  String title;
  @HiveField(3)
  List<String> ingredients;
}

class MixModelAdapter extends TypeAdapter<MixModel> {
  @override
  final typeId = 0;

  @override
  MixModel read(BinaryReader reader) {
    return MixModel(
      id: reader.read(),
      date: reader.read(),
      title: reader.read(),
      ingredients: reader.read(),
    );
  }

  @override
  void write(BinaryWriter writer, MixModel obj) {
    writer.write(obj.id);
    writer.write(obj.date);
    writer.write(obj.title);
    writer.write(obj.ingredients);
  }
}
