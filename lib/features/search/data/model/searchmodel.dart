class Searchmodel {
  final bool? adult;
  final String? backdropPath;
  final List<int>? genreIds;
  final int? id;
  final List<String>? originCountry;
  final String? originalLanguage;
  final String? originalName;
  final String? overview;
  final double? popularity;
  final String? posterPath;
  final String? firstAirDate;
  final String? name;
  final String? title;
  final double? voteAverage;
  final int? voteCount;

  Searchmodel( {this.title,
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

  factory Searchmodel.fromJson(Map<String, dynamic> json) {
    return Searchmodel(
      title: json['title'] as String?,
      adult: json['adult'] as bool?,
      backdropPath: json['backdrop_path'] as String? ,
      genreIds: (json['genre_ids'] as List<dynamic>?)?.map((e) => e as int).toList(),
      id: json['id'] as int?,
      originCountry: (json['origin_country'] as List<dynamic>?)?.map((e) => e as String).toList(),
      originalLanguage: json['original_language'] as String?,
      originalName: json['original_name'] as String?,
      overview: json['overview'] as String?,
      popularity: (json['popularity'] as num?)?.toDouble(),
      posterPath: json['poster_path'] as String?,
      firstAirDate: json['first_air_date'] as String?,
      name: json['name'] as String?,
      voteAverage: (json['vote_average'] as num?)?.toDouble(),
      voteCount: json['vote_count'] as int?,
    );
  }
}

class SearchmodelResponse {
  final int? page;
  final List<Searchmodel>? results;

  SearchmodelResponse({
    this.page,
    this.results,
  });

  factory SearchmodelResponse.fromJson(Map<String, dynamic> json) {
    return SearchmodelResponse(
      page: json['page'] as int?,
      results: (json['results'] as List<dynamic>?)
          ?.map((item) => Searchmodel.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }
}
