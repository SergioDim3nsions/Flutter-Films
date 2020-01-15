// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'film_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Film _$FilmFromJson(Map<String, dynamic> json) {
  return Film()
    ..id = json['id'] as int
    ..popularity = (json['popularity'] as num)?.toDouble()
    ..video = json['video'] as bool
    ..voteCount = json['voteCount'] as int
    ..voteAverage = (json['voteAverage'] as num)?.toDouble()
    ..title = json['title'] as String
    ..releaseDate = json['releaseDate'] as String
    ..originalLanguage = json['originalLanguage'] as String
    ..originalTitle = json['originalTitle'] as String
    ..genreIds = (json['genreIds'] as List)?.map((e) => e as int)?.toList()
    ..backdropPath = json['backdropPath'] as String
    ..adult = json['adult'] as bool
    ..overview = json['overview'] as String
    ..posterPath = json['poster_path'] as String;
}

Map<String, dynamic> _$FilmToJson(Film instance) => <String, dynamic>{
      'id': instance.id,
      'popularity': instance.popularity,
      'video': instance.video,
      'voteCount': instance.voteCount,
      'voteAverage': instance.voteAverage,
      'title': instance.title,
      'releaseDate': instance.releaseDate,
      'originalLanguage': instance.originalLanguage,
      'originalTitle': instance.originalTitle,
      'genreIds': instance.genreIds,
      'backdropPath': instance.backdropPath,
      'adult': instance.adult,
      'overview': instance.overview,
      'poster_path': instance.posterPath,
    };
