enum Suit {
  hearts,
  clubs,
  diamonds,
  spades,
  other,
}


class CardModel {
  final String image,
               suit,
               value;

  CardModel({
    required this.image,
    required this.suit,
    required this.value
  });
}