import 'package:flutter/material.dart';

import 'cardvalue.dart';

class PlayingCard {
  // The suit of the card.
  final Suit suit;
  // The rank of the card. ace->king.
  final CardType value;

  // Creates a playing card.
  PlayingCard(this.suit, this.value);
}