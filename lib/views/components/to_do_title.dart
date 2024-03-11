import 'package:flutter/material.dart';
import 'package:todo_list_app/styles/theme/decorations.dart';
import 'package:todo_list_app/utils/show_todo_title.dart';

class ToDoTitleWidget extends StatelessWidget {
  const ToDoTitleWidget({
    super.key,
    required this.dateTime,
    required this.dateTimeNow,
  });

  final DateTime dateTime;
  final DateTime dateTimeNow;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 4, right: 4, top: 8),
        child: Container(
          width: double.infinity,
          decoration: Decorations.listViewTitleDecoration,
          child: Padding(
            padding: const EdgeInsets.only(left: 18, top: 8, bottom: 8),
            child: showToDoTitle(dateTime, dateTimeNow),
          ),
        ));
  }
}
