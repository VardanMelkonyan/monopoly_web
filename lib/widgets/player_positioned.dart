import 'package:flutter/material.dart';
import 'package:monopoly_web/model/utility.dart';

// ignore: must_be_immutable
class PlayerPositioned extends StatelessWidget {
  final Figure figure;
  double boardSize;
  final int position;
  final bool isLeft;
  final bool isTop;

  PlayerPositioned(
      {@required this.position,
      @required this.figure,
      @required this.isLeft,
      @required this.isTop});

  double getRelativeSize(double x) {
    return x * boardSize / 722.4;
  }

  double getPosition(int x) {
    return getRelativeSize(58.5) * (x % 10) +
        getRelativeSize(isLeft ? 68 : 37.5);
  }

  @override
  Widget build(BuildContext context) {
    boardSize = getScreenHeight(context) - (2 * 16);
    int pole =
        position < 10 ? 0 : (position < 20 ? 1 : (position < 30 ? 2 : 3));
    print(position);

    double right;
    double left;
    double top;
    double bottom;

    print(pole);

    switch (pole) {
      case 0:
        right = getPosition(position);
        bottom = isTop ? 40 : 5;
        top = null;
        left = null;
        break;
      case 1:
        print("hi");
        left = isTop ? 40 : 5;
        bottom = getPosition(position);
        right = null;
        top = null;
        break;
      case 2:
        left = getPosition(position);
        top = isTop ? 40 : 5;
        right = null;
        bottom = null;
        break;
      case 3:
        right = isTop ? 40 : 5;
        top = getPosition(position);
        left = null;
        bottom = null;
        break;
      default:
        print("U fucked Up");
    }

    print("left: $left, bottom: $bottom, right: $right, top: $top");

    return Positioned(
      top: top,
      left: left,
      right: right,
      bottom: bottom,
      child: SizedBox(
        width: 30,
        child: Image.asset('images/$figure.png'),
      ),
    );
  }
}
