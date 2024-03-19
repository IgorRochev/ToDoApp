import 'package:flutter/material.dart';
import 'package:todo_list_app/styles/theme/app_colors.dart';

class EditTaskButton extends StatefulWidget {
  const EditTaskButton({
    super.key,
    required this.index,
  });
  final int index;

  @override
  State<EditTaskButton> createState() => _EditTaskButtonState();
}

class _EditTaskButtonState extends State<EditTaskButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pushNamed(context, '/edit_task', arguments: widget.index);
        },
        icon: const Icon(
          Icons.mode_edit_outline_outlined,
          size: 25,
          color: AppColors.lightPurple,
        ));
  }
}
