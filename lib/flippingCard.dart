import 'package:flutter/cupertino.dart';

import 'card.dart';
import 'cardtemplate.dart';
import 'suits.dart';

class flippingCard with SingleTickerProviderStateMixin {

  late AnimationController _animationController;
  late Animation<double> _animation;
  AnimationStatus _animationStatus = AnimationStatus.dismissed;

  Widget getFlippingCard(var number, var suit, var color, var backColor) {
    return Transform(
      alignment: FractionalOffset.center,
      transform: Matrix4.identity()..setEntry(3, 2, 0.002)..rotateY(pi * _animation.value),
      child: GestureDetector(
        onTap: () {
          if (_animationStatus == AnimationStatus.dismissed) {
            _animationController.forward();
          }
          else {
            _animationController.reverse();
          }
        },
        child: _animation.value >= 0.5 ? CardBack(
          color: backColor,
        ) : CardTemplate(
                  color: color,
                  number: number,
                  suit: suit,
                ),
      ),
    );
  }
}