import 'package:blackjackapp/components/playing_card.dart';
import 'package:blackjackapp/models/card_model.dart';
import 'package:flutter/material.dart';

class GameBoard extends StatelessWidget {
  const GameBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final card = CardModel(
        image: "https://deckofcardsapi.com/static/img/KS.png",
        suit: Suit.spades,
        value: "KING");

    return Center(
      child: PlayingCard(
        card: card,
        visible: true,
      ),
    );
  }
}
