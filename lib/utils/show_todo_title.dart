import 'package:flutter/material.dart';

Widget showToDoTitle(DateTime dateTime, DateTime dateTimeNow) {
  Text title;
  (dateTime.isAtSameMomentAs(DateTime(
          dateTimeNow.year, dateTimeNow.month, dateTimeNow.day, 0, 0, 0, 0, 0)))
      ? title = const Text(
          'Задачи на сегодня',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w400,
            fontFamily: "Jost",
            color: Color(0xFF000000),
          ),
        )
      : (DateTime(dateTime.year, dateTime.month, dateTime.day, 0, 0, 0, 0, 0)
              .isAtSameMomentAs(DateTime(dateTimeNow.year, dateTimeNow.month,
                  dateTimeNow.day + 1, 0, 0, 0, 0, 0)))
          ? title = const Text(
              'Задачи на завтра',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w400,
                fontFamily: "Jost",
                color: Color(0xFF000000),
              ),
            )
          : (DateTime(dateTime.year, dateTime.month, dateTime.day, 0, 0, 0, 0,
                      0)
                  .isAtSameMomentAs(DateTime(dateTimeNow.year,
                      dateTimeNow.month, dateTimeNow.day + 2, 0, 0, 0, 0, 0)))
              ? title = const Text(
                  'Задачи на послезавтра',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Jost",
                    color: Color(0xFF000000),
                  ),
                )
              : title = Text(
                  'Задачи на ${dateTime.day}.${dateTime.month}.${dateTime.year}',
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Jost",
                    color: Color(0xFF000000),
                  ),
                );
  return title;
}
