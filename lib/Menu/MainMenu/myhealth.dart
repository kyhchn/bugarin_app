import 'package:bugarin_app/Menu/MainMenu/premium.dart';
import 'package:flutter/cupertino.dart';

class MyHealth extends StatefulWidget {
  const MyHealth({Key? key}) : super(key: key);

  @override
  State<MyHealth> createState() => _MyHealthState();
}

class _MyHealthState extends State<MyHealth> {
  @override
  Widget build(BuildContext context) {
    return Premium();
  }
}
