import 'package:flutter/material.dart';

class TitleTextFiledWidget extends StatelessWidget {
  const TitleTextFiledWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const TextField(
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
