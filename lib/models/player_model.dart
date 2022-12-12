import 'card_model.dart';

class PlayerModel {
  final String name;
  final bool isHuman;
  List<CardModel> cards;

  PlayerModel(
      {required this.name, this.cards = const [], this.isHuman = false});

  addCards(List<CardModel> newCards) {
    cards = [...cards, ...newCards]; // Combines the two arrays
  }

  removeCard(CardModel card) {
    cards.removeWhere((c) => c.value == card.value && c.suit == card.suit);
  } // TODO : THIS NEEDS TO BE FIXED AS IT WILL REMOVE ALL SIMILAR CARDS IF IT'S GREATER THAN ONE DECK
  // IN THIS CASE BLACK JACK IS 6 DECKS SO IT WONT WORK RIGHT

  bool get isBot {
    return !isHuman;
  }
}
