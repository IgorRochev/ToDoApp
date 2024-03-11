import 'package:flutter/material.dart';
import 'package:todo_list_app/utils/show_task_overdue.dart';

class TaskDateWidget extends StatelessWidget {
  const TaskDateWidget({
    super.key,
    required this.task,
    this.pickedDateTime,
    required this.listIndex,
  });
  final int listIndex;
  final task;
  final DateTime? pickedDateTime;

  @override
  Widget build(BuildContext context) {
    return Text(
      task.date,
      style: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        fontFamily: "Jost",
        color: showTaskOverdue(task, listIndex),
      ),
    );
  }
}
