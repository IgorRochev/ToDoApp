import 'package:flutter/material.dart';

abstract class Decorations {
  static final listViewTitleDecoration = BoxDecoration(
    color: const Color(0xFFFFFFFF),
    borderRadius: BorderRadius.circular(15),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.25),
        blurRadius: 2,
        offset: const Offset(0, 6),
      ),
    ],
  );

  static final taskDecoration = BoxDecoration(
    color: const Color(0xFFFFFFFF),
    borderRadius: BorderRadius.circular(15),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.25),
        blurRadius: 4,
        offset: const Offset(0, 4),
      ),
    ],
  );
}
