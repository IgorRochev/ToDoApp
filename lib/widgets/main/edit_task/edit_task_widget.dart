import 'package:flutter/material.dart';

class EditTaskWidget extends StatelessWidget {
  const EditTaskWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 74,
        title: Text("Edit Task"),
        titleTextStyle: TextStyle(
          fontSize: 24,
          fontFamily: "Jost",
          fontWeight: FontWeight.w600,
        ),
        backgroundColor: Color(0xFF9395D3),
      ),
      backgroundColor: Color(0xFFFFFFFF),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: EdgeInsets.only(left: 30, right: 30),
              child: SizedBox(
                // height: 29,
                child: TextField(
                  cursorColor: Color(0xFF8B8787),
                  decoration: InputDecoration(
                    labelStyle: TextStyle(color: Color(0xFF8B8787)),
                    enabledBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xFF8B8787), width: 1)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xFF8B8787), width: 1)),
                    label: Text("Title"),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: EdgeInsets.only(left: 30, right: 30),
              child: SizedBox(
                // height: 29,
                child: TextField(
                  cursorColor: Color(0xFF8B8787),
                  decoration: InputDecoration(
                    labelStyle: TextStyle(color: Color(0xFF8B8787)),
                    enabledBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xFF8B8787), width: 1)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xFF8B8787), width: 1)),
                    label: Text("Detail"),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 54,
            ),
            Padding(
              padding: EdgeInsets.only(left: 14, right: 14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      height: 65,
                      child: TextButton(
                          onPressed: () => {},
                          child: Text(
                            "Update",
                            style: TextStyle(color: Color(0xFFFFFFFF)),
                          ),
                          style: ButtonStyle(
                              textStyle: MaterialStatePropertyAll(TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                fontFamily: "Jost",
                              )),
                              backgroundColor:
                                  MaterialStatePropertyAll(Color(0xFF9395D3)),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              )))),
                    ),
                  ),
                  SizedBox(
                    width: 46,
                  ),
                  Expanded(
                    child: Container(
                      height: 65,
                      child: TextButton(
                          onPressed: () => {},
                          child: Text(
                            "Cancel",
                            style: TextStyle(color: Color(0xFFFFFFFF)),
                          ),
                          style: ButtonStyle(
                              textStyle: MaterialStatePropertyAll(TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                fontFamily: "Jost",
                              )),
                              backgroundColor:
                                  MaterialStatePropertyAll(Color(0xFF9395D3)),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              )))),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
