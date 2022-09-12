import 'cardvalue.dart';
import 'playingcard.dart';

List<PlayingCard> standardFiftyTwoCardDeck() {
  List<PlayingCard> cards = [];
  for (Suit suit in STANDARD_SUITS) {
    for (CardType v in SUITED_VALUES) {
      cards.add(PlayingCard(suit, v));
    }
  }

  return cards;
}
