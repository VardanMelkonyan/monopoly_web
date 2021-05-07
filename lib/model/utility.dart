import 'package:flutter/material.dart';

enum Figure { hat, dog, car, shoe }

Figure getFigureByName(String name) {
  switch (name) {
    case "HAT":
      return Figure.hat;
    case "DOG":
      return Figure.dog;
    case "CAR":
      return Figure.car;
    case "SHOE":
      return Figure.shoe;
  }
  return null;
}

String getFigureName(Figure f) {
  return f.toString().replaceAll("Figure.", "").toUpperCase();
}

List availableFigureNames = ["HAT", "CAR", "SHOE", "DOG"];

Color merColor = Color(0xff3B296D);

double getScreenHeight(BuildContext context) =>
    MediaQuery.of(context).size.height;
