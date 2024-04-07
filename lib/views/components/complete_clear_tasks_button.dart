import 'package:flutter/material.dart';
import 'package:todo_list_app/styles/theme/app_colors.dart';
import 'package:todo_list_app/styles/theme/button_styles.dart';

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
      onPressed: () {},
      child: const Text(
        'Очистить',
        style: TextStyle(
          color: AppColors.darkPurple,
        ),
      ),
    );
  }
}
