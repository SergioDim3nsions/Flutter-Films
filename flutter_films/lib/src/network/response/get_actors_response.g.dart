// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_actors_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetActorsResponse _$GetActorsResponseFromJson(Map<String, dynamic> json) {
  return GetActorsResponse()
    ..id = json['id'] as int
    ..cast = (json['cast'] as List)
        ?.map(
            (e) => e == null ? null : Actor.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$GetActorsResponseToJson(GetActorsResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cast': instance.cast,
    };
