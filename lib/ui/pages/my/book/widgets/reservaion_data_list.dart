import 'package:flutter/material.dart';
import 'package:yogi_project/_core/constants/move.dart';
import 'package:yogi_project/data/models/reservation.dart';
import 'package:yogi_project/ui/pages/my/book/reservation_list.dart';

class ReservationDataList extends StatelessWidget {
  final List<Reservation> domesticbookList;

  const ReservationDataList({Key? key, required this.domesticbookList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Reservation> reservationList = [
      Reservation(
        userId: '1',
        reservationId:'1',
        roomId:'1',
        roomImgTitle: 'hotel/hotel4.png',
        roomName: '디럭스 더블 (레이크뷰)',
        stayAddress: '강원 강릉시 강문동 258-4',
        checkInDate: DateTime(2024, 5, 1, 18, 0), // 체크인 날짜와 시간
        checkOutDate: DateTime(2024, 5, 6, 12, 0), // 체크아웃 날짜와 시간
        price: 300000,
        reservationName: '설동훈',
        reservationTel: '010-1111-1111',
          createdAt:DateTime.parse("2024-06-16")
      ),
      Reservation(
        userId: '1',
        reservationId:'3',
        roomId:'2',
        roomImgTitle: 'hotel/hotel4.png',
        roomName: '디럭스 더블 (레이크뷰)',
        stayAddress: '강원 강릉시 강문동 258-4',
        checkInDate: DateTime(2024, 5, 1, 18, 0), // 체크인 날짜와 시간
        checkOutDate: DateTime(2024, 5, 6, 12, 0), // 체크아웃 날짜와 시간
        price: 300000,
        reservationName: '설동훈',
        reservationTel: '010-1111-1111',
          createdAt:DateTime.parse("2024-06-16")
      ),
    ];
    return ReservationList(reservationList: []);
  }
}
