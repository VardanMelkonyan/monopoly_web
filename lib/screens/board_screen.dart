import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:monopoly_web/model/player.dart';
import 'package:monopoly_web/model/utility.dart';
import 'package:monopoly_web/widgets/chance_and_chest_alertdialog.dart';
import 'package:monopoly_web/widgets/player_positioned.dart';

class BoardScreen extends StatefulWidget {
  @override
  _BoardScreenState createState() => _BoardScreenState();
}

class _BoardScreenState extends State<BoardScreen> {
  List<int> dice = [1, 3];

  List players = [];
  List<Widget> playerIcons = [];

  @override
  Widget build(BuildContext context) {
    print(dice);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("game")
                  .doc("game")
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  players = snapshot.data["players"];
                }
                print(players);
                // for (int i = 0; i < players.length; i++) {
                //   playerIcons.add(value)
                // }null
                print(players);
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset('assets/board(0).png'),
                    players.length > 0
                        ? PlayerPositioned(
                            position: players[0]["position"],
                            figure: getFigureByName(players[0]["figure"]),
                            isLeft: true,
                            isTop: false,
                          )
                        : SizedBox(),
                    players.length > 1
                        ? PlayerPositioned(
                            position: players[1]["position"],
                            figure: getFigureByName(players[1]["figure"]),
                            isLeft: false,
                            isTop: false,
                          )
                        : SizedBox(),
                    players.length > 2
                        ? PlayerPositioned(
                            position: players[2]["position"],
                            figure: getFigureByName(players[2]["figure"]),
                            isLeft: true,
                            isTop: true,
                          )
                        : SizedBox(),
                    players.length > 3
                        ? PlayerPositioned(
                            position: players[3]["position"],
                            figure: getFigureByName(players[3]["figure"]),
                            isLeft: false,
                            isTop: true,
                          )
                        : SizedBox(),
                    Expanded(
                      child: Center(
                        child: SizedBox(
                          child: Row(
                            children: [
                              SizedBox(
                                width: 50,
                                child: Image.asset(
                                    'assets/dice/dice${snapshot.data["lastRoll"][0]}.png'),
                              ),
                              SizedBox(width: 170),
                              SizedBox(
                                width: 50,
                                child: Image.asset(
                                    'assets/dice/dice${snapshot.data["lastRoll"][1]}.png'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20)
                  ],
                );
              }),
          // StreamBuilder(
          //   stream: FirebaseFirestore.instance.collection("game").snapshots(),
          //   builder: (context, snapshot) {
          //     if (snapshot.hasData) {
          //       QuerySnapshot data = snapshot.data;
          //       data.docs.forEach((element) {
          //         if (element.id == "chance") {
          //           int id = element["id"];
          //           if (id != -1) {
          //             showDialog(
          //                 context: context,
          //                 builder: chanceOrCommunityDialog(
          //                     context, element["name"], id, true)).then((value) => null);
          //           }
          //         }

          //         if (element.id == "community") {
          //           int id = element["id"];
          //           if (id != -1) {
          //             showDialog(
          //                 context: context,
          //                 builder: chanceOrCommunityDialog(
          //                     context, element["name"], id, false)).then((value){
          //                       FirebaseFirestore.instance.collection("game").doc("community").update({"id": -1, "name": ""});
          //                     });
          //           }
          //         }
          //       });
          //     }
          //     return SizedBox();
          //   },
          // ),
          SizedBox(width: 100),
        ])),
      ),
    );
  }
}
