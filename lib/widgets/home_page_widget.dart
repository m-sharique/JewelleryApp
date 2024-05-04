import 'package:flutter/material.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(40), bottom: Radius.circular(0)),
        ),
        child: const Center(
          child: Text(
            'Home',
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}
