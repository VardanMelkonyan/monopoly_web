import 'package:flutter/material.dart';
import 'package:monopoly_web/model/utility.dart';
import 'package:monopoly_web/screens/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Monopoly());
}

class Monopoly extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Monopoly',
      theme: ThemeData(
        primaryColor: merColor,
        canvasColor: merColor,
        fontFamily: 'FredokaOne',
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
