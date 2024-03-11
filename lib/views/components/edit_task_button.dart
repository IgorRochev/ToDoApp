import 'package:flutter/material.dart';
import 'package:todo_list_app/styles/theme/app_colors.dart';

class EditTaskButtonWidget extends StatefulWidget {
  const EditTaskButtonWidget({
    super.key,
    required this.index,
  });
  final int index;

  @override
  State<EditTaskButtonWidget> createState() => _EditTaskButtonWidgetState();
}

class _EditTaskButtonWidgetState extends State<EditTaskButtonWidget> {
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
