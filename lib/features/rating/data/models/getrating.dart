class RatedMoviesResponse {
  final int? page;
  final List<RatedMovie>? results;
  final int? totalPages;
  final int? totalResults;

  RatedMoviesResponse({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  factory RatedMoviesResponse.fromJson(Map<String, dynamic> json) {
    return RatedMoviesResponse(
      page: json['page'] as int?,
      results: (json['results'] as List<dynamic>?)
          ?.map((item) => RatedMovie.fromJson(item as Map<String, dynamic>))
          .toList(),
      totalPages: json['total_pages'] as int?,
      totalResults: json['total_results'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'page': page,
        'results': results?.map((item) => item.toJson()).toList(),
        'total_pages': totalPages,
        'total_results': totalResults,
      };
}

class RatedMovie {
  final bool? adult;
  final String? backdropPath;
  final List<int>? genreIds;
  final int? id;
  final String? originalLanguage;
  final String? originalTitle;
  final String? overview;
  final double? popularity;
  final String? posterPath;
  final String? releaseDate;
  final String? title;
  final bool? video;
  final double? voteAverage;
  final int? voteCount;
  final double? rating;

  RatedMovie({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
    this.rating,
  });

  factory RatedMovie.fromJson(Map<String, dynamic> json) {
    return RatedMovie(
      adult: json['adult'] as bool?,
      backdropPath: json['backdrop_path'] as String?,
      genreIds: (json['genre_ids'] as List<dynamic>?)
          ?.map((genreId) => genreId as int)
          .toList(),
      id: json['id'] as int?,
      originalLanguage: json['original_language'] as String?,
      originalTitle: json['original_title'] as String?,
      overview: json['overview'] as String?,
      popularity: (json['popularity'] as num?)?.toDouble(),
      posterPath: json['poster_path'] as String?,
      releaseDate: json['release_date'] as String?,
      title: json['title'] as String?,
      video: json['video'] as bool?,
      voteAverage: (json['vote_average'] as num?)?.toDouble(),
      voteCount: json['vote_count'] as int?,
      rating: (json['rating'] as num?)?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {
        'adult': adult,
        'backdrop_path': backdropPath,
        'genre_ids': genreIds,
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
        'rating': rating,
      };
}
