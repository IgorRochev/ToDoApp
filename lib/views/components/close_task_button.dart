import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_app/styles/theme/app_colors.dart';
import 'package:todo_list_app/view_models/tasks_lists_change_view_model.dart';

class CloseTaskButton extends StatelessWidget {
  const CloseTaskButton({
    super.key,
    required this.index,
  });
  final int index;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        color: AppColors.lightPurple,
        onPressed: () =>
            context.read<TasksListsChangeViewModel>().closeTask(index),
        icon: const Icon(
          Icons.check_circle_outline_outlined,
          size: 25,
          color: AppColors.lightPurple,
        ));
  }
}
