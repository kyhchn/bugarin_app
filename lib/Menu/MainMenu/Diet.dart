
import 'package:bugarin_app/Menu/MainMenu/Widgets/fasting.dart';
import 'package:bugarin_app/Menu/MainMenu/Widgets/meals.dart';
import 'package:bugarin_app/Menu/MainMenu/Widgets/plan.dart';
import 'package:bugarin_app/Menu/MainMenu/Widgets/recipes.dart';
import 'package:bugarin_app/Menu/MainMenu/list.dart';
import 'package:bugarin_app/Menu/MainMenu/premium.dart';
import 'package:bugarin_app/models/cahce.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Diet extends StatefulWidget {
  const Diet({Key? key}) : super(key: key);

  @override
  State<Diet> createState() => _DietState();
}

class _DietState extends State<Diet> {
  int _isClicked = 0;
  @override
  void migrate() {
    bool premium = cache.read('premium');
    if (_isClicked == 3) {
      if (!premium) {
        Navigator.push(
            context, CupertinoPageRoute(builder: (builder) => Premium()));
      }
    }
  }

  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 40,),
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
                        migrate();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                          color: _isClicked == index
                              ? Colors.black
                              : Colors.transparent,
                          width: 3,
                        ))),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 13),
                          child: Row(
                            children: [
                              Text(
                                diet_menu.elementAt(index),
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: _isClicked == index
                                      ? FontWeight.bold
                                      : null,
                                ),
                              ),
                              index == 3
                                  ? Image.asset(
                                      'assets/king.png',
                                      width: 25,
                                    )
                                  : SizedBox()
                            ],
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
                  itemCount: diet_menu.length),
            ),
          ),
          Expanded(
              child: _isClicked == 0
                  ? Fasting()
                  : _isClicked == 1
                      ? Plan()
                      : _isClicked == 2
                          ? Meals()
                          : Recipes())
        ],
      ),
    );
  }
}
