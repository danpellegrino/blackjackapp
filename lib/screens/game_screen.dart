import 'package:flutter/material.dart';
import 'package:blackjackapp/components/game_board.dart';
import 'package:provider/provider.dart';

import '../models/player_model.dart';
import '../providers/game_provider.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late final GameProvider _gameProvider;

  @override
  void initState() {
    _gameProvider = Provider.of<GameProvider>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Card Game"),
        actions: [
          TextButton(
            onPressed: () async {
              final players = [
                PlayerModel(name: "Tyler", isHuman: true),
                PlayerModel(name: "Bot", isHuman: false),
              ];

              await _gameProvider.newGame(players);
            },
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
