class AuthorDetails {
  String? name;
  String username;
  String? avatarPath;
  double? rating;

  AuthorDetails({
    this.name,
    required this.username,
    this.avatarPath,
    this.rating,
  });

  factory AuthorDetails.fromJson(Map<String, dynamic> json) {
    return AuthorDetails(
      name: json['name'],
      username: json['username'],
      avatarPath: json['avatar_path'],
      rating: json['rating']?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'username': username,
      'avatar_path': avatarPath,
      'rating': rating,
    };
  }
}

class Review {
  String author;
  AuthorDetails authorDetails;
  String content;
  String createdAt;
  String id;
  String? updatedAt;
  String url;

  Review({
    required this.author,
    required this.authorDetails,
    required this.content,
    required this.createdAt,
    required this.id,
    this.updatedAt,
    required this.url,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      author: json['author'],
      authorDetails: AuthorDetails.fromJson(json['author_details']),
      content: json['content'],
      createdAt: json['created_at'],
      id: json['id'],
      updatedAt: json['updated_at'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'author': author,
      'author_details': authorDetails.toJson(),
      'content': content,
      'created_at': createdAt,
      'id': id,
      'updated_at': updatedAt,
      'url': url,
    };
  }
}

class ReviewResponse {
  int id;
  int page;
  List<Review> reviews;
  int totalPages;
  int totalResults;

  ReviewResponse({
    required this.id,
    required this.page,
    required this.reviews,
    required this.totalPages,
    required this.totalResults,
  });

  factory ReviewResponse.fromJson(Map<String, dynamic> json) {
    return ReviewResponse(
      id: json['id'],
      page: json['page'],
      reviews: (json['results'] as List)
          .map((reviewJson) => Review.fromJson(reviewJson))
          .toList(),
      totalPages: json['total_pages'],
      totalResults: json['total_results'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'page': page,
      'results': reviews.map((review) => review.toJson()).toList(),
      'total_pages': totalPages,
      'total_results': totalResults,
    };
  }
}
