import 'package:flutter/material.dart';

enum Suit {
  hearts,
  clubs,
  diamonds,
  spades,
  other,
}

class CardModel {
  final String image;
  final Suit suit;
  final String value;

  CardModel({
    required this.image,
    required this.suit,
    required this.value,
  });

  factory CardModel.fromJson(Map<String, dynamic> json) {
    return CardModel(
      image: json['image'],
      suit: stringToSuit(json['suit']),
      value: json['value'],
    );
  }

  static Suit stringToSuit(String suit) {
    switch (suit.toUpperCase().trim()) {
      case "HEARTS":
        return Suit.hearts;
      case "CLUBS":
        return Suit.clubs;
      case "DIAMONDS":
        return Suit.diamonds;
      case "SPADES":
        return Suit.spades;
      default:
        return Suit.other;
    }
  }

  static String suitToString(Suit suit) {
    switch (suit) {
      case Suit.hearts:
        return "Hearts";
      case Suit.clubs:
        return "Clubs";
      case Suit.diamonds:
        return "Diamonds";
      case Suit.spades:
        return "Spades";
      case Suit.other:
        return "Other";
    }
  }

  static String suitToUnicode(Suit suit) {
    switch (suit) {
      case Suit.hearts:
        return "\u2665";
      case Suit.clubs:
        return "\u2663";
      case Suit.diamonds:
        return "\u2666";
      case Suit.spades:
        return "\u2660";
      case Suit.other:
        return "Other";
    }
  }

  static Color suitToColor(Suit suit) {
    switch (suit) {
      case Suit.hearts:
      case Suit.diamonds:
        return Colors.red;
      default:
        return Colors.black;
    }
  }
}