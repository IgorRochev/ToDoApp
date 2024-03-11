import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_list_app/models/task_model.dart';

Future<void> initHive() async{
  await Hive.initFlutter();
  Hive.registerAdapter(TaskModelAdapter());
  await Hive.openBox('ActivesTasks19');
  await Hive.openBox('FinishedTasks15');
}