import 'package:bugarin_app/Menu/MainMenu/Diet.dart';
import 'package:bugarin_app/Menu/MainMenu/Insight.dart';
import 'package:bugarin_app/Menu/MainMenu/Scan.dart';
import 'package:bugarin_app/Menu/MainMenu/Widgets/belomjadi.dart';
import 'package:bugarin_app/Menu/MainMenu/Widgets/drawer.dart';
import 'package:bugarin_app/Menu/MainMenu/myhealth.dart';
import 'package:bugarin_app/Menu/MainMenu/premium.dart';
import 'package:bugarin_app/Menu/MainMenu/workout.dart';
import 'package:bugarin_app/colors.dart';
import 'package:bugarin_app/models/cahce.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _selectedIndex = 0;
  final firstname = cache.read('firstname');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer_Widgets(),
        backgroundColor: Colors.white,
        appBar: _selectedIndex == 0
            ? AppBar(
              iconTheme: IconThemeData(color: Colors.black),
                backgroundColor: Colors.transparent,
                elevation: 0,
                actions: [
                  IconButton(
                      onPressed: () => Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (builder) => Yahahahahahaha())),
                      icon: Image.asset(
                        'assets/buttons/message.png',
                        width: 25,
                        height: 25,
                      ))
                ],
                title: Text(
                  'Hello, $firstname',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              )
            : _selectedIndex == 3
                ? AppBar(
                    automaticallyImplyLeading: false,
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    title: Center(
                        child: Text(
                      'Insight',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                  )
                : null,
        bottomNavigationBar: BottomNavigationBar(
          selectedIconTheme: IconThemeData(color: primary),
          unselectedIconTheme: IconThemeData(color: Colors.grey),
          selectedItemColor: Colors.red,
          iconSize: 20,
          elevation: 1.5,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Image.asset('assets/buttons/barbel.png'),
                activeIcon: Image.asset('assets/buttons/barbel_1.png'),
                label: 'Workout'),
            BottomNavigationBarItem(
                icon: Image.asset('assets/buttons/spoon.png'),
                activeIcon: Image.asset('assets/buttons/spoon_1.png'),
                label: 'Diet'),
            BottomNavigationBarItem(
                icon: Image.asset('assets/buttons/scan.png'),
                activeIcon: Image.asset('assets/buttons/scan_1.png'),
                label: 'Scan'),
            BottomNavigationBarItem(
                icon: Image.asset('assets/buttons/insight.png'),
                activeIcon: Image.asset('assets/buttons/insight_1.png'),
                label: 'Insight'),
            BottomNavigationBarItem(
                icon: Image.asset('assets/buttons/health.png'),
                activeIcon: Image.asset('assets/buttons/health_1.png'),
                label: 'My Health'),
          ],
          currentIndex: _selectedIndex,
        ),
        body: _selectedIndex == 0
            ? WorkOut()
            : _selectedIndex == 1
                ? Diet()
                : _selectedIndex == 2
                    ? Scan()
                    : _selectedIndex == 3
                        ? Insight()
                        : null);
  }
}
