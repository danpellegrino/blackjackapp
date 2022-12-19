import 'dart:async';

import 'package:blackjackapp/components/card_list.dart';
import 'package:blackjackapp/providers/blackjack_game_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/card_model.dart';
import '../models/player_model.dart';
import 'deck_pile.dart';
import 'discard_pile.dart';

class GameBoard extends StatefulWidget {
  const GameBoard({Key? key}) : super(key: key);

  @override
  State<GameBoard> createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  bool _enabled = true;

  @override
  Widget build(BuildContext context) {
    return Consumer<BlackjackGameProvider>(
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
                          onTap: _enabled
                              ? () {
                                  setState(() => _enabled = false);

                                  Timer(const Duration(milliseconds: 500),
                                      () => setState(() => _enabled = true));

                                  if (model.turn.currentPlayer.isHuman) {
                                    model.drawCards(model.turn.currentPlayer);
                                  }
                                }
                              : null,
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
                    child: Column(
                      children: [
                        Text(
                          model.players[1].score.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        CardList(
                          player: model.players[1],
                        ),
                      ],
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
                          onPlayCard: (CardModel card) {
                            model.playCard(
                                player: model.players[0], card: card);
                          },
                        ),
                        Text(
                          model.players[0].score.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )
            : Center(
                child: TextButton(
                child: const Text("New Game"),
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
