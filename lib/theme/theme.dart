import 'package:flutter/material.dart';

ThemeData lightmode = ThemeData(
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
      background: Colors.white,
      primary: Colors.yellow,
    ));

ThemeData darkmode = ThemeData(
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      background: Colors.black87,
      primary: Colors.yellow,
      shadow: Color.fromRGBO(100, 100, 100, 0.7),
    ));
