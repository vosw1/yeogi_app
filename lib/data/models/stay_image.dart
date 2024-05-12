import 'package:yogi_project/data/models/review.dart';

class StayImage {
  final id; // 이미지 번호
  final stayId; // 이미지를 가진 숙소 번호
  final name; // 이미지 이름
  final path; // 이미지 경로
  final createdAt; // 생성 일자

  // 숙소 상세 보기
  final stayImageId; // 숙소 이미지 아이디
  final stayImagePath; // 숙소 이미지 경로

  StayImage({
    required this.id,
    this.stayId,
    this.name,
    this.path,
    this.createdAt,

    // 숙소 상세 보기
    this.stayImageId,
    this.stayImagePath,
  });

  // Convert Stay object to JSON
  Map<String, dynamic> toJson() {
    return {
      "id": id ?? "",
      "stayId": stayId ?? "",
      "name": name ?? "",
      "path": path ?? "",
      "createdAt": createdAt ?? "",

      // 숙소 상세 보기
      "stayImageId": stayImageId ?? "",
      "stayImagePath": stayImagePath ?? "",
    };
  }

  // Convert JSON data to Stay object
  factory StayImage.fromJson(Map<String, dynamic> json) {
    return StayImage(
      id: json['id'] ?? "",
      stayId: json['stayId'] ?? "",
      name: json['name'] ?? "",
      path: json['path'] ?? "",
      createdAt: json['createdAt'] ?? "",

      // 숙소 상세 보기
      stayImageId: json['stayImageId'] ?? "",
      stayImagePath: json['stayImagePath'] ?? "",
    );
  }
}
