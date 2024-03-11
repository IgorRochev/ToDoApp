// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class EditTaskTitleTextField extends StatelessWidget {
  final TextEditingController titleController;
  const EditTaskTitleTextField({
    super.key,
    required this.titleController,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: TextFormField(
        controller: titleController,
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
            return 'Text is empty';
          }
          return null;
        },
      ),
    );
  }
}
