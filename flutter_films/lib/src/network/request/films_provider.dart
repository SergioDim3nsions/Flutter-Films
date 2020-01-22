import 'dart:convert';
import 'package:flutter_films/src/constants/constants.dart';
import 'package:flutter_films/src/models/film_model.dart';
import 'package:flutter_films/src/network/response/get_films_response.dart';
import 'package:http/http.dart' as http;

import '../endpoints.dart';

class GetNowPlayingFilmsRequest {

  Future<List<Film>> getNowPlayingFilms() async {
    Map<String, String> queryParams = {
      'api_key': Constants.API_KEY,
      'language': 'es'
    };

    final url = Uri.https(
        Constants.BASE_URL, Endpoints.GET_NOW_PLAYING_FILMS, queryParams);
    final response = await http.get(url);
    final data = json.decode(response.body);
    final films = GetFilmsResponse.fromJson(data);
    return films.items;
  }
}
