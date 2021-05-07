import 'package:flutter/material.dart';
import 'package:monopoly_web/model/property_model.dart';
import 'package:monopoly_web/model/utility.dart';

class Player {
  final String name;
  final Figure figure;
  int position;
  int money;
  List<PropertyModel> properties;

  Player(
      {@required this.name,
      @required this.figure,
      this.money,
      this.properties});

  @override
  String toString() {
    return name;
  }

  void printProperties() {
    print(properties);
  }
}
