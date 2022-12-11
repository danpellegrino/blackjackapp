import 'package:flutter/material.dart';
import 'package:blackjackapp/components/gameboard.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Card Game"),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              "New Game",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: const GameBoard(),
    );
  }
}