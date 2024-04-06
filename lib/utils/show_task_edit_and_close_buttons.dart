import 'package:flutter/material.dart';
import 'package:todo_list_app/utils/constants.dart';
import 'package:todo_list_app/views/components/close_task_button.dart';
import 'package:todo_list_app/views/components/edit_task_button.dart';

List<Widget> showTaskEditAndCloseButtons(int listIndex, int taskIndex) {
  if (listIndex == toDoListIndex) {
    return [
      EditTaskButton(
        index: taskIndex,
      ),
      CloseTaskButton(
        index: taskIndex,
      )
    ];
  } else {
    return [];
  }
}
