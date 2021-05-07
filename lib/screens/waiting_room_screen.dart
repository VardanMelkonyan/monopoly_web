import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:monopoly_web/model/player.dart';
import 'package:monopoly_web/model/utility.dart';
import 'package:monopoly_web/screens/board_screen.dart';
import 'package:monopoly_web/service/networking.dart';
import 'package:monopoly_web/service/storage.dart';
import 'package:monopoly_web/widgets/just_button.dart';
import 'package:monopoly_web/widgets/player_icon.dart';

class WaitingRoomScreen extends StatefulWidget {
  final String gameId;

  WaitingRoomScreen(this.gameId);
  @override
  _WaitingRoomScreenState createState() => _WaitingRoomScreenState();
}

class _WaitingRoomScreenState extends State<WaitingRoomScreen> {
  List<Player> players = [];

  void _start() async {
    if (players.length < 2 || players.length > 5) return;
    List ps = [];
    for (int i = 0; i < players.length; i++) {
      ps.add({
        "name": players[i].name,
        "figureName": getFigureName(players[i].figure)
      });
    }
    FirebaseFirestore.instance
        .collection("game")
        .doc("status")
        .update({"hasStarted": true});
    if ((await Networking.createGame(
            {"gameId": widget.gameId, "players": ps})) ==
        200)
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => BoardScreen()));
  }

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
                    widget.gameId,
                    style: TextStyle(color: Colors.white, fontSize: 60),
                  ),
                  SizedBox(height: 100),
                  JustButton(
                    title: "Start",
                    color: Colors.green,
                    onPressed: () {
                      _start();
                    },
                  ),
                  Spacer(flex: 1),
                ],
              ),
              SizedBox(width: 200),
              StreamBuilder<Object>(
                  stream: FirebaseFirestore.instance
                      .collection("players")
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return SizedBox();
                    }
                    QuerySnapshot data = snapshot.data;
                    players = [];
                    for (int i = 0;
                        i < data.docs.length && data.docs.length <= 4;
                        i++) {
                      var doc = data.docs[i];
                      print(availableFigureNames);
                      print(doc["name"] + " " + doc.id);
                      if (doc["figureName"] == "") {
                        FirebaseFirestore.instance
                            .collection("players")
                            .doc(doc.id)
                            .update({
                          "name": doc["name"],
                          "figureName": availableFigureNames[0]
                        });
                        availableFigureNames
                            .add(availableFigureNames.removeAt(0));
                      }
                      Figure f = getFigureByName(doc["figureName"]);
                      print("Figure $f");
                      players.add(Player(name: doc["name"], figure: f));
                    }
                    print(availableFigureNames);
                    print(players);
                    return Column(
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
                    );
                  })
            ],
          )),
        ),
      ),
    );
  }
}
