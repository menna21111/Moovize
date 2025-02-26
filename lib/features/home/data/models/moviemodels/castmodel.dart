class CastMember {
  final bool adult;
  final int gender;
  final int id;
  final String knownForDepartment;
  final String name;
  final String originalName;
  final double popularity;
  final String profilePath;
  final int castId;
  final String character;
  final String creditId;
  final int order;

  CastMember({
    required this.adult,
    required this.gender,
    required this.id,
    required this.knownForDepartment,
    required this.name,
    required this.originalName,
    required this.popularity,
    required this.profilePath,
    required this.castId,
    required this.character,
    required this.creditId,
    required this.order,
  });

  factory CastMember.fromJson(Map<String, dynamic> json) {
    return CastMember(
      adult: json['adult'],
      gender: json['gender'],
      id: json['id'],
      knownForDepartment: json['known_for_department'],
      name: json['name'],
      originalName: json['original_name'],
      popularity: json['popularity'].toDouble(),
      profilePath: json['profile_path'] ?? '',
      castId: json['cast_id'],
      character: json['character'],
      creditId: json['credit_id'],
      order: json['order'],
    );
  }
}

class CastResponse {
  final int id;
  final List<CastMember> cast;

  CastResponse({
    required this.id,
    required this.cast,
  });

  factory CastResponse.fromJson(Map<String, dynamic> json) {
    return CastResponse(
      id: json['id'],
      cast: List<CastMember>.from(json['cast'].map((x) => CastMember.fromJson(x))),
    );
  }
}
