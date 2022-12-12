import 'package:blackjackapp/components/constants.dart';
import 'package:blackjackapp/components/playing_card.dart';
import 'package:flutter/material.dart';

import '../models/card_model.dart';
import '../models/player_model.dart';

class CardList extends StatelessWidget {
  final double size;
  final PlayerModel player;
  final Function(CardModel)? onPlayCard;

  const CardList({
    Key? key,
    required this.player,
    this.size = 1,
    this.onPlayCard,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: CARD_HEIGHT * size,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: player.cards.length,
        itemBuilder: (context, index) {
          final card = player.cards[index];
          return PlayingCard(
            card: card,
            size: size,
            visible: true,
          );
        },
      ),
    );
  }
}