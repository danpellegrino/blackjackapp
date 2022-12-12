import 'package:blackjackapp/models/player_model.dart';

class Turn {
  final List<PlayerModel> players;
  int index;
  PlayerModel currentPlayer;
  int drawCount;
  int actionCount;

  Turn({
    required this.players,
    required this.currentPlayer,
    this.index = 0,
    this.drawCount = 0,
    this.actionCount = 0,
  });

  void nextTurn() {
    index += 1;
    // This logic needs to be updated if >2 players are implemented
    currentPlayer = index % 2 == 0 ? players[0] : players[1];
    drawCount = 0;
    actionCount = 0;
  }

  PlayerModel get otherPlayer {
    // This logic needs to be updated if >2 players are implemented
    return players.firstWhere((p) => p != currentPlayer);
  }
}
