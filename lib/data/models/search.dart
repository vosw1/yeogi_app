class Search {
  final String stayImgTitle; // 숙소 이미지 제목
  final String stayName; // 숙소 이름
  final String stayInfo; // 숙소 소개
  final String location; // 위치

  Search({
    required this.stayImgTitle,
    required this.stayName,
    required this.stayInfo,
    required this.location,
  });

  // Convert Stay object to JSON
  Map<String, dynamic> toJson() {
    return {
      "stayImgTitle": stayImgTitle,
      "stayName": stayName,
      "stayInfo": stayInfo,
      "location": location,
    };
  }
}
