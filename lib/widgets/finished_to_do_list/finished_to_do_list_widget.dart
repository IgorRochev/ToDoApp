import 'package:flutter/material.dart';

class FinishedToDoListWidget extends StatelessWidget {
  const FinishedToDoListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFD6D7EF),
      child: ListView.builder(
        padding: EdgeInsets.only(top: 21),
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(right: 10, left: 4, bottom: 21),
            child: Container(
              height: 82,
              decoration: BoxDecoration(
                color: Color(0xFFFFFFFF),
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    blurRadius: 4,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 18, right: 25, top: 15, bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // ToDoTitleWidget(),
                          // ToDoSubtitleWidget(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
