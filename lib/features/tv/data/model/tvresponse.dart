class TVShowResponse {
  int? page;
  List<TvShow>? results;
  int? totalResults;
  int? totalPages;

  TVShowResponse({
    this.page,
    this.results,
    this.totalResults,
    this.totalPages,
  });

  // Factory constructor to create TVShowResponse from JSON data
  factory TVShowResponse.fromJson(Map<String, dynamic> json) {
    return TVShowResponse(
      page: json['page'] as int?,
      results: (json['results'] as List?)
          ?.map((item) => TvShow.fromJson(item as Map<String, dynamic>))
          .toList(),
      totalResults: json['total_results'] as int?,
      totalPages: json['total_pages'] as int?,
    );
  }

  
}


class TvShow {
  bool? adult;
  String? backdropPath;
  List<int>? genreIds;
  int? id;
  List<String>? originCountry;
  String? originalLanguage;
  String? originalName;
  String? overview;
  double? popularity;
  String? posterPath;
  String? firstAirDate;
  String? name;
  double? voteAverage;
  int? voteCount;

  TvShow({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originCountry,
    this.originalLanguage,
    this.originalName,
    this.overview,
    this.popularity,
    this.posterPath,
    this.firstAirDate,
    this.name,
    this.voteAverage,
    this.voteCount,
  });

  factory TvShow.fromJson(Map<String, dynamic> json) {
    return TvShow(
      adult: json['adult'],
      backdropPath: json['backdrop_path'],
      genreIds: (json['genre_ids'] as List<dynamic>?)?.map((e) => e as int).toList(),
      id: json['id'],
      originCountry: (json['origin_country'] as List<dynamic>?)?.map((e) => e as String).toList(),
      originalLanguage: json['original_language'],
      originalName: json['original_name'],
      overview: json['overview'],
      popularity: (json['popularity'] as num?)?.toDouble(),
      posterPath: json['poster_path'],
      firstAirDate: json['first_air_date'],
      name: json['name'],
      voteAverage: (json['vote_average'] as num?)?.toDouble(),
      voteCount: json['vote_count'],
    );
  }
}
