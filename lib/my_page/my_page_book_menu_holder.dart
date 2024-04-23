import 'package:flutter/material.dart';
import 'package:yogi_project/reservation/reservation_check/reservation_in_abroad_page.dart';
import 'package:yogi_project/reservation/reservation_check/reservation_in_korea_page.dart';
import 'package:yogi_project/size.dart';

class MyPageBookMenuHolder extends StatelessWidget {
  const MyPageBookMenuHolder({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: Text('예약내역', style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        ListTile(
          title: Text('국내숙소'),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {
            // 국내숙소 페이지로 이동
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ReservationInKoreaPage(reservationItemsData: [],)),
            );
          },
        ),
        ListTile(
          title: Text('해외숙소'),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {
            //해외숙소 페이지로 이동
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ReservationInAbroadPage()),
            );
          },
        ),
      ],
    );
  }
}