class GenreResponse {
  List<Genre> genres;

  GenreResponse({
    required this.genres,
  });

  factory GenreResponse.fromJson(Map<String, dynamic> json) {
    return GenreResponse(
      genres: List<Genre>.from(json['genres'].map((x) => Genre.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'genres': List<dynamic>.from(genres.map((x) => x.toJson())),
    };
  }
}

class Genre {
  int id;
  String name;

  Genre({
    required this.id,
    required this.name,
  });

  factory Genre.fromJson(Map<String, dynamic> json) {
    return Genre(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}
