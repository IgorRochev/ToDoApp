import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_list_app/styles/theme/app_colors.dart';
import 'package:todo_list_app/view_models/edit_task_fields_view_model.dart';

class SwitchDateButton extends StatelessWidget {
  final EditTaskFieldsViewModel addTask;

  const SwitchDateButton({super.key, required this.addTask});
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
              onPressed: !addTask.addTaskModel.dateGiveVerse
                  ? null
                  : () => addTask.selectDateToTask(context),
              child: Row(
                children: [
                  const Icon(
                    Icons.calendar_month_outlined,
                    color: AppColors.darkPurple,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Дата",
                        style: TextStyle(color: Color(0xFF8B8787)),
                      ),
                      if (addTask.addTaskModel.dateGiveVerse &
                          addTask.addTaskModel.datePickerOpened) ...[
                        Text(DateFormat('d.M.y')
                            .format(addTask.addTaskModel.currentDate)
                            .toString())
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
            value: addTask.addTaskModel.dateGiveVerse,
            onChanged: (bool newValue) {
              addTask.switchDate(context, newValue);
            },
          ),
        ],
      ),
    );
  }
}
