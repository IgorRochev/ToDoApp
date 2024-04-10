import 'dart:typed_data';

import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class TaskModel {
  @HiveField(0)
  String title;

  @HiveField(1)
  String? subtitle;

  @HiveField(2)
  String? date;

  @HiveField(3)
  String? time;

  Uint8List? imageBytes;

  TaskModel(this.title, this.subtitle, this.date, this.time, this.imageBytes);
}

class TaskModelAdapter extends TypeAdapter<TaskModel> {
  @override
  final typeId = 0;

  @override
  TaskModel read(BinaryReader reader) {
    final title = reader.read();
    final subtitle = reader.read();
    final date = reader.read();
    final time = reader.read();
    final imageBytes = reader.read();
    // final imageBytes = reader.readByteList();
    return TaskModel(title, subtitle, date, time, imageBytes);
  }

  @override
  void write(BinaryWriter writer, TaskModel obj) {
    writer.write(obj.title);
    writer.write(obj.subtitle);
    writer.write(obj.date);
    writer.write(obj.time);
    // writer.write(value);
    writer.write(obj.imageBytes);
  }
}
