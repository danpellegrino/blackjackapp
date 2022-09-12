import 'package:flutter/material.dart';

import 'dart:math';
import '../components/cardback.dart';
import '../components/cardtemplate.dart';
import '../components/suits.dart';
import '../components/gameboard.dart';

class Homepage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Homepage> with SingleTickerProviderStateMixin {

  late AnimationController _animationController;
  late Animation<double> _animation;
  AnimationStatus _animationStatus = AnimationStatus.dismissed;

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(duration: Duration(milliseconds: 200), vsync: this);

    _animation = Tween(begin:0.0, end: 1.0).animate(_animationController)
      ..addListener(() {
      setState(() {});
    })..addStatusListener((status) {_animationStatus = status;});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[900],
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [CardTemplate(
                  suit: clover(),
                  number: '10',
                ), CardTemplate(
                  suit: heart(),
                  number: 'J',
                )],
              ),
              Transform.rotate(angle: pi/2, child: getFlippingCard("Q", clover(), Colors.red) ,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  getFlippingCard("Q", clover(), Colors.black),
                  getFlippingCard("A", diamond(), Colors.black)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget getFlippingCard(var number, var suit, var backColor) {
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
                  number: number,
                  suit: suit,
                ),
      ),
    );
  }
}