import 'package:bugarin_app/Menu/GetStarted/fasting.dart';
import 'package:bugarin_app/Menu/GetStarted/focus_area.dart';
import 'package:bugarin_app/Menu/GetStarted/height_weight.dart';
import 'package:bugarin_app/Menu/GetStarted/list.dart';
import 'package:bugarin_app/Menu/GetStarted/old.dart';
import 'package:bugarin_app/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:bugarin_app/colors.dart';

class Activity_Level extends StatefulWidget {
  const Activity_Level({Key? key}) : super(key: key);

  @override
  _Activity_LevelState createState() => _Activity_LevelState();
}

class _Activity_LevelState extends State<Activity_Level> {
  List<bool> isClicked = [];
  @override
  void initState() {
    for (var i = 0; i < activityLvl.length; i++) {
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
        theme: ThemeData(fontFamily: 'WorkSans', primaryColor: Colors.grey),
        home: Scaffold(
          backgroundColor: Colors.white,
            appBar: AppBar(
              leading: IconButton(
                  onPressed: ()=>Navigator.pop(context),
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
                        'What’s your activity level?',
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
                                                activityLvl.elementAt(index),
                                                style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
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
                                  itemCount: activityLvl.length),
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
                          ? () => Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => Height_Weight()))
                          : null,
                      child: Container(
                        width: MediaQuery.of(context).size.width - 50,
                        height: 50,
                        child: Center(child: Text('NEXT', style: TextStyle(fontWeight: FontWeight.bold),)),
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
