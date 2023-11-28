import 'package:flutter/material.dart';

class ToDoListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFD6D7EF),
      child: Stack(alignment: Alignment.bottomRight, children: [
        ListView.builder(
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
                      SizedBox(
                        width: 5,
                      ),
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/main/edit_task');
                              },
                              icon: Icon(
                                Icons.mode_edit_outline_outlined,
                                size: 25,
                                color: Color(0xFFB3B7EE),
                              )),
                          IconButton(
                              color: Color(0xFFB3B7EE),
                              onPressed: null,
                              icon: Icon(
                                Icons.check_circle_outline_outlined,
                                size: 25,
                                color: Color(0xFFB3B7EE),
                              ))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
        IconButton(
            iconSize: 70,
            onPressed: () {
              Navigator.pushNamed(context, '/main/add_task');
            },
            icon: Icon(
              Icons.add_circle_outlined,
              color: Color(0xFF9395D3),
            )),
      ]),
    );
  }
}
