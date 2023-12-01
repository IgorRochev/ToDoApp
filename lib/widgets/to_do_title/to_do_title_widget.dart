import 'package:flutter/material.dart';
import 'package:todo_list_app/styles/theme/app_colors.dart';

class ToDoTitleWidget extends StatelessWidget {
  const ToDoTitleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      "TODO TITLE",
      style: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w600,
        color: AppColors.DarkPurple,
        fontFamily: "Jost",
      ),
    );
  }
}
