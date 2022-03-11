import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Color primary = const Color(0xFF10E689);
Color secondary = const Color(0xFF10E689).withOpacity(0.5);
const MaterialColor primaryColor =
      const MaterialColor(0xFF10E689, const <int, Color>{
        50 : Color(0xFF0ed200), // 10%
        100 : Color(0xFF0dba00),  //20%
        200 : Color(0xFF0ba300), //30%
        300 : Color(0xFF0a8c00), //40%
        400 : Color(0xFF087500), //50%
        500 : Color(0xFF065d00), //60%
        600 : Color(0xFF054600), //70%
        700 : Color(0xFF032f00), //80%
        800 : Color(0xFF021700), //90%
        900 : Color(0xFF000000), //100%
      });