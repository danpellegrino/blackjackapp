import 'package:flutter/material.dart';
import 'game_screen.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StartState();
  }
}

class StartState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) => const GameScreen()
      ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container (
        color: Colors.black,
        child: Stack(
          children: [
            Positioned.fill(
              child: Opacity (
                opacity: 0.3,
                child: Image.asset (
                'lib/assets/main_bg.jpg',
                fit: BoxFit.cover),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipOval(
                    child: Container(
                      width: 180,
                      height: 180,
                      color: const Color.fromARGB(255, 238, 243, 233),
                      alignment: Alignment.center,
                      child: Image.asset (
                      'lib/assets/main_icon.jpg', width: 130, height: 130,
                      ),
                    ),
                  ),
                  const Text('Blackjack',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold
                    )
                  )
                ]
              ),
            )
          ]
        )
      )
    );
  }
}