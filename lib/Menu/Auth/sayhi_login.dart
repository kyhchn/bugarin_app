import 'package:bugarin_app/Menu/GetStarted/goal.dart';
import 'package:bugarin_app/Menu/homepage.dart';
import 'package:bugarin_app/colors.dart';
import 'package:bugarin_app/models/cahce.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SayHi_Login extends StatefulWidget {
  const SayHi_Login({Key? key}) : super(key: key);
  @override
  State<SayHi_Login> createState() => _SayHi_LoginState();
}

class _SayHi_LoginState extends State<SayHi_Login> {
  final firstname = cache.read('firstname');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'BUGARIN',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
            )),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(20, 60, 20, 60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundColor: Colors.grey,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Welcome back $firstname, you\'re in',
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 70,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: () => Navigator.push(context,
                    CupertinoPageRoute(builder: (context) => Homepage())),
                child: SizedBox(
                  child: Center(child: Text('Get Started')),
                  height: 50,
                ),
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    primary: primary,
                    elevation: 7),
              ),
            ),
            SizedBox(
              height: 60,
            ),
          ],
        ),
      ),
    );
  }
}
