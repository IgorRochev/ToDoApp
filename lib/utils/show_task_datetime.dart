import 'package:flutter/material.dart';
import 'package:todo_list_app/models/task_model.dart';
import 'package:todo_list_app/views/components/task_date.dart';
import 'package:todo_list_app/views/components/task_time.dart';

List<Widget> showTaskDateTime(
    TaskModel task, int listIndex, DateTime? pickedDateTime) {
  if (task.date != null) {
    if (task.time != null) {
      return [
        TaskDateWidget(
          task: task,
          listIndex: listIndex,
          pickedDateTime: pickedDateTime,
        ),
        TaskTimeWidget(
          task: task,
          listIndex: listIndex,
          pickedDateTime: pickedDateTime,
        )
      ];
    }
    return [
      TaskDateWidget(
        task: task,
        listIndex: listIndex,
        pickedDateTime: pickedDateTime,
      )
    ];
  }
  return [];
}
