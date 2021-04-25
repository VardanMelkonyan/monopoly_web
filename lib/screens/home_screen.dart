import 'package:flutter/material.dart';
import 'package:monopoly_web/screens/number_of_players_screen.dart';
import 'package:monopoly_web/screens/rules_screen.dart';

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
                  child: RedRoundButton("Play", () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NumberOfPlayersScreen()),
                    );
                  }),
                ),
                SizedBox(height: 20),
                RedRoundButton("Rules", () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => RulesSceeen()));
                }),
              ],
            ),
          ),
        ));
  }
}

class RedRoundButton extends StatelessWidget {
  final String text;
  final Function onPress;

  const RedRoundButton(this.text, this.onPress);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
                side: BorderSide(color: Colors.red))),
        backgroundColor: MaterialStateProperty.all<Color>(
          Color.fromARGB(255, 235, 61, 0),
        ),
      ),
      onPressed: onPress,
      child: Container(
        width: 200,
        height: 60,
        child: Center(
          child: Text(
            text,
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
