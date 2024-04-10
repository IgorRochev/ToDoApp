import 'package:flutter/material.dart';
import 'package:todo_list_app/styles/theme/app_colors.dart';
import 'package:todo_list_app/view_models/edit_task_fields_view_model.dart';

class PickImageButton extends StatelessWidget {
  final EditTaskFieldsViewModel addTask;
  const PickImageButton({super.key, required this.addTask});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: TextButton(
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
          onPressed: () => {addTask.pickImageToTask(context)},
          child: const Row(
            children: [
              Icon(
                Icons.image,
                color: AppColors.darkPurple,
              ),
              SizedBox(
                width: 20,
              ),
              Text('Добавить изображение',
                  style: TextStyle(
                    color: Color(0xFF8B8787),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
