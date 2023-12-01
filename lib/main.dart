import 'package:flutter/material.dart';
import 'package:todo_list_app/widgets/finished_to_do_list/finished_to_do_list_widget.dart';
import 'package:todo_list_app/widgets/to_do_list/edit_task/edit_task_widget.dart';

import 'widgets/main_widget.dart';
import 'widgets/to_do_list/add_task/add_task_widget.dart';
import 'package:todo_list_app/styles/theme/app_colors.dart';

void main() {
  runApp(ToDoApp());
}

class ToDoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To Do App',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
            backgroundColor: AppColors.DarkPurple,
            toolbarHeight: 74,
            titleTextStyle: TextStyle(
              fontSize: 24,
              fontFamily: "Jost",
              fontWeight: FontWeight.w600,
            )),
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
