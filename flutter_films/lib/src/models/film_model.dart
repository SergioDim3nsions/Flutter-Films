class Films {
  List<Film> items = List();
  Films();
  Films.fromJsonList(List<dynamic> jsonList){
      if(jsonList == null) return;
      for (var item in jsonList) {
        final film = Film.fromJsonMap(item);
        items.add(film);
      }
  }
}

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
  String posterPath;

  Film({
    this.popularity,
    this.id,
    this.video,
    this.voteCount,
    this.voteAverage,
    this.title,
    this.releaseDate,
    this.originalLanguage,
    this.originalTitle,
    this.genreIds,
    this.backdropPath,
    this.adult,
    this.overview,
    this.posterPath,
  });

  Film.fromJsonMap(Map<String, dynamic> json) {
    popularity = json['popularity'] / 1;
    id = json['id'];
    video = json['video'];
    voteCount = json['vote_count'];
    voteAverage = json['vote_average'] / 1;
    title = json['title'];
    releaseDate = json['release_date'];
    originalLanguage = json['original_laguage'];
    originalTitle = json['original_title'];
    genreIds = json['genre_ids'].cast<int>();
    backdropPath = json['backdrop_path'];
    adult = json['adult'];
    overview = json['overview'];
    posterPath = json['poster_path'];
  }

  getPosterImage(){
    if(posterPath == null){
      return 'https://www.generationsforpeace.org/wp-content/uploads/2018/03/empty.jpg';
    }
    return 'https://image.tmdb.org/t/p/w500/$posterPath';
  }
}
