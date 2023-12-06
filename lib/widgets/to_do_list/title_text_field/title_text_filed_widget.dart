import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_app/widgets/main_widget.dart';

class TitleTextFiledWidget extends StatelessWidget {
  const TitleTextFiledWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) => {context.read<Model>().title = value},
      cursorColor: Color(0xFF8B8787),
      decoration: InputDecoration(
        labelStyle: TextStyle(color: Color(0xFF8B8787)),
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF8B8787), width: 1)),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF8B8787), width: 1)),
        label: Text("Title"),
      ),
    );
  }
}
