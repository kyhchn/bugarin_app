import 'package:bugarin_app/Menu/Auth/createaccount.dart';
import 'package:bugarin_app/Menu/Auth/sayhi_register.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:bugarin_app/colors.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool isValid = false;
  bool isObscure = false;
  checkIsValid() {
    if (_emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty) {
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
    _emailController.dispose();
    _passwordController.dispose();
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                  child: Text(
                'Enter your Email and Password to Register as a New Member ',
                style: TextStyle(
                    fontFamily: 'WorkSans',
                    fontWeight: FontWeight.w800,
                    fontSize: 25,
                    color: Colors.black),
              )),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'English',
                    style: TextStyle(color: Colors.black),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'Change',
                        style: TextStyle(color: Colors.black),
                      )),
                ],
              ),
              TextField(
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: primary)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: primary)),
                  hintText: 'Email',
                ),
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
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
                    hintText: 'Password',
                    suffixIcon: IconButton(
                      color: primary,
                        onPressed: () {
                          setState(() {
                            isObscure = !isObscure;
                          });
                        },
                        icon: Icon(isObscure ? Icons.lock : Icons.lock_open)),
                  ),
                  obscureText: isObscure,
                  maxLines: 1,
                  controller: _passwordController,
                  keyboardType: TextInputType.text,
                  onChanged: (value) => checkIsValid()),
              Expanded(child: Container()),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 150,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'By clicking continue, you agree to Bugarin’s User Agreement, Privacy Policy, and Cookie Policy.',
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: isValid
                          ? () => Navigator.of(context).push(CupertinoPageRoute(
                              builder: (context) => CreateAccount()))
                          : null,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        child: Center(
                            child: Text(
                          'Continue',
                          style: TextStyle(color: Colors.white),
                        )),
                      ),
                      style: ElevatedButton.styleFrom(

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          primary: primary,
                          elevation: 7),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
