import 'package:yogi_project/data/models/review.dart';

class Scrap {
  final id;
  final company; // 숙소를 등록한 기업
  final stayImgTitle; // 숙소 이미지 제목
  final stayName; // 숙소 이름
  final stayInfo; // 숙소 소개
  final stayAddress; // 숙소 주소
  final category; // 숙소 분류
  final location; // 위치
  final notice; // 이용공지 (서버/information)
  final state; // 숙소 삭제 여부
  final createdAt; // 생성 일자
  final reviews; // 리뷰 리스트


  final stayId;
  final imageName;
  final imagePath;
  final name;
  final address;
  final intro;

  Scrap({
    this.id,
    this.company,
    required this.stayImgTitle,
    required this.stayName,
    required this.stayInfo,
    this.stayAddress,
    this.category,
    this.location,
    this.notice,
    this.state,
    this.createdAt,
    this.reviews,

    // 세일 숙소 리스트
    this.stayId,
    this.imageName,
    this.imagePath,
    this.name,
    this.address,
    this.intro,
  });

  // Convert Stay object to JSON
  Map<String, dynamic> toJson() {
    return {
      "id": id ?? "",
      "company": company ?? "",
      "stayImgTitle": stayImgTitle ?? "",
      "stayName": stayName ?? "",
      "stayInfo": stayInfo ?? "",
      "stayAddress": stayAddress ?? "",
      "category": category ?? "",
      "location": location ?? "",
      "notice": notice ?? "",
      "state": state ?? "",
      "createdAt": createdAt ?? "",
      "reviews": reviews?.map((review) => review?.toJson()).toList() ?? "",

      // 세일 숙소 리스트
      "stayId": stayId ?? "",
      "imageName": imageName ?? "",
      "imagePath": imagePath ?? "",
      "name": name ?? "",
      "address": address ?? "",
      "intro": intro ?? "",
    };
  }

  // Convert JSON data to Stay object
  factory Scrap.fromJson(Map<String, dynamic> json) {
    return Scrap(
      id: json['id'] ?? "",
      company: json['company'] ?? "",
      stayImgTitle: json['stayImgTitle'] ?? "",
      stayName: json['stayName'] ?? "",
      stayInfo: json['stayInfo'] ?? "",
      stayAddress: json['stayAddress'] ?? "",
      category: json['category'] ?? "",
      location: json['location'] ?? "",
      notice: json['notice'] ?? "",
      state: json['state'] ?? "",
      createdAt: json['createdAt'] ?? "",
      reviews: (json['reviews'] as List<dynamic>?)
          ?.map((reviewJson) => Review.fromJson(reviewJson))
          .toList() ??
          "",

      // 세일 숙소 리스트
      stayId: json['stayId'] ?? "",
      imageName: json['imageName'] ?? "",
      imagePath: json['imagePath'] ?? "",
      name: json['name'] ?? "",
      address: json['address'] ?? "",
      intro: json['intro'] ?? "",
    );
  }
}
