import 'package:flutter/material.dart';
import 'package:todo_list_app/styles/theme/app_colors.dart';
import 'package:todo_list_app/view_models/edit_task_fields_view_model.dart';

class SwitchTimeButton extends StatelessWidget {
  final EditTaskFieldsViewModel addTask;

  const SwitchTimeButton({super.key, required this.addTask});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Stack(
        alignment: AlignmentDirectional.centerEnd,
        children: [
          TextButton(
              style: ButtonStyle(
                minimumSize: const MaterialStatePropertyAll(Size(0, 50)),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                padding: const MaterialStatePropertyAll(
                    EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 4)),
                side: const MaterialStatePropertyAll(BorderSide(width: 0.7)),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ),
              onPressed: !addTask.addTaskModel.timeGiveVerse
                  ? null
                  : () => addTask.selectTimeToTask(context),
              child: Row(
                children: [
                  const Icon(
                    Icons.timer,
                    color: AppColors.darkPurple,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Время",
                        style: TextStyle(color: Color(0xFF8B8787)),
                      ),
                      if (addTask.addTaskModel.timeGiveVerse &
                          addTask.addTaskModel.timePickerOpened) ...[
                        Text(addTask.addTaskModel.currentTime.format(context))
                      ],
                    ],
                  ),
                ],
              )),
          Switch(
            activeColor: AppColors.darkPurple,
            inactiveThumbColor: AppColors.darkPurple.withOpacity(0.6),
            activeTrackColor: const Color(0xFF8B8787).withOpacity(0.5),
            inactiveTrackColor: const Color(0xFF8B8787).withOpacity(0.4),
            value: addTask.addTaskModel.timeGiveVerse,
            onChanged: (bool newValue) {
              addTask.switchTime(context, newValue);
            },
          ),
        ],
      ),
    );
  }
}
