import 'package:flutter/material.dart';
import 'package:todo_list_app/styles/theme/app_colors.dart';

class ToDoTitleWidget extends StatelessWidget {
  final String title;

  const ToDoTitleWidget({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w600,
        color: AppColors.DarkPurple,
        fontFamily: "Jost",
      ),
    );
  }
}
