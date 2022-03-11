import 'package:bugarin_app/Menu/GetStarted/activity_level.dart';
import 'package:bugarin_app/Menu/GetStarted/list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:bugarin_app/colors.dart';

class Gender extends StatefulWidget {
  const Gender({Key? key}) : super(key: key);

  @override
  _GenderState createState() => _GenderState();
}

class _GenderState extends State<Gender> {
  @override
  @override
  List<bool> isClicked = [];
  void initState() {
    for (var i = 0; i < gender.length; i++) {
      isClicked.add(false);
    }
    super.initState();
  }

  bool canNext = false;
  check() {
    bool temp = false;
    for (var i = 0; i < gender.length; i++) {
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
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 100,
                      child: Text(
                        'What’s your gender?',
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
                        child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        if (isClicked[1] == false) {
                                          isClicked[0] = !isClicked[0];
                                        } else {
                                          isClicked[1] = false;
                                          isClicked[0] = true;
                                        }
                                      });
                                      check();
                                    },
                                    child: Container(
                                      height: 180,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image:
                                                  AssetImage('assets/men.png')),
                                          border: Border.all(
                                              width: 6,
                                              color: isClicked[0]
                                                  ? primary
                                                  : Colors.grey),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20))),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    'MALE',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  )
                                ],
                              ),
                            ),
                            flex: 1,
                          ),
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (isClicked[0] == false) {
                                      isClicked[1] = !isClicked[1];
                                    } else {
                                      isClicked[0] = false;
                                      isClicked[1] = true;
                                    }
                                  });
                                  check();
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 180,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/female.png')),
                                          border: Border.all(
                                              width: 6,
                                              color: isClicked[1]
                                                  ? primary
                                                  : Colors.grey.shade400),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(25))),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      'FEMALE',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            flex: 1,
                          )
                        ],
                      ),
                    )),
                    SizedBox(
                      height: 90,
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
                                  builder: (builder) => Activity_Level()))
                          : null,
                      child: Container(
                        width: MediaQuery.of(context).size.width - 50,
                        height: 50,
                        child: Center(
                            child: Text(
                          'NEXT',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                      ),
                      style: ElevatedButton.styleFrom(
                          elevation: 5,
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
