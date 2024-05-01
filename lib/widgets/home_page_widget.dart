import 'package:flutter/material.dart';

class HomePageWidget extends StatelessWidget {
  const HomePageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Home',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
