import 'package:bugarin_app/Menu/GetStarted/goal.dart';
import 'package:bugarin_app/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SayHi_Register extends StatelessWidget {
  const SayHi_Register({Key? key, this.firstName}) : super(key: key);
  final String ?firstName;
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
              'Welcome to Bugarin, $firstName!',
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'To make sure your experience with Bugarin is the best it can be, we need to get to know you a litte better.',
              textAlign: TextAlign.justify,
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
            SizedBox(
              height: 70,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: () => Navigator.push(context, CupertinoPageRoute(builder: (context) => Goal())),
                child: SizedBox(
                  child: Center(child: Text('Get Started')),
                  height: 50,
                ),
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    primary: primary,
                    elevation: 5),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
                width: MediaQuery.of(context).size.width,
                child: TextButton(
                  onPressed: () {},
                  child: Center(
                    child: Text(
                      'Skip',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
