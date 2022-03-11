import 'package:bugarin_app/Menu/MainMenu/Widgets/belomjadi.dart';
import 'package:bugarin_app/Menu/MainMenu/Widgets/browsee.dart';
import 'package:bugarin_app/Menu/MainMenu/Widgets/collection.dart';
import 'package:bugarin_app/Menu/MainMenu/Widgets/foryou.dart';
import 'package:bugarin_app/Menu/MainMenu/Widgets/personaltrainer.dart';
import 'package:bugarin_app/Menu/MainMenu/list.dart';
import 'package:bugarin_app/Menu/homepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WorkOut extends StatefulWidget {
  const WorkOut({Key? key}) : super(key: key);

  @override
  State<WorkOut> createState() => _WorkOutState();
}

class _WorkOutState extends State<WorkOut> {
  int _isClicked = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            height: 50,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _isClicked = index;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                          color: _isClicked == index ? Colors.black : Colors.transparent,
                          width: 3,
                        ))),
                        child: Center(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 13),
                              child: Text(
                          appBarWorkout.elementAt(index),
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight:
                                  _isClicked == index ? FontWeight.bold : null,
                          ),
                        ),
                            )),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      width: 0,
                    );
                  },
                  itemCount: appBarWorkout.length),
            ),
          ),
          Expanded(
              child: _isClicked == 0
                  ? ForYou()
                  : _isClicked == 1
                      ? Browse()
                      : _isClicked == 2
                          ? Collection()
                          : PersonalTrainer())
        ],
      ),
    );
  }
}
