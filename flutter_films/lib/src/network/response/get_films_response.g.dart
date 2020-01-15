// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_films_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetFilmsResponse _$GetFilmsResponseFromJson(Map<String, dynamic> json) {
  return GetFilmsResponse()
    ..items = (json['results'] as List)
        ?.map(
            (e) => e == null ? null : Film.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$GetFilmsResponseToJson(GetFilmsResponse instance) =>
    <String, dynamic>{
      'results': instance.items,
    };
