import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_app/styles/theme/app_colors.dart';
import 'package:todo_list_app/styles/theme/button_styles.dart';
import 'package:todo_list_app/view_models/tasks_lists_change_view_model.dart';

class AddTaskButton extends StatelessWidget {
  final formkey;
  const AddTaskButton({
    super.key,
    this.formkey,
  });

  @override
  Widget build(BuildContext context) {
    final onPressed = context.read<TasksListsChangeViewModel>();
    return TextButton(
        onPressed: () {
          if (formkey.currentState.validate()) {
            onPressed.addTask(context);
          }
        },
        style: ButtonStyle(
            textStyle: ButtonsStyles.addTaskButtonTextStyle,
            backgroundColor:
                const MaterialStatePropertyAll(AppColors.darkPurple),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ))),
        child: const Text(
          "Добавить задачу",
          style: TextStyle(color: Color(0xFFFFFFFF)),
        ));
  }
}
