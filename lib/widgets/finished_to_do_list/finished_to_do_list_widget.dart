import 'package:flutter/material.dart';

class FinishedToDoListWidget extends StatelessWidget {
  const FinishedToDoListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 74,
        title: Text("Completed Task"),
        titleTextStyle: TextStyle(
          fontSize: 24,
          fontFamily: "Jost",
          fontWeight: FontWeight.w600,
        ),
        backgroundColor: Color(0xFF9395D3),
      ),
      backgroundColor: Color(0xFFD6D7EF),
      body: ListView.builder(
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
                child: Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "TODO TITLE",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF9395D3),
                          fontFamily: "Jost",
                        ),
                      ),
                      Text(
                        "TODO SUBTITLE",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          fontFamily: "Jost",
                          color: Color(0xFF000000),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
