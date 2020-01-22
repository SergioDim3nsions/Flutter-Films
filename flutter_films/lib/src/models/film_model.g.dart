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
    ..voteAverage = (json['vote_average'] as num)?.toDouble()
    ..title = json['title'] as String
    ..releaseDate = json['release_date'] as String
    ..originalLanguage = json['original_language'] as String
    ..originalTitle = json['original_title'] as String
    ..genreIds = (json['genreIds'] as List)?.map((e) => e as int)?.toList()
    ..backdropPath = json['backdrop_path'] as String
    ..adult = json['adult'] as bool
    ..overview = json['overview'] as String
    ..posterPath = json['poster_path'] as String;
}

Map<String, dynamic> _$FilmToJson(Film instance) => <String, dynamic>{
      'id': instance.id,
      'popularity': instance.popularity,
      'video': instance.video,
      'voteCount': instance.voteCount,
      'vote_average': instance.voteAverage,
      'title': instance.title,
      'release_date': instance.releaseDate,
      'original_language': instance.originalLanguage,
      'original_title': instance.originalTitle,
      'genreIds': instance.genreIds,
      'backdrop_path': instance.backdropPath,
      'adult': instance.adult,
      'overview': instance.overview,
      'poster_path': instance.posterPath,
    };
