class MyReview {
  final String stayName;
  final String checkInDate;
  final List<Map<String, dynamic>>? reviews; // 리뷰 리스트

  MyReview({
    required this.stayName,
    required this.checkInDate,
    this.reviews,
  });
}