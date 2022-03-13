import 'package:bugarin_app/Menu/GetStarted/focus_area.dart';
import 'package:bugarin_app/Menu/GetStarted/height_weight.dart';
import 'package:bugarin_app/Menu/GetStarted/list.dart';
import 'package:bugarin_app/Menu/homepage.dart';
import 'package:bugarin_app/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Fasting extends StatefulWidget {
  const Fasting({Key? key}) : super(key: key);

  @override
  _FastingState createState() => _FastingState();
}

class _FastingState extends State<Fasting> {
  List<bool> isClicked = [];
  @override
  void initState() {
    for (var i = 0; i < FastingTxt.length; i++) {
      isClicked.add(false);
    }
    super.initState();
  }

  bool canNext = false;
  check() {
    bool temp = false;
    for (var i = 0; i < isClicked.length; i++) {
      if (isClicked[i] == true) {
        temp = true;
        break;
      }
    }
    setState(() {
      canNext = temp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'bugarin_app',
        theme: ThemeData(
            fontFamily: 'WorkSans',
            primaryColor: primary,
            primarySwatch: primaryColor),
        home: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              leading: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  )),
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            body: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 100,
                      child: Text(
                        'Have you ever practiced fasting?',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Divider(
                      height: 3,
                      thickness: 3,
                    ),
                    SizedBox(
                      height: 70,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                        child: Row(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Expanded(
                              child: ListView.separated(
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return (GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          bool otherClicked = false;
                                          int indexTarget = 0;
                                          for (var i = 0;
                                              i < isClicked.length;
                                              i++) {
                                            if (i != index) {
                                              if (isClicked[i] == true) {
                                                otherClicked = true;
                                                indexTarget = i;
                                                break;
                                              }
                                            }
                                          }
                                          if (otherClicked) {
                                            isClicked[index] = true;
                                            isClicked[indexTarget] = false;
                                          } else {
                                            isClicked[index] =
                                                !isClicked[index];
                                          }
                                        });
                                        check();
                                      },
                                      child: Container(
                                        height: 60,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 28),
                                              child: Text(
                                                FastingTxt.elementAt(index),
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black),
                                              ),
                                            ),
                                          ],
                                        ),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: isClicked[index]
                                                    ? primary
                                                    : Colors.grey,
                                                width: 3),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(30))),
                                      ),
                                    ));
                                  },
                                  separatorBuilder:
                                      (BuildContext context, int index) {
                                    return SizedBox(
                                      height: 10,
                                    );
                                  },
                                  itemCount: FastingTxt.length),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(child: Container()),
                    ElevatedButton(
                      onPressed: canNext
                          ? () => Navigator.pushAndRemoveUntil(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => Homepage()),
                              (route) => false)
                          : null,
                      child: Container(
                        width: MediaQuery.of(context).size.width - 50,
                        height: 50,
                        child: Center(
                            child: Text(
                          'NEXT',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        )),
                      ),
                      style: ElevatedButton.styleFrom(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ],
                )
              ],
            )));
  }
}
