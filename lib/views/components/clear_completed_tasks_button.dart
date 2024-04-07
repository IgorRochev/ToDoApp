import 'package:flutter/material.dart';
import 'package:todo_list_app/views/components/clear_completed_tasks_dialog.dart';

class ClearCompletedTasksButton extends StatelessWidget {
  const ClearCompletedTasksButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 6, left: 14, bottom: 0),
      child: TextButton(
          style: ButtonStyle(
              textStyle: const MaterialStatePropertyAll(TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w400,
              )),
              overlayColor: MaterialStateProperty.all(Colors.transparent)),
          onPressed: () => {clearTasksDialog(context)},
          child: const Text(
            'Очистить',
          )),
    );
  }
}
