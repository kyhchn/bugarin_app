import 'package:bugarin_app/Menu/GetStarted/activity_level.dart';
import 'package:bugarin_app/Menu/GetStarted/list.dart';
import 'package:bugarin_app/Menu/GetStarted/old.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:bugarin_app/colors.dart';

class Height_Weight extends StatefulWidget {
  const Height_Weight({Key? key}) : super(key: key);

  @override
  _Height_WeightState createState() => _Height_WeightState();
}

class _Height_WeightState extends State<Height_Weight> {
  @override
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();
  bool canNext = false;
  check() {
    if (_heightController.text.isNotEmpty &&
        _weightController.text.isNotEmpty) {
      setState(() {
        canNext = true;
      });
    } else {
      canNext = false;
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _heightController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'bugarin_app',
        theme: ThemeData(
            fontFamily: 'WorkSans',
            primaryColor: primary,
            primarySwatch: primaryColor),
        home: Scaffold(
            backgroundColor: Colors.white,
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              leading: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  )),
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            body: Stack(
              children: [
                Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 100,
                      child: Text(
                        'Let us know better',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Divider(
                      height: 15,
                      thickness: 3,
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextField(
                            style: TextStyle(fontSize: 40),
                            controller: _weightController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                hintText: 'Weight (Kg)',
                                hintStyle: TextStyle(fontSize: 40)),
                            maxLines: 1,
                            onChanged: (value) => check(),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          TextField(
                            style: TextStyle(fontSize: 40),
                            controller: _heightController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                hintText: 'Height (Cm)',
                                hintStyle: TextStyle(fontSize: 40)),
                            maxLines: 1,
                            onChanged: (value) => check(),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 90,
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(child: Container()),
                    ElevatedButton(
                      onPressed: canNext
                          ? () => Navigator.push(context,
                              CupertinoPageRoute(builder: (builder) => Old()))
                          : null,
                      child: Container(
                        width: MediaQuery.of(context).size.width - 50,
                        height: 50,
                        child: Center(
                            child: Text(
                          'NEXT',
                          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                        )),
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ],
                )
              ],
            )));
  }
}
