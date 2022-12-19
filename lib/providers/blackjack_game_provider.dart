import 'package:blackjackapp/providers/game_provider.dart';

import '../models/card_model.dart';
import '../models/player_model.dart';

class BlackjackGameProvider extends GameProvider {
  List<int> aces = [];

  @override
  Future<void> drawCards(
    PlayerModel player, {
    int count = 1,
    bool allowAnyTime = false,
  }) async {
    if (currentDeck == null) return;
    if (!allowAnyTime && !canContinueDrawing(player)) return;

    final draw = await service.drawCards(currentDeck!, count: count);

    await player.addCards(draw.cards);

    player.score += getScoreCount(draw.cards);

    // Makes sure if any ace's are accounted they can be converted to one
    if (player.score > 21) {
      for (int i = 0; i < player.cards.length; i++) {
        if (aces.isNotEmpty) {
          for (int j = 0; j < aces.length; j++) {
            if (player.cards[i].value == "ACE" && i != aces[j]) {
              player.score -= 10;
              aces.add(i);
            }
          }
        } else {
          if (player.cards[i].value == "ACE") {
            player.score -= 10;
            aces.add(i);
          }
        }
      }
    }

    turn.drawCount += count;

    currentDeck!.remaining = draw.remaining;

    // If the user has reached 21 or greater than switch turns
    if (player.score >= 21) {
      await Future.delayed(const Duration(seconds: 4));
      await playCard(player: player, card: player.cards[0]);
      endTurn();
    }

    notifyListeners();
  }

  @override
  Future<void> setupBoard() async {
    for (var p in players) {
      await drawCards(p, count: 1, allowAnyTime: true);
      await Future.delayed(const Duration(milliseconds: 500));
      await drawCards(p, count: 1, allowAnyTime: true);
    }

    //await drawCardToDiscardPile();
    notifyListeners();
  }

  bool canContinueDrawing(PlayerModel player) {
    if (player.score >= 21) return false;
    return true;
  }

  @override
  Future<void> playCard({
    required PlayerModel player,
    required CardModel card,
  }) async {
    if (!canPlayCard(card)) return;
    if (player.cards.length < 2) return;
    while (player.cards.isNotEmpty) {
      await Future.delayed(const Duration(milliseconds: 750));
      discards.add(player.cards.last);
      applyCardSideEffects(player.cards.last);
      player.removeCard(player.cards.last);
      notifyListeners();
    }

    aces.clear();

    turn.actionCount += 1;
    notifyListeners();
  }

  @override
  Future<void> botTurn() async {
    final p = turn.currentPlayer;

    while (canContinueDrawing(p)) {
      await Future.delayed(const Duration(seconds: 1));
      drawCards(p);
    }

    notifyListeners();
  }

  int getScoreCount(List<CardModel> cards) {
    int score = 0;
    for (int i = 0; i < cards.length; i++) {
      switch (cards[i].value.toUpperCase().trim()) {
        case "ACE":
          score += 11;
          break;

        case "2":
        case "3":
        case "4":
        case "5":
        case "6":
        case "7":
        case "8":
        case "9":
          score += int.parse(cards[i].value.toUpperCase().trim());
          break;

        case "10": // 10
        case "KING":
        case "QUEEN":
        case "JACK":
          score += 10;
          break;
      }
    }

    return score;
  }
}
