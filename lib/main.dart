import 'package:bugarin_app/Menu/Auth/loginchoice.dart';
import 'package:bugarin_app/colors.dart';
import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'bugarin_app',
      theme: ThemeData(
        fontFamily: 'WorkSans',
        primaryColor: primary,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          elevation: 1.5,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          unselectedItemColor: primary,
          selectedIconTheme: IconThemeData(color: primary),
        ),
        appBarTheme: AppBarTheme(iconTheme: IconThemeData(color: primary)),
        primarySwatch: primaryColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        body: LoginChoice(),
      ),
    );
  }
}
