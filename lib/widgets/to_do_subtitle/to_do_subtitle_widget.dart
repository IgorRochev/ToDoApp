import 'package:flutter/material.dart';

class ToDoSubtitleWidget extends StatelessWidget {
  const ToDoSubtitleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      "TODO SUBTITLE",
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w400,
        fontFamily: "Jost",
        color: Color(0xFF000000),
      ),
    );
  }
}
