import 'package:flutter/material.dart';

class ReservationSaveReqDTO {
  final int roomId; // 룸 ID
  final String roomImgTitle; // 룸 이미지 제목
  final String roomName; // 룸 이름
  final String stayAdress; // 위치
  final DateTime checkInDate; // 체크인 날짜와 시간
  final DateTime checkOutDate; // 체크아웃 날짜와 시간
  final int price; // 가격
  final int reservationId;
  final String reservationName; // 예약자 이름
  final String reservationTel; // 예약자 전화번호
  final String reservedDates; // 예약자 전화번호

  ReservationSaveReqDTO({
    required this.roomId,
    required this.roomImgTitle,
    required this.roomName,
    required this.stayAdress,
    required this.checkInDate,
    required this.checkOutDate,
    required this.price,
    required this.reservationId,
    required this.reservationName,
    required this.reservationTel,
    required this.reservedDates,
  });

  factory ReservationSaveReqDTO.fromJson(Map<String, dynamic> json) {
    return ReservationSaveReqDTO(
      roomId: json['roomId'],
      roomImgTitle: json['roomImgTitle'],
      roomName: json['roomName'],
      stayAdress: json['stayAdress'],
      checkInDate: DateTime.parse(json['checkInDate']),
      checkOutDate: DateTime.parse(json['checkOutDate']),
      price: json['price'],
      reservationId: json['reservationId'],
      reservationName: json['reservationName'],
      reservationTel: json['reservationTel'],
      reservedDates: json['reservedDates'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'roomId': roomId,
      'roomImgTitle': roomImgTitle,
      'roomName': roomName,
      'stayAdress': stayAdress,
      // 날짜 데이터를 UTC로 변환하여 ISO8601 문자열 포맷으로 저장
      'checkInDate': checkInDate.toUtc().toIso8601String(),
      'checkOutDate': checkOutDate.toUtc().toIso8601String(),
      'price': price,
      'reservationId': reservationId ?? '',
      'reservationName': reservationName,
      'reservationTel': reservationTel,
      'reservedDates': reservedDates,
    };
  }
}
