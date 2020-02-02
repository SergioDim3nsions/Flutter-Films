import 'dart:async';
import 'dart:convert';
import 'package:flutter_films/src/constants/constants.dart';
import 'package:flutter_films/src/models/film_model.dart';
import 'package:flutter_films/src/network/response/get_films_response.dart';
import 'package:http/http.dart' as http;
import '../endpoints.dart';

class GetSearchRequest {
  Map<String, String> queryParams = {
    'api_key': Constants.API_KEY,
    'language': 'es'
  };

  Future<List<Film>> getSearchedFilms(String query) async {
    queryParams['query'] = query;

    final url = Uri.https(
        Constants.BASE_URL, Endpoints.GET_SEARCHED_FILMS, queryParams);
    return _getResponse(url);
  }

  Future<List<Film>> _getResponse(Uri url) async {
    final response = await http.get(url);
    final data = json.decode(response.body);
    final films = GetFilmsResponse.fromJson(data);
    return films.items;
  }
}
