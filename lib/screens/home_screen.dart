import 'dart:html';

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey[900],
        body: Container(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('../assets/Screens/monopoly_entrance.png'),
              SizedBox(height: 60),
              Text(
                "Welcome to Monopoly!",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              Row(
                children: [
                  SizedBox(width: 60),
                  Image.asset("../assets/Screens/left_man.png"),
                  Expanded(
                    child: Center(
                      child: Text(
                        "Monopoly, real-estate board game, in which the player’s goal is to remain\n" +
                            "financially solvent while forcing opponents into bankruptcy by  buying\n" +
                            "and developing pieces of property. Let's see whether you can do that.\n" +
                            "If you are ready to become rich click Start else click Exit!!!\n",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Image.asset("../assets/Screens/right_man.png"),
                  SizedBox(width: 60),
                ],
              ),
              SizedBox(),
            ],
          ),
        ));
  }
}
