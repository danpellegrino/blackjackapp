import 'dart:convert';

import 'package:validators/sanitizers.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const baseUrl = "https://www.deckofcardsapi.com/api";

  Uri _url(
    String path, [
    Map<String, dynamic> params = const {}
  ]) {
    String queryString = "";
    if(params.isNotEmpty) {
      queryString = "?";
      params.forEach(
        (key, value) {
          queryString += "$key=${value.toString()}&";
        },
      );
    }

    path = rtrim(path, '/');
    path = rtrim(path, '/');
    queryString = rtrim(queryString, '&');

    final url = '$baseUrl/$path/$queryString';

    return Uri.parse(url);
  }

  Future<Map<String, dynamic>> get(
    String path, {
    Map<String, dynamic> params = const {},
  }) async {
    final url = _url(path, params);

    final response = await http.get(url);
    if(response.bodyBytes.isEmpty) {
      return {};
    }

    return jsonDecode(utf8.decode(response.bodyBytes));
  }


}