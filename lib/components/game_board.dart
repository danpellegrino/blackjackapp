import 'package:blackjackapp/components/card_list.dart';
import 'package:blackjackapp/providers/game_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/player_model.dart';
import 'deck_pile.dart';
import 'discard_pile.dart';

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
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            await model.drawCards(model.turn.currentPlayer);
                          },
                          child: DeckPile(
                            remaining: model.currentDeck!.remaining,
                          ),
                        ),
                        const SizedBox(width: 8),
                        DiscardPile(cards: model.discards),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: CardList(
                      player: model.players[1],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              if (model.turn.currentPlayer == model.players[0])
                                ElevatedButton(
                                    onPressed: model.canEndTurn
                                        ? () {
                                            model.endTurn();
                                          }
                                        : null,
                                    child: const Text("End Turn"))
                            ],
                          ),
                        ),
                        CardList(
                          player: model.players[0],
                        ),
                      ],
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
