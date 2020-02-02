import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_films/src/constants/constants.dart';
import 'package:flutter_films/src/models/film_model.dart';
import 'package:flutter_films/src/network/response/get_films_response.dart';
import '../endpoints.dart';

class GetPopularFilmsRequest {
  int _popularPage = 0;
  bool _isLoading = false;
  List<Film> _popularFilm = new List();

  final _popularStreamController = StreamController<List<Film>>.broadcast();
  Function(List<Film>) get popularSink => _popularStreamController.sink.add;
  Stream<List<Film>> get popularStream => _popularStreamController.stream;

  void disposeStreams() {
    _popularStreamController?.close();
  }

  Map<String, String> queryParams = {
    'api_key': Constants.API_KEY,
    'language': 'es',
  };

  Future<List<Film>> getPopularFilms() async {
    if (_isLoading) return [];
    _isLoading = true;

    _popularPage++;
    queryParams['page'] = _popularPage.toString();
    final url =
        Uri.https(Constants.BASE_URL, Endpoints.GET_POPULAR_FILMS, queryParams);

    final response = await _getResponse(url);

    _popularFilm.addAll(response);
    popularSink(_popularFilm);

    _isLoading = false;
    return response;
  }

  Future<List<Film>> _getResponse(Uri url) async {
    final response = await http.get(url);
    final data = json.decode(response.body);
    final films = GetFilmsResponse.fromJson(data);
    return films.items;
  }
}
