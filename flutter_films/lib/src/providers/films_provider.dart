import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_films/src/models/film_model.dart';

class FilmsProvider{

  String _apiKey = 'db4675703887696977a48fb2e8f197dd';
  String _url = 'api.themoviedb.org';
  String _language = 'es';

  Future<List<Film>> getPlayingNow() async {
      Map<String,String> queryParam = {
        'api_key' : _apiKey,
        'laguage' : _language
      };

      final url = Uri.https(_url, '/3/movie/now_playing', queryParam);
      final response = await http.get(url);
      final data = json.decode(response.body);
      final films = Films.fromJsonList(data['results']);
      return films.items;
  }
}