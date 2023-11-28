import 'package:flutter/material.dart';
import 'package:todo_list_app/widgets/finished_to_do_list/finished_to_do_list_widget.dart';
import 'package:todo_list_app/widgets/main/edit_task/edit_task_widget.dart';

import 'widgets/main/main_widget.dart';
import 'widgets/main/add_task/add_task_widget.dart';

void main() {
  runApp(ToDoApp());
}

class ToDoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'To Do App',
      theme: ThemeData(
          // appBarTheme: const AppBarTheme(
          // backgroundColor: Color.fromRGBO(3, 37, 65, 1), centerTitle: true),
          ),
      routes: {
        '/main': (context) => const MainWidget(),
        '/main/add_task': (context) => const AddTaskWidget(),
        '/main/edit_task': (context) => const EditTaskWidget(),
        '/completed': (context) => const FinishedToDoListWidget(),
      },
      initialRoute: '/main',
    );
  }
}
