import 'package:bugarin_app/Menu/Auth/loginchoice.dart';
import 'package:bugarin_app/models/cahce.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class Drawer_Widgets extends StatefulWidget {
  const Drawer_Widgets({Key? key}) : super(key: key);

  @override
  State<Drawer_Widgets> createState() => _Drawer_WidgetsState();
}

class _Drawer_WidgetsState extends State<Drawer_Widgets> {
  final String firstname = cache.read('firstname');
  final String lastname = cache.read('lastname');

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 200,
                  child: Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  'Hello $firstname',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              )),
              TextButton(
                  onPressed: () {
                    GetStorage().erase();
                    Navigator.pushAndRemoveUntil(
                        context,
                        CupertinoPageRoute(builder: (builder) => LoginChoice()),
                        (route) => false);
                  },
                  child: Text(
                    'Log Out',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ))
            ],
          )),
    );
  }
}
