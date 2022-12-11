import 'cardvalue.dart';
import 'playingcard.dart';

List<PlayingCard> standardFiftyTwoCardDeck() {
  List<PlayingCard> cards = [];
  for (Suit suit in standardSuits) {
    for (CardType v in suitedValues) {
      cards.add(PlayingCard(suit, v));
    }
  }

  return cards;
}
