class MovieDetails {
  bool adult;
  String? backdropPath;
  String? belongsToCollection;
  int? budget;

  String? homepage;
  int? id;
  String? imdbId;
  List<String> originCountry;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double popularity;
  String? posterPath;

  String? releaseDate;
  int? revenue;
  int? runtime;

  String? status;
  String? tagline;
  String? title;
  bool video;
  double voteAverage;
  int? voteCount;

  MovieDetails({
    required this.adult,
    this.backdropPath,
    this.belongsToCollection,
    this.budget,
    this.homepage,
    this.id,
    this.imdbId,
    required this.originCountry,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    required this.popularity,
    this.posterPath,
    this.releaseDate,
    this.revenue,
    this.runtime,
    this.status,
    this.tagline,
    this.title,
    required this.video,
    required this.voteAverage,
    this.voteCount,
  });

  // The factory constructor to create MovieDetails from JSON
  factory MovieDetails.fromJson(Map<String, dynamic> json) {
    return MovieDetails(
      adult: json['adult'] ?? false,
      backdropPath: json['backdrop_path'],
      belongsToCollection: json['belongs_to_collection'] != null
          ? json['belongs_to_collection']['name'] // Extract the name correctly
          : null, // Handle null case
      budget: json['budget'],
      homepage: json['homepage'],
      id: json['id'],
      imdbId: json['imdb_id'],
      originCountry: List<String>.from(json['origin_country']),
      originalLanguage: json['original_language'],
      originalTitle: json['original_title'],
      overview: json['overview'],
      popularity: (json['popularity'] ?? 0).toDouble(),
      posterPath: json['poster_path'],
      releaseDate: json['release_date'],
      revenue: json['revenue'],
      runtime: json['runtime'],
      status: json['status'],
      tagline: json['tagline'],
      title: json['title'],
      video: json['video'] ?? false,
      voteAverage: (json['vote_average'] ?? 0).toDouble(),
      voteCount: json['vote_count'],
    );
  }

  // Add the toJson method to convert MovieDetails to a JSON object
 Map<String, dynamic> toJson() {
  return {
    'adult': adult,
    'backdrop_path': backdropPath,
    'belongs_to_collection': belongsToCollection,
    'budget': budget,
    'homepage': homepage,
    'id': id ?? 0, // Ensure it's always an int
    'imdb_id': imdbId,
    'origin_country': originCountry,
    'original_language': originalLanguage,
    'original_title': originalTitle,
    'overview': overview,
    'popularity': popularity,
    'poster_path': posterPath,
    'release_date': releaseDate,
    'revenue': revenue,
    'runtime': runtime,
    'status': status,
    'tagline': tagline,
    'title': title,
    'video': video,
    'vote_average': voteAverage,
    'vote_count': voteCount,
  };
}

  
}
  // The toHiveModel method added for conversion to the Hive model