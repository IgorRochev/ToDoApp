import 'package:flutter/material.dart';

class TaskSubtitle extends StatelessWidget {
  final String subtitle;

  const TaskSubtitle({
    super.key,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      subtitle,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        fontFamily: "Jost",
        color: Color(0xFF000000),
      ),
    );
  }
}
