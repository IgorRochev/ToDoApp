import 'package:flutter/material.dart';

class EditTaskDetailsTextField extends StatelessWidget {
  final TextEditingController subtitleController;
  const EditTaskDetailsTextField({
    super.key,
    required this.subtitleController,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: TextFormField(
        controller: subtitleController,
        decoration: const InputDecoration(
            label: Text("Подробности"),
            labelStyle: TextStyle(color: Color(0xFF8B8787)),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF8B8787), width: 1)),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF8B8787), width: 1))),
      ),
    );
  }
}
