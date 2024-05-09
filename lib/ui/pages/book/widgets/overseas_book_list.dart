import 'package:flutter/material.dart';
import 'package:yogi_project/_core/constants/move.dart';
import 'package:yogi_project/data/models/Reservation.dart';
import 'package:yogi_project/ui/pages/book/reservation_list_page.dart';

class OverseasBookList extends StatelessWidget {
  final List<Reservation> overseasbookList;

  const OverseasBookList({Key? key, required this.overseasbookList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Reservation> overseasbookList = [
      Reservation(
        id:'4',
        roomId:'1',
        roomImgTitle: 'overseas/overseas1.png',
        roomName: 'Mountain View King',
        location: '1227 Pale San Vitores Road, Tumon, 투몬 베이, 괌, 괌, 96913',
        checkInDate: DateTime(2024, 5, 1, 18, 0),
        // 체크인 날짜와 시간
        checkOutDate: DateTime(2024, 5, 6, 12, 0),
        // 체크아웃 날짜와 시간
        price: 300000,
        reservationName: '설동훈',
        reservationTel: '010-1111-1111',
      ),
      Reservation(
        id:'2',
        roomId:'2',
        roomImgTitle: 'overseas/overseas1.png',
        roomName: 'Mountain View King',
        location: '1227 Pale San Vitores Road, Tumon, 투몬 베이, 괌, 괌, 96913',
        checkInDate: DateTime(2024, 5, 1, 18, 0),
        // 체크인 날짜와 시간
        checkOutDate: DateTime(2024, 5, 6, 12, 0),
        // 체크아웃 날짜와 시간
        price: 300000,
        reservationName: '설동훈',
        reservationTel: '010-1111-1111',
      ),
    ];
    return ReservationListPage(reservationList: overseasbookList, appBarText: '해외 예약내역', pays: pays,);
  }
}
