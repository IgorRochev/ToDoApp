import 'package:flutter/material.dart';
import 'package:todo_list_app/views/components/cancel_clear_tasks_button.dart';
import 'package:todo_list_app/views/components/complete_clear_tasks_button.dart';

Future<void> clearTasksDialog(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return const AlertDialog(
        title: Text('Очистить ваш список завершенных задач?'),
        content: Text(
          'Все завершенные задачи \n'
          'будут удалены из этого списка.\n'
          'Это действие нельзя отменить.',
        ),
        actions: <Widget>[
          CompleteClearTasksButton(),
          CancelClearTasksButton(),
        ],
      );
    },
  );
}
