class MovieResponse {
  Dates? dates;  
  int? page;  // Make nullable
  List<Movie> results;

  MovieResponse({
    required this.dates,
    required this.page, 
    required this.results,
  });

  factory MovieResponse.fromJson(Map<String, dynamic> json) {
    return MovieResponse(
      dates: json['dates'] != null ? Dates.fromJson(json['dates']) : null,  
      page: json['page'],  
      results: List<Movie>.from(json['results'].map((x) => Movie.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'dates': dates?.toJson(),  
      'page': page, 
      'results': List<dynamic>.from(results.map((x) => x.toJson())),
    };
  }
}


class Dates {
  String? maximum;
  String? minimum;

  Dates({
    required this.maximum,
    required this.minimum,
  });

  factory Dates.fromJson(Map<String, dynamic> json) {
    return Dates(
      maximum: json['maximum'],
      minimum: json['minimum'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'maximum': maximum,
      'minimum': minimum,
    };
  }
}

class Movie {
  bool adult;
  String? backdropPath;
  List<int> genreIds;
  int? id;  
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double popularity;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool video;
  double voteAverage;
  int? voteCount;  

  Movie({
    required this.adult,
    this.backdropPath,  
    required this.genreIds,
    this.id, 
    this.originalLanguage,  
    this.originalTitle, 
    this.overview, 
    required this.popularity,
    this.posterPath, 
    this.releaseDate, 
    this.title, 
    required this.video,
    required this.voteAverage,
    this.voteCount, 
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      adult: json['adult'] ?? false,  
      backdropPath: json['backdrop_path'],  
      genreIds: List<int>.from(json['genre_ids'] ?? []),  
      id: json['id'],  
      originalLanguage: json['original_language'],
      originalTitle: json['original_title'],
      overview: json['overview'],
      popularity: (json['popularity'] ?? 0).toDouble(),  
      posterPath: json['poster_path'],
      releaseDate: json['release_date'],
      title: json['title'],
      video: json['video'] ?? false,  
      voteAverage: (json['vote_average'] ?? 0).toDouble(), 
      voteCount: json['vote_count'],  
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'adult': adult,
      'backdrop_path': backdropPath,
      'genre_ids': List<dynamic>.from(genreIds.map((x) => x)),
      'id': id,  
      'original_language': originalLanguage,
      'original_title': originalTitle,
      'overview': overview,
      'popularity': popularity,
      'poster_path': posterPath,
      'release_date': releaseDate,
      'title': title,
      'video': video,
      'vote_average': voteAverage,
      'vote_count': voteCount,  
    };
  }
}