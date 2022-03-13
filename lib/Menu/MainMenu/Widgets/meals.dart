import 'package:bugarin_app/Menu/MainMenu/list.dart';
import 'package:bugarin_app/colors.dart';
import 'package:bugarin_app/models/cahce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:convert';

class Meals extends StatefulWidget {
  const Meals({Key? key}) : super(key: key);

  @override
  State<Meals> createState() => _MealsState();
}

class _MealsState extends State<Meals> {
  late int dailycalories;
  late String log;
  late int todayCalories;
  final _searchInputController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _searchInputController.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    String gender = cache.read('gender');
    int bbi = cache.read('bbi');
    if (gender == 'male') {
      dailycalories = 30 * bbi;
    } else {
      dailycalories = 25 * bbi;
    }
    if (cache.read('todaycalories') == null) {
      todayCalories = 0;
    } else {
      todayCalories = cache.read('todaycalories');
    }
    if (cache.read('log') == null) {
      log = '';
    } else {
      log = cache.read('log');
    }
  }

  void add(String log, int cal) {
    setState(() {
      this.log += '\n$log';
      todayCalories += cal;
    });
    cache.write('log', this.log);
    cache.write('todaycalories', this.todayCalories);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Container(
              height: 150,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Find out The Best meals for diet',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  Container(
                    height: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.75,
                          child: TextField(
                            controller: _searchInputController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.search,
                                color: Colors.grey,
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide:
                                      BorderSide(color: primary, width: 3)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide:
                                      BorderSide(color: primary, width: 3)),
                              hintText: 'Search',
                              fillColor: Colors.grey.shade400,
                            ),
                          ),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Image.asset(
                              'assets/diet/frame.png',
                            ))
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 120,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Your Log meals',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Icon(Icons.keyboard_arrow_right_outlined)
                      ],
                    ),
                    Expanded(
                      child: ListView(
                        children: [
                          Text(
                            cache.read('log') == null ? '' : cache.read('log'),
                            style: TextStyle(),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              decoration: BoxDecoration(
                border: Border.all(color: primary, width: 2),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.transparent),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 150,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.40,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Daily Calories Intake',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          dailycalories.toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: primary, width: 2),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.transparent),
                  ),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Today\'s Calories Intake',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          cache.read('todaycalories') == null
                              ? todayCalories.toString()
                              : cache.read('todaycalories').toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                    width: MediaQuery.of(context).size.width * 0.40,
                    decoration: BoxDecoration(
                      border: Border.all(color: primary, width: 2),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.transparent),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'High Calories Food',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        width: 160,
                        height: 160,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(caloriesFood
                                    .elementAt(0)
                                    .elementAt(2)
                                    .toString()))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            IconButton(
                              onPressed: () {
                                add(
                                    caloriesFood.elementAt(0).elementAt(0),
                                    int.parse(caloriesFood
                                        .elementAt(0)
                                        .elementAt(1)));
                              },
                              icon:
                                  Image.asset('assets/caloriesFood/button.png'),
                            )
                          ],
                        )),
                    Container(
                        width: 160,
                        height: 160,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(caloriesFood
                                    .elementAt(1)
                                    .elementAt(2)
                                    .toString()))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            IconButton(
                              onPressed: () {
                                add(
                                    caloriesFood.elementAt(1).elementAt(0),
                                    int.parse(caloriesFood
                                        .elementAt(1)
                                        .elementAt(1)));
                              },
                              icon:
                                  Image.asset('assets/caloriesFood/button.png'),
                            )
                          ],
                        )),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        width: 160,
                        height: 160,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(caloriesFood
                                    .elementAt(2)
                                    .elementAt(2)
                                    .toString()))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            IconButton(
                              onPressed: () {
                                add(
                                    caloriesFood.elementAt(2).elementAt(0),
                                    int.parse(caloriesFood
                                        .elementAt(2)
                                        .elementAt(1)));
                              },
                              icon:
                                  Image.asset('assets/caloriesFood/button.png'),
                            )
                          ],
                        )),
                    Container(
                        width: 160,
                        height: 160,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(caloriesFood
                                    .elementAt(3)
                                    .elementAt(2)
                                    .toString()))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            IconButton(
                              onPressed: () {
                                add(
                                    caloriesFood.elementAt(3).elementAt(0),
                                    int.parse(caloriesFood
                                        .elementAt(3)
                                        .elementAt(1)));
                              },
                              icon:
                                  Image.asset('assets/caloriesFood/button.png'),
                            )
                          ],
                        )),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
