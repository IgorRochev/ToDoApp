import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_list_app/models/task_model.dart';

Future<void> initHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TaskModelAdapter());
  await Hive.openBox('ActivesTasks26');
  await Hive.openBox('FinishedTasks26');
}
