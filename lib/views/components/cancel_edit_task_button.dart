import 'package:flutter/material.dart';
import 'package:todo_list_app/styles/theme/app_colors.dart';
import 'package:todo_list_app/styles/theme/button_styles.dart';

class CancelEditButton extends StatelessWidget {
  const CancelEditButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () => {Navigator.of(context).pop()},
        style: ButtonStyle(
            textStyle: ButtonsStyles.editTaskButtonsTextStyle,
            backgroundColor:
                const MaterialStatePropertyAll(AppColors.darkPurple),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ))),
        child: const Text(
          "Отменить",
          style: TextStyle(color: Color(0xFFFFFFFF)),
        ));
  }
}
