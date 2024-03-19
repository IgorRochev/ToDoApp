import 'package:flutter/material.dart';
import 'package:todo_list_app/models/task_model.dart';
import 'package:todo_list_app/utils/show_task_overdue.dart';

class TaskTime extends StatelessWidget {
  const TaskTime({
    super.key,
    required this.task,
    this.pickedDateTime,
    required this.listIndex,
  });

  final int listIndex;
  final TaskModel task;
  final DateTime? pickedDateTime;

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
            text: ', ',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              fontFamily: "Jost",
              color: showTaskOverdue(task, listIndex),
            ),
            children: [
          TextSpan(
              text: '${task.time}',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                fontFamily: "Jost",
                color: showTaskOverdue(task, listIndex),
              )),
        ]));
  }
}
