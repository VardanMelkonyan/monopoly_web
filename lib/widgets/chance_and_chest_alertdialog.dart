import 'package:flutter/material.dart';
import 'package:monopoly_web/model/player.dart';
import 'package:monopoly_web/model/utility.dart';

AlertDialog chanceOrCommunityDialog(
    BuildContext context, Player player, int id, bool chance) {
  String cardType = chance == true ? 'Chances' : 'Community';
  String imageName = chance == true ? 'chance' : 'community';
  String num = id < 10 ? '0' : '';
  return AlertDialog(
    backgroundColor: Color(0x00121212),
    content: Container(
      decoration: BoxDecoration(
          color: merColor, borderRadius: BorderRadius.circular(20)),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),
            Text(
              "${player.name}",
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.asset('assets/$cardType/$imageName$num$id.jpg')),
            SizedBox(height: 25),
          ],
        ),
      ),
    ),
  );
}
