import 'dart:ffi';

class StaySaveReqDTO {
  final String stayImgTitle; // 숙소 이미지 제목
  final String stayName; // 숙소 이름
  final String stayInfo; // 숙소 소개
  final String location; // 위치
  final double gpslng;
  final double gpslat;
  final String notice;

  StaySaveReqDTO({
    required this.stayImgTitle,
    required this.stayName,
    required this.stayInfo,
    required this.location,
    required this.gpslng,
    required this.gpslat,
    required this.notice,
  }); // 이용공지

  // StaySaveReqDTO 객체를 JSON으로 변환
  Map<String, dynamic> toJson() {
    return {
      "stayImgTitle": stayImgTitle,
      "stayName": stayName,
      "stayInfo": stayInfo,
      "location": location,
      "notice": notice,
    };
  }
}

class StayUpdateReqDTO {
  final String stayImgTitle; // 숙소 이미지 제목
  final String stayName; // 숙소 이름
  final String stayInfo; // 숙소 소개
  final String location; // 위치
  final double gpslng;
  final double gpslat;
  final String notice;

  StayUpdateReqDTO({
    required this.stayImgTitle,
    required this.stayName,
    required this.stayInfo,
    required this.location,
    required this.gpslng,
    required this.gpslat,
    required this.notice,

  }); // 이용공지

  // StayUpdateReqDTO 객체를 JSON으로 변환
  Map<String, dynamic> toJson() {
    return {
      "stayImgTitle": stayImgTitle,
      "stayName": stayName,
      "stayInfo": stayInfo,
      "location": location,
      "gpslng": gpslng,
      "gpslat": gpslat,
      "notice": notice,
    };
  }
}

class SearchStayDTO {
  String? stayName;
  int? person;
  String? stayAddress;
  int? roomPrice;

  SearchStayDTO({
    this.stayName,
    this.person,
    this.stayAddress,
    this.roomPrice,
  });
}