import 'package:flutter/material.dart';

class NumberOfPlayersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Hero(
        tag: "PlayerCount",
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('background.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Container(
              width: 400,
              height: 210,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Color.fromARGB(255, 231, 76, 60),
              ),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(255, 195, 63, 49),
                    ),
                    height: 60,
                    child: Center(
                      child: Text(
                        "Choose the number of players",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  Container(
                    height: 150,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        NumberButton(2),
                        NumberButton(3),
                        NumberButton(4),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class NumberButton extends StatelessWidget {
  final int number;
  const NumberButton(this.number);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          Color.fromARGB(255, 195, 63, 49),
        ),
      ),
      onPressed: () {
        print(number);
      },
      child: Container(
        child: Center(
          child: Text(
            "$number",
            style: TextStyle(fontSize: 24),
          ),
        ),
        width: 60,
        height: 60,
      ),
    );
  }
}
