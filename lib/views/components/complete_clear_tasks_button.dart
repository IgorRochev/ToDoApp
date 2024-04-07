import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_app/styles/theme/app_colors.dart';
import 'package:todo_list_app/styles/theme/button_styles.dart';
import 'package:todo_list_app/view_models/tasks_lists_change_view_model.dart';

class CompleteClearTasksButton extends StatelessWidget {
  const CompleteClearTasksButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
          textStyle: ButtonsStyles.clearWindowButtonsTextStyle,
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ))),
      onPressed: () {
        context.read<TasksListsChangeViewModel>().clearCompletedTasks(context);
      },
      child: const Text(
        'Очистить',
        style: TextStyle(
          color: AppColors.darkPurple,
        ),
      ),
    );
  }
}
