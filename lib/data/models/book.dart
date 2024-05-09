import 'package:flutter/material.dart';

class Reservation {
  final String reservationName; // 예약자 대표 이름
  final String reservationTel; // 예약자 대표 연락처
  final DateTime checkInDate; // 입실 날짜
  final DateTime checkOutDate; // 퇴실 날짜
  final String roomId; // 예약한 객실 번호
  final String location; // 위치
  final String roomName; // 룸 이름
  final String roomImgTitle; // 룸 이미지 제목
  final int price; // 가격

  Reservation({
    required this.reservationName,
    required this.reservationTel,
    required this.checkInDate,
    required this.checkOutDate,
    required this.roomId,
    required this.location,
    required this.roomName,
    required this.roomImgTitle,
    required this.price,
  });

  factory Reservation.fromJson(Map<String, dynamic> json) {
    return Reservation(
      reservationName: json['reservationName'],
      reservationTel: json['reservationTel'],
      checkInDate: DateTime.parse(json['checkInDate']),
      checkOutDate: DateTime.parse(json['checkOutDate']),
      roomId: json['roomId'],
      location: json['location'],
      roomName: json['roomName'],
      roomImgTitle: json['roomImgTitle'],
      price: json['price'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'reservationName': reservationName,
      'reservationTel': reservationTel,
      'checkInDate': checkInDate.toIso8601String(),
      'checkOutDate': checkOutDate.toIso8601String(),
      'roomId': roomId,
      'location': location,
      'roomName': roomName,
      'roomImgTitle': roomImgTitle,
      'price': price,
    };
  }
}
