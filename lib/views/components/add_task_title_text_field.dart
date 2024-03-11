import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_app/view_models/tasks_lists_change_view_model.dart';

class AddTaskTitleTextField extends StatelessWidget {
  const AddTaskTitleTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: TextFormField(
        onChanged: (value) =>
            {context.read<TasksListsChangeViewModel>().title = value},
        decoration: const InputDecoration(
          label: Text("Название"),
          labelStyle: TextStyle(color: Color(0xFF8B8787)),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF8B8787), width: 1)),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF8B8787), width: 1)),
        ),
        validator: (text) {
          if (text == null || text.isEmpty) {
            return 'Обязательное поле';
          }
          return null;
        },
      ),
    );
  }
}
