import 'package:flutter/material.dart';
import 'package:yogi_project/data/models/book.dart';

class BookSaveReqDTO {
  final String roomImgTitle; // 룸 이미지 제목
  final String roomName; // 룸 이름
  final String location; // 위치
  final DateTime checkInDate; // 체크인 날짜와 시간
  final DateTime checkOutDate; // 체크아웃 날짜와 시간
  final int price; // 가격
  final String bookName; // 예약자 이름
  final String bookTel; // 예약자 전화번호

  BookSaveReqDTO({
    required this.roomImgTitle,
    required this.roomName,
    required this.location,
    required this.checkInDate,
    required this.checkOutDate,
    required this.price,
    required this.bookName,
    required this.bookTel,
  });

  factory BookSaveReqDTO.fromJson(Book book) {
    return BookSaveReqDTO(
      roomImgTitle: book.roomImgTitle,
      roomName: book.roomName,
      location: book.location,
      checkInDate: book.checkInDate,
      checkOutDate: book.checkOutDate,
      price: book.price,
      bookName: book.bookName,
      bookTel: book.bookTel,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'roomImgTitle': roomImgTitle,
      'roomName': roomName,
      'location': location,
      'checkInDate': checkInDate.toIso8601String(),
      'checkOutDate': checkOutDate.toIso8601String(),
      'price': price,
      'bookName': bookName,
      'bookTel': bookTel,
    };
  }
}
