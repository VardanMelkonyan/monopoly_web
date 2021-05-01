import 'dart:math';

import 'package:flutter/material.dart';
import 'package:monopoly_web/model/player.dart';
import 'package:monopoly_web/model/utility.dart';
import 'package:monopoly_web/widgets/chance_and_chest_alertdialog.dart';
import 'package:monopoly_web/widgets/just_button.dart';
import 'package:monopoly_web/widgets/player_positioned.dart';

class BoardScreen extends StatefulWidget {
  @override
  _BoardScreenState createState() => _BoardScreenState();
}

class _BoardScreenState extends State<BoardScreen> {
  List<int> dice = [1, 3];

  void roll() {
    Random r = Random();
    setState(() {
      dice[0] = r.nextInt(6) + 1;
      dice[1] = r.nextInt(6) + 1;
    });
  }

  AlertDialog _chanceOrCommunityDialog(BuildContext context) {
    return chanceOrCommunityDialog(context,
        Player(name: "Vardan", figure: Figure.hat, money: 1000), 11, false);
  }

  @override
  Widget build(BuildContext context) {
    print(dice);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Stack(
            alignment: Alignment.center,
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
              Expanded(
                child: Center(
                  child: SizedBox(
                    child: Row(
                      children: [
                        SizedBox(
                          width: 50,
                          child: Image.asset('assets/dice/dice${dice[0]}.png'),
                        ),
                        SizedBox(width: 170),
                        SizedBox(
                          width: 50,
                          child: Image.asset('assets/dice/dice${dice[1]}.png'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20)
            ],
          ),
          SizedBox(width: 100),
        ])),
      ),
    );
  }
}
