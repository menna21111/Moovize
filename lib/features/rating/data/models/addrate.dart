class AddRatingResponse {
  final bool? success;
  final int? statusCode;
  final String? statusMessage;

  AddRatingResponse({
    this.success,
    this.statusCode,
    this.statusMessage,
  });

  factory AddRatingResponse.fromJson(Map<String, dynamic> json) {
    return AddRatingResponse(
      success: json['success'],
      statusCode: json['status_code'],
      statusMessage: json['status_message'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'status_code': statusCode,
      'status_message': statusMessage,
    };
  }
}
