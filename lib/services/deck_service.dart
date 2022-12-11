import 'package:blackjackapp/models/deck_model.dart';

import '../models/draw_model.dart';
import 'api_service.dart';

class DeckService extends ApiService {
  Future<DeckModel> newDeck([int deckCount = 6]) async {
    final data = await httpGet(
      '/deck/new/shuffle',
      params: {'deck_count': deckCount},
    );

    return DeckModel.fromJson(data);
  }

  Future<DrawModel> drawCards(DeckModel deck, {int count = 1}) async {
    final data = await httpGet(
      '/deck/${deck.deckId}/draw',
      params: {'count': count},
    );

    return DrawModel.fromJson(data);
  }
}