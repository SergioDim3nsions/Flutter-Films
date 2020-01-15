import 'package:json_annotation/json_annotation.dart';
part 'film_model.g.dart';

@JsonSerializable()
class Film {
  int id;
  double popularity;
  bool video;
  int voteCount;
  double voteAverage;
  String title;
  String releaseDate;
  String originalLanguage;
  String originalTitle;
  List<int> genreIds;
  String backdropPath;
  bool adult;
  String overview;

  @JsonKey(name: 'poster_path')
  String posterPath;

  Film();

  factory Film.fromJson(Map<String, dynamic> json) => _$FilmFromJson(json);
  Map<String, dynamic> toJson() => _$FilmToJson(this);

  getPosterImage() {
    if (posterPath == null) {
      return 'https://www.generationsforpeace.org/wp-content/uploads/2018/03/empty.jpg';
    }
    return 'https://image.tmdb.org/t/p/w500/$posterPath';
  }
}
