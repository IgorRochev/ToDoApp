import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_app/styles/theme/app_colors.dart';
import 'package:todo_list_app/styles/theme/button_styles.dart';
import 'package:todo_list_app/view_models/tasks_lists_change_view_model.dart';

class UpdateTaskButton extends StatelessWidget {
  final int index;
  final formkey;
  final date;
  final time;
  const UpdateTaskButton({
    super.key,
    required this.index,
    this.formkey,
    this.date,
    this.time,
  });

  @override
  Widget build(BuildContext context) {
    final onPressed = context.read<TasksListsChangeViewModel>();
    return TextButton(
        onPressed: () {
          context.read<TasksListsChangeViewModel>().date = date;
          context.read<TasksListsChangeViewModel>().time = time;
          if (formkey.currentState.validate()) {
            onPressed.updateTask(context, index);
          }
        },
        style: ButtonStyle(
            textStyle: ButtonsStyles.editTaskButtonsTextStyle,
            backgroundColor:
                const MaterialStatePropertyAll(AppColors.darkPurple),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ))),
        child: const Text(
          "Сохранить",
          style: TextStyle(color: Color(0xFFFFFFFF)),
        ));
  }
}
