import 'dart:async';
import 'dart:convert';
import 'package:flutter_films/src/constants/constants.dart';
import 'package:flutter_films/src/models/actors_model.dart';
import 'package:flutter_films/src/network/response/get_actors_response.dart';
import 'package:http/http.dart' as http;

class GetCastRequest {
  Map<String, String> queryParams = {
    'api_key': Constants.API_KEY,
    'language': 'es'
  };

  Future<List<Actor>> getCast(String filmId) async {
    queryParams['movie_id'] = filmId;

    final url =
        Uri.https(Constants.BASE_URL, '/3/movie/$filmId/credits', queryParams);
    return _getResponse(url);
  }

  Future<List<Actor>> _getResponse(Uri url) async {
    final response = await http.get(url);
    final data = json.decode(response.body);
    final credits = GetActorsResponse.fromJson(data);
    return credits.cast;
  }
}
