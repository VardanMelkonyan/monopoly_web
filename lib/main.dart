import 'package:flutter/material.dart';
import 'package:monopoly_web/screens/home_screen.dart';

void main() {
  runApp(Monopoly());
}

class Monopoly extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Monopoly',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
