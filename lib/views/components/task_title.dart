import 'package:flutter/material.dart';
import 'package:todo_list_app/styles/theme/app_colors.dart';

class TaskTitle extends StatelessWidget {
  final String title;

  const TaskTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w600,
        color: AppColors.darkPurple,
        fontFamily: "Jost",
      ),
    );
  }
}
