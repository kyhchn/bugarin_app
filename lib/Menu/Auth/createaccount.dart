import 'package:bugarin_app/Menu/Auth/sayhi_register.dart';
import 'package:bugarin_app/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:bugarin_app/models/cahce.dart';
import 'package:bugarin_app/colors.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final _firstnameController = TextEditingController();
  final _lastnameController = TextEditingController();
  DateTime? _dateTime;
  bool isValid = false;
  bool isObscure = false;
  String date = 'Date of Birth';

  checkIsValid() {
    if (_firstnameController.text.isNotEmpty &&
        _lastnameController.text.isNotEmpty &&
        _dateTime != null) {
      setState(() {
        isValid = true;
      });
    } else {
      setState(() {
        isValid = false;
      });
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _firstnameController.dispose();
    _lastnameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'BUGARIN',
                style: TextStyle(color: Colors.black),
              ),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    'need help?',
                    style: TextStyle(color: Colors.black, fontSize: 14),
                  ))
            ],
          ),
          backgroundColor: Colors.transparent,
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Create Account ',
                style: TextStyle(
                    fontFamily: 'WorkSans',
                    fontWeight: FontWeight.w800,
                    fontSize: 25,
                    color: Colors.black),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Fill the detail to create account',
                style: TextStyle(color: Colors.black),
              ),
              SizedBox(
                height: 30,
              ),
              TextField(
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: primary)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: primary)),
                  hintText: 'First Name',
                ),
                controller: _firstnameController,
                keyboardType: TextInputType.text,
                maxLines: 1,
                onChanged: (value) => checkIsValid(),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: primary)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: primary)),
                    hintText: 'Last Name',
                  ),
                  maxLines: 1,
                  controller: _lastnameController,
                  keyboardType: TextInputType.text,
                  onChanged: (value) => checkIsValid()),
              SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: primary),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text(date),
                    ),
                    IconButton(
                        onPressed: () async {
                          _dateTime = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime.now());
                          setState(() {
                            if (_dateTime != null) {
                              date = DateFormat('dd-MM-yy')
                                  .format(_dateTime as DateTime);
                            }
                          });
                          checkIsValid();
                        },
                        icon: Icon(
                          Icons.keyboard_arrow_down,
                          color: primary,
                        ))
                  ],
                ),
              ),
              Expanded(child: Container()),
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: isValid
                        ? () {
                            cache.write('firstname',_firstnameController.text);
                            cache.write('lastname', _lastnameController.text);
                            cache.write('premium', false);
                            Navigator.of(context).push(CupertinoPageRoute(
                                builder: (context) => SayHi_Register()));
                          }
                        : null,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      child: Center(
                          child: Text(
                        'Create Account',
                        style: TextStyle(color: Colors.white),
                      )),
                    ),
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        primary: primary,
                        elevation: 7),
                  ))
            ],
          ),
        ));
  }
}
