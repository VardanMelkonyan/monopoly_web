import 'dart:math';

import 'package:flutter/material.dart';
import 'package:monopoly_web/model/utility.dart';
import 'package:monopoly_web/widgets/just_button.dart';
import 'package:monopoly_web/widgets/player_positioned.dart';

class BoardScreen extends StatefulWidget {
  @override
  _BoardScreenState createState() => _BoardScreenState();
}

class _BoardScreenState extends State<BoardScreen> {
  List<int> dice = [1, 3];
  double boardSize = 0;
  double margin = 0;
  double leftStart = 0;
  double rightStart = 0;

  void roll() {
    Random r = Random();
    setState(() {
      dice[0] = r.nextInt(6) + 1;
      dice[1] = r.nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    boardSize = getScreenHeight(context) - (2 * 16);
    margin = 58.5 * boardSize / 722.4;
    leftStart = 37.5 * boardSize / 722.4;
    rightStart = 68 * boardSize / 722.4;
    print(boardSize);
    print(dice);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
            child: Row(children: [
          Stack(
            children: [
              Image.asset('assets/board(0).png'),
              PlayerPositioned(
                position: 39,
                figure: Figure.car,
                isLeft: true,
                isTop: false,
              ),
              PlayerPositioned(
                position: 39,
                figure: Figure.shoe,
                isLeft: true,
                isTop: true,
              ),
              PlayerPositioned(
                  position: 39,
                  figure: Figure.dog,
                  isLeft: false,
                  isTop: false),
              PlayerPositioned(
                position: 39,
                figure: Figure.hat,
                isLeft: false,
                isTop: true,
              ),
            ],
          ),
          SizedBox(width: 100),
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 50,
                      child: Image.asset('assets/dice/dice${dice[0]}.png'),
                    ),
                    SizedBox(width: 10),
                    SizedBox(
                      width: 50,
                      child: Image.asset('assets/dice/dice${dice[1]}.png'),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                JustButton(
                  title: "Roll",
                  color: Colors.red,
                  onPressed: roll,
                )
              ])
        ])),
      ),
    );
  }
}
