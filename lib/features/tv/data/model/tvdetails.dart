class TvShowDetails {
  final bool? adult;
  final String? backdropPath;
  final List<int>? episodeRunTime;
  final String? firstAirDate;
  final List<Genre>? genres;
  final String? homepage;
  final int? id;
  final bool? inProduction;
  final List<String>? languages;
  final String? lastAirDate;
  final Episode? lastEpisodeToAir;
  final String? name;
  final Episode? nextEpisodeToAir;
  final List<Network>? networks;
  final int? numberOfEpisodes;
  final int? numberOfSeasons;
  final List<String>? originCountry;
  final String? originalLanguage;
  final String? originalName;
  final String? overview;
  final double? popularity;
  final String? posterPath;
  final List<ProductionCompany>? productionCompanies;
  final List<ProductionCountry>? productionCountries;
  final List<Season>? seasons;
  final List<SpokenLanguage>? spokenLanguages;
  final String? status;
  final String? tagline;
  final String? type;
  final double? voteAverage;
  final int? voteCount;

  TvShowDetails({
    this.adult,
    this.backdropPath,
    this.episodeRunTime,
    this.firstAirDate,
    this.genres,
    this.homepage,
    this.id,
    this.inProduction,
    this.languages,
    this.lastAirDate,
    this.lastEpisodeToAir,
    this.name,
    this.nextEpisodeToAir,
    this.networks,
    this.numberOfEpisodes,
    this.numberOfSeasons,
    this.originCountry,
    this.originalLanguage,
    this.originalName,
    this.overview,
    this.popularity,
    this.posterPath,
    this.productionCompanies,
    this.productionCountries,
    this.seasons,
    this.spokenLanguages,
    this.status,
    this.tagline,
    this.type,
    this.voteAverage,
    this.voteCount,
  });

  factory TvShowDetails.fromJson(Map<String, dynamic> json) {
    return TvShowDetails(
      adult: json['adult'],
      backdropPath: json['backdrop_path'],
      episodeRunTime: List<int>.from(json['episode_run_time'] ?? []),
      firstAirDate: json['first_air_date'],
      genres: (json['genres'] as List?)?.map((e) => Genre.fromJson(e)).toList(),
      homepage: json['homepage'],
      id: json['id'],
      inProduction: json['in_production'],
      languages: List<String>.from(json['languages'] ?? []),
      lastAirDate: json['last_air_date'],
      lastEpisodeToAir: json['last_episode_to_air'] != null
          ? Episode.fromJson(json['last_episode_to_air'])
          : null,
      name: json['name'],
      nextEpisodeToAir: json['next_episode_to_air'] != null
          ? Episode.fromJson(json['next_episode_to_air'])
          : null,
      networks: (json['networks'] as List?)?.map((e) => Network.fromJson(e)).toList(),
      numberOfEpisodes: json['number_of_episodes'],
      numberOfSeasons: json['number_of_seasons'],
      originCountry: List<String>.from(json['origin_country'] ?? []),
      originalLanguage: json['original_language'],
      originalName: json['original_name'],
      overview: json['overview'],
      popularity: json['popularity']?.toDouble(),
      posterPath: json['poster_path'],
      productionCompanies: (json['production_companies'] as List?)
          ?.map((e) => ProductionCompany.fromJson(e))
          .toList(),
      productionCountries: (json['production_countries'] as List?)
          ?.map((e) => ProductionCountry.fromJson(e))
          .toList(),
      seasons: (json['seasons'] as List?)?.map((e) => Season.fromJson(e)).toList(),
      spokenLanguages: (json['spoken_languages'] as List?)
          ?.map((e) => SpokenLanguage.fromJson(e))
          .toList(),
      status: json['status'],
      tagline: json['tagline'],
      type: json['type'],
      voteAverage: json['vote_average']?.toDouble(),
      voteCount: json['vote_count'],
    );
  }
}

class Genre {
  final int? id;
  final String? name;

  Genre({this.id, this.name});

  factory Genre.fromJson(Map<String, dynamic> json) {
    return Genre(
      id: json['id'],
      name: json['name'],
    );
  }
}

class Episode {
  final int? id;
  final String? name;
  final String? overview;
  final double? voteAverage;
  final int? voteCount;
  final String? airDate;
  final int? episodeNumber;
  final String? episodeType;
  final String? productionCode;
  final int? runtime;
  final int? seasonNumber;
  final int? showId;
  final String? stillPath;

  Episode({
    this.id,
    this.name,
    this.overview,
    this.voteAverage,
    this.voteCount,
    this.airDate,
    this.episodeNumber,
    this.episodeType,
    this.productionCode,
    this.runtime,
    this.seasonNumber,
    this.showId,
    this.stillPath,
  });

  factory Episode.fromJson(Map<String, dynamic> json) {
    return Episode(
      id: json['id'],
      name: json['name'],
      overview: json['overview'],
      voteAverage: json['vote_average']?.toDouble(),
      voteCount: json['vote_count'],
      airDate: json['air_date'],
      episodeNumber: json['episode_number'],
      episodeType: json['episode_type'],
      productionCode: json['production_code'],
      runtime: json['runtime'],
      seasonNumber: json['season_number'],
      showId: json['show_id'],
      stillPath: json['still_path'],
    );
  }
}

class Network {
  final int? id;
  final String? logoPath;
  final String? name;
  final String? originCountry;

  Network({this.id, this.logoPath, this.name, this.originCountry});

  factory Network.fromJson(Map<String, dynamic> json) {
    return Network(
      id: json['id'],
      logoPath: json['logo_path'],
      name: json['name'],
      originCountry: json['origin_country'],
    );
  }
}

class ProductionCompany {
  final int? id;
  final String? logoPath;
  final String? name;
  final String? originCountry;

  ProductionCompany({this.id, this.logoPath, this.name, this.originCountry});

  factory ProductionCompany.fromJson(Map<String, dynamic> json) {
    return ProductionCompany(
      id: json['id'],
      logoPath: json['logo_path'],
      name: json['name'],
      originCountry: json['origin_country'],
    );
  }
}

class ProductionCountry {
  final String? iso31661;
  final String? name;

  ProductionCountry({this.iso31661, this.name});

  factory ProductionCountry.fromJson(Map<String, dynamic> json) {
    return ProductionCountry(
      iso31661: json['iso_3166_1'],
      name: json['name'],
    );
  }
}

class Season {
  final String? airDate;
  final int? episodeCount;
  final int? id;
  final String? name;
  final String? overview;
  final String? posterPath;
  final int? seasonNumber;
  final double? voteAverage;

  Season({
    this.airDate,
    this.episodeCount,
    this.id,
    this.name,
    this.overview,
    this.posterPath,
    this.seasonNumber,
    this.voteAverage,
  });

  factory Season.fromJson(Map<String, dynamic> json) {
    return Season(
      airDate: json['air_date'],
      episodeCount: json['episode_count'],
      id: json['id'],
      name: json['name'],
      overview: json['overview'],
      posterPath: json['poster_path'],
      seasonNumber: json['season_number'],
      voteAverage: json['vote_average']?.toDouble(),
    );
  }
}

class SpokenLanguage {
  final String? englishName;
  final String? iso6391;
  final String? name;

  SpokenLanguage({this.englishName, this.iso6391, this.name});

  factory SpokenLanguage.fromJson(Map<String, dynamic> json) {
    return SpokenLanguage(
      englishName: json['english_name'],
      iso6391: json['iso_639_1'],
      name: json['name'],
    );
  }
}
