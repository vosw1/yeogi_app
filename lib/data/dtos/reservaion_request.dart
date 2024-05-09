import 'package:flutter/material.dart';

class ReservationSaveReqDTO {
  final String roomId; // 룸 ID
  final String roomImgTitle; // 룸 이미지 제목
  final String roomName; // 룸 이름
  final String location; // 위치
  final DateTime checkInDate; // 체크인 날짜와 시간
  final DateTime checkOutDate; // 체크아웃 날짜와 시간
  final int price; // 가격
  final String reservationName; // 예약자 이름
  final String reservationTel; // 예약자 전화번호

  ReservationSaveReqDTO({
    required this.roomId,
    required this.roomImgTitle,
    required this.roomName,
    required this.location,
    required this.checkInDate,
    required this.checkOutDate,
    required this.price,
    required this.reservationName,
    required this.reservationTel,
  });

  factory ReservationSaveReqDTO.fromJson(Map<String, dynamic> json) {
    return ReservationSaveReqDTO(
      roomId: json['roomId'],
      roomImgTitle: json['roomImgTitle'],
      roomName: json['roomName'],
      location: json['location'],
      checkInDate: DateTime.parse(json['checkInDate']),
      checkOutDate: DateTime.parse(json['checkOutDate']),
      price: json['price'],
      reservationName: json['reservationName'],
      reservationTel: json['reservationTel'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'roomId': roomId,
      'roomImgTitle': roomImgTitle,
      'roomName': roomName,
      'location': location,
      'checkInDate': checkInDate.toIso8601String(),
      'checkOutDate': checkOutDate.toIso8601String(),
      'price': price,
      'reservationName': reservationName,
      'reservationTel': reservationTel,
    };
  }
}
