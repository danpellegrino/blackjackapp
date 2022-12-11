class DeckModel {
  final String deckId;
  bool shuffled;
  int remaining;

  DeckModel({
    required this.deckId,
    required this.shuffled,
    required this.remaining
  });
}