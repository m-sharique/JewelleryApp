import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'JwelleryBox AI',
        debugShowCheckedModeBanner: false,
        theme: lightmode,
        darkTheme: darkmode,
        home: const HomePage(),
    );
  }
}
