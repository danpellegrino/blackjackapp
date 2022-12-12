import 'package:blackjackapp/components/card_list.dart';
import 'package:blackjackapp/providers/game_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/player_model.dart';
import 'deck_pile.dart';

class GameBoard extends StatelessWidget {
  const GameBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<GameProvider>(
      builder: (context, model, child) {
        return model.currentDeck != null
            ? Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: GestureDetector(
                      onTap: () async {
                        await model.drawCards(model.players.first);
                      },
                      child: DeckPile(
                        remaining: model.currentDeck!.remaining,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: CardList(
                      player: model.players[0],
                    ),
                  )
                ],
              )
            : Center(
                child: TextButton(
                child: Text("New Game"),
                onPressed: () {
                  final players = [
                    PlayerModel(name: "Tyler", isHuman: true),
                    PlayerModel(name: "Bot", isHuman: false),
                  ];
                  model.newGame(players);
                },
              ));
      },
    );
  }
}
