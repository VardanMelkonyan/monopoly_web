import 'package:flutter/material.dart';
import 'package:monopoly_web/model/utility.dart';
import 'package:monopoly_web/screens/waiting_room_screen.dart';
import 'package:monopoly_web/screens/rules_screen.dart';
import 'package:monopoly_web/widgets/just_button.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey[900],
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('background.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 100),
                SizedBox(
                  height: 250,
                  child: Image.asset('assets/Screens/monopoly-enterance.png'),
                ),
                SizedBox(height: 100),
                Hero(
                  tag: "PlayerCount",
                  child: JustButton(
                      title: "Play",
                      color: merColor,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WaitingRoomScreen()),
                        );
                      }),
                ),
                SizedBox(height: 20),
                JustButton(
                    title: "Rules",
                    color: merColor,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RulesSceeen()));
                    }),
              ],
            ),
          ),
        ));
  }
}
