import 'package:flutter_films/src/models/actors_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'get_actors_response.g.dart';

@JsonSerializable()
class GetActorsResponse {
  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'cast')
  List<Actor> cast;

  GetActorsResponse();

  factory GetActorsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetActorsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GetActorsResponseToJson(this);
}
