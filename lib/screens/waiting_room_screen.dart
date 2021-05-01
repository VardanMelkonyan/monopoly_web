import 'package:flutter/material.dart';
import 'package:monopoly_web/model/player.dart';
import 'package:monopoly_web/model/utility.dart';
import 'package:monopoly_web/screens/board_screen.dart';
import 'package:monopoly_web/widgets/just_button.dart';
import 'package:monopoly_web/widgets/player_icon.dart';

class WaitingRoomScreen extends StatefulWidget {
  @override
  _WaitingRoomScreenState createState() => _WaitingRoomScreenState();
}

class _WaitingRoomScreenState extends State<WaitingRoomScreen> {
  List<Player> players = [
    Player(name: "Sargis", figure: Figure.car, money: 1000),
    Player(name: "Vardan", figure: Figure.hat, money: 1000),
    // Player(name: "Varduhi", figure: Figure.dog, money: 1000),
    // Player(name: "Hovag", figure: Figure.shoe, money: 1000)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Waiting room"),
      ),
      body: Hero(
        tag: "PlayerCount",
        child: Center(
          child: Container(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Spacer(flex: 1),
                  Text(
                    "Game Code",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                    ),
                  ),
                  SizedBox(height: 40),
                  Text(
                    "1234",
                    style: TextStyle(color: Colors.white, fontSize: 60),
                  ),
                  SizedBox(height: 100),
                  JustButton(
                    title: "Start",
                    color: Colors.green,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BoardScreen()));
                    },
                  ),
                  Spacer(flex: 1),
                ],
              ),
              SizedBox(width: 200),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  players.length >= 1
                      ? PlayerIcon(players[0])
                      : SizedBox(width: 108, height: 108),
                  Row(
                    children: [
                      players.length >= 2
                          ? PlayerIcon(players[1])
                          : SizedBox(width: 108, height: 108),
                      SizedBox(width: 70),
                      players.length >= 3
                          ? PlayerIcon(players[2])
                          : SizedBox(width: 108, height: 108),
                    ],
                  ),
                  players.length == 4
                      ? PlayerIcon(players[3])
                      : SizedBox(width: 108, height: 108),
                ],
              )
            ],
          )),
        ),
      ),
    );
  }
}
