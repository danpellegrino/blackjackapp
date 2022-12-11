import 'package:flutter/material.dart';
import 'package:blackjackapp/components/gameboard.dart';

import '../services/deck_service.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {

  @override
  void initState() {
    super.initState();
    //tempFunc();
  }

  void tempFunc() async {
    final service = DeckService();

    final deck = await service.newDeck();

    print(deck.remaining);
  }

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