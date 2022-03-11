import 'package:bugarin_app/Menu/GetStarted/gender.dart';
import 'package:bugarin_app/Menu/GetStarted/list.dart';
import 'package:bugarin_app/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:bugarin_app/colors.dart';

class FocusArea extends StatefulWidget {
  const FocusArea({Key? key}) : super(key: key);

  @override
  _FocusAreaState createState() => _FocusAreaState();
}

class _FocusAreaState extends State<FocusArea> {
  @override
  @override
  List<bool> isClicked = [];
  void initState() {
    for (var i = 0; i < focusArea.length; i++) {
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

  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'bugarin_app',
        theme: ThemeData(fontFamily: 'WorkSans', primaryColor: primary),
        home: Scaffold(
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
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 100,
                      child: Text(
                        'Please choose your focus area?',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Divider(
                      height: 15,
                      thickness: 3,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                              flex: 1,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 40,
                                    ),
                                    Expanded(
                                      child: ListView.separated(
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return (GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  bool otherClicked = false;
                                                  int indexTarget = 0;
                                                  for (var i = 0;
                                                      i < isClicked.length;
                                                      i++) {
                                                    if (i != index) {
                                                      if (isClicked[i] ==
                                                          true) {
                                                        otherClicked = true;
                                                        indexTarget = i;
                                                        break;
                                                      }
                                                    }
                                                  }
                                                  if (otherClicked) {
                                                    isClicked[index] = true;
                                                    isClicked[indexTarget] =
                                                        false;
                                                  } else {
                                                    isClicked[index] =
                                                        !isClicked[index];
                                                  }
                                                });
                                                check();
                                              },
                                              child: Container(
                                                height: 50,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      focusArea
                                                          .elementAt(index),
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                ),
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: isClicked[index]
                                                            ? primary
                                                            : Colors.grey,
                                                        width: 3),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                40))),
                                              ),
                                            ));
                                          },
                                          separatorBuilder:
                                              (BuildContext context,
                                                  int index) {
                                            return SizedBox(
                                              height: 10,
                                            );
                                          },
                                          itemCount: focusArea.length),
                                    ),
                                  ],
                                ),
                              )),
                          Flexible(
                              flex: 1,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.5,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/entirebody.png'))),
                                ),
                              )),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
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
                          ? () => Navigator.push(context,
                              CupertinoPageRoute(builder: (value) => Gender()))
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
