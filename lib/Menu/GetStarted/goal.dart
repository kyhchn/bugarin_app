import 'package:bugarin_app/Menu/GetStarted/focus_area.dart';
import 'package:bugarin_app/Menu/GetStarted/list.dart';
import 'package:bugarin_app/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Goal extends StatefulWidget {
  const Goal({Key? key}) : super(key: key);

  @override
  _GoalState createState() => _GoalState();
}

class _GoalState extends State<Goal> {
  List<bool> isClicked = [];
  bool canNext = false;
  @override
  void initState() {
    super.initState();
    for (var i = 0; i < goal.length; i++) {
      isClicked.add(false);
    }
  }
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
            textSelectionColor: Colors.black),
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
                        'What’s your goal?',
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
                        padding: const EdgeInsets.all(8.0),
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
                                        height: 80,
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
                                                goal.elementAt(index),
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold),
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
                                                Radius.circular(40))),
                                      ),
                                    ));
                                  },
                                  separatorBuilder:
                                      (BuildContext context, int index) {
                                    return SizedBox(
                                      height: 10,
                                    );
                                  },
                                  itemCount: goal.length),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 80,)
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(child: Container()),
                    ElevatedButton(
                      onPressed: canNext
                          ? () => Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => FocusArea()))
                          : null,
                      child: Container(
                        width: MediaQuery.of(context).size.width - 50,
                        height: 50,
                        child: Center(child: Text('NEXT')),
                      ),
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          primary: primary),
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
