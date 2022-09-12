import 'package:flutter/material.dart';

enum CardType {
  one,
  two,
  three,
  four,
  five,
  six,
  seven,
  eight,
  nine,
  ten,
  jack,
  queen,
  king
}

const SUITED_VALUES = [
  CardType.one,
  CardType.two,
  CardType.three,
  CardType.four,
  CardType.five,
  CardType.six,
  CardType.seven,
  CardType.eight,
  CardType.nine,
  CardType.ten,
  CardType.jack,
  CardType.queen,
  CardType.king
];

enum Suit {
  spades,
  hearts,
  diamonds,
  clubs,
  joker
}

const STANDARD_SUITS = [
  Suit.spades,
  Suit.hearts,
  Suit.diamonds,
  Suit.clubs,
];
