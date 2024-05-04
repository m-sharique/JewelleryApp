import 'package:flutter/material.dart';

ThemeData lightmode = ThemeData(
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
      background: Color.fromRGBO(250, 250, 250, 1),
      surface: Colors.white,
      primary: Colors.yellow,
    ));

ThemeData darkmode = ThemeData(
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      background: Colors.black87,
      primary: Colors.yellow,
      surface: Colors.black,
      shadow: Color.fromRGBO(100, 100, 100, 0.7),
    ));
