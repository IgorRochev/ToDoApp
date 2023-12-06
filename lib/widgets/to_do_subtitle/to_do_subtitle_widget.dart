import 'package:flutter/material.dart';

class ToDoSubtitleWidget extends StatelessWidget {
  final String subtitle;

  const ToDoSubtitleWidget({
    super.key,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      subtitle,
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
