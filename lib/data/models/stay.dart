import 'package:yogi_project/data/models/review.dart';

class Stay {
  final String stayImgTitle; // 숙소 이미지 제목
  final String stayName; // 숙소 이름
  final String stayInfo; // 숙소 소개
  final String location; // 위치
  final String notice; // 이용공지
  final List<Review>? reviews; // 리뷰 리스트

  Stay({
    required this.stayImgTitle,
    required this.stayName,
    required this.stayInfo,
    required this.location,
    required this.notice,
    this.reviews,
  });

  // Convert Stay object to JSON
  Map<String, dynamic> toJson() {
    return {
      "stayImgTitle": stayImgTitle,
      "stayName": stayName,
      "stayInfo": stayInfo,
      "location": location,
      "notice": notice,
      "reviews": reviews?.map((review) => review?.toJson()).toList(),
    };
  }

  // Convert JSON data to Stay object
  factory Stay.fromJson(Map<String, dynamic> json) {
    return Stay(
      stayImgTitle: json['stayImgTitle'],
      stayName: json['stayName'],
      stayInfo: json['stayInfo'],
      location: json['location'],
      notice: json['notice'],
      reviews: (json['reviews'] as List<dynamic>?)
          ?.map((reviewJson) => Review.fromJson(reviewJson))
          .toList(),
    );
  }
}
