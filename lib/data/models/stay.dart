class Stay {
  final String stayImgTitle; // 숙소 이미지 제목
  final String stayName; // 숙소 이름
  final String stayInfo; // 숙소 소개
  final String location; // 위치
  final String notice; // 이용공지
  final List<Map<String, dynamic>>? reviews; // 리뷰 리스트

  Stay({
    required this.stayImgTitle,
    required this.stayName,
    required this.stayInfo,
    required this.location,
    required this.notice,
    this.reviews, // 리뷰가 null일 수 있음을 나타내기 위해 물음표 추가
  });

  // Convert Stay object to JSON
  Map<String, dynamic> toJson() {
    return {
      "stayImgTitle": stayImgTitle,
      "stayName": stayName,
      "stayInfo": stayInfo,
      "location": location,
      "notice": notice,
      "reviews": reviews,
    };
  }
}
