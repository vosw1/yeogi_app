class Review {
  final double rating; // 별점
  final String comment; // 코멘트

  Review({
    required this.rating,
    required this.comment,
  });

  // Convert Review object to JSON
  Map<String, dynamic> toJson() {
    return {
      "rating": rating,
      "comment": comment,
    };
  }
}