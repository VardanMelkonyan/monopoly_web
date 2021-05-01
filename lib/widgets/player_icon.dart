import 'package:flutter/material.dart';
import 'package:monopoly_web/model/player.dart';

class PlayerIcon extends StatelessWidget {
  final Player player;
  const PlayerIcon(this.player);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Column(
          children: [
            SizedBox(
              width: 100,
              child: Image.asset('assets/images/${player.figure}.png'),
            ),
            SizedBox(height: 10),
            Text(
              player.name,
              style: TextStyle(fontSize: 20, color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
