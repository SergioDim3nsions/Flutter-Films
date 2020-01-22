import 'package:flutter_films/src/models/film_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'get_films_response.g.dart';

@JsonSerializable()
class GetFilmsResponse {
  @JsonKey(name: 'results')
  List<Film> items = List();
  GetFilmsResponse();

  factory GetFilmsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetFilmsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GetFilmsResponseToJson(this);
}




