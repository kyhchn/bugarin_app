import 'package:bugarin_app/Colors.dart';
import 'package:bugarin_app/Menu/Auth/login.dart';
import 'package:bugarin_app/Menu/Auth/signup.dart';
import 'package:bugarin_app/Menu/MainMenu/premium.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginChoice extends StatefulWidget {
  LoginChoice({Key? key}) : super(key: key);

  @override
  State<LoginChoice> createState() => _LoginChoiceState();
}

class _LoginChoiceState extends State<LoginChoice> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: AssetImage('assets/bg pak haji.jpg'), fit: BoxFit.fill)
            ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 625, 20, 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.push(
                  context, CupertinoPageRoute(builder: (_) => SignUp())),
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: 50,
                  child: Center(
                    child: Text(
                      'Join',
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                ),
              ),
              style: ElevatedButton.styleFrom(
                  elevation: 0,
                  primary: primary,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30))),
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(
                  context, CupertinoPageRoute(builder: (_) => LoginPage())),
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: 50,
                  child: Center(
                    child: Text(
                      'Sign in',
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                  ),
                ),
              ),
              style: ElevatedButton.styleFrom(
                  side: BorderSide(width: 3, color: primary),
                  elevation: 0,
                  primary: Colors.transparent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30))),
            ),
          ],
        ),
      ),
    );
  }
}
