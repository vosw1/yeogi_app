import 'package:flutter/material.dart';
import 'package:yogi_project/reservation/reservation_check/book_in_abroad_page.dart';
import 'package:yogi_project/reservation/reservation_check/book_in_korea_page.dart';

import '../components/common/book_item_data.dart';

class MyPageBookMenuHolder extends StatelessWidget {
  const MyPageBookMenuHolder({Key? key});

  @override
  Widget build(BuildContext context) {
    // Sample book item data
    final bookItemData = BookItemData(
      imagePath: "assets/images/p1.png",
      imgTitle: "p1",
      stayName: "오늘의 숙소",
      roomName: "트윈룸",
      location: "서울시 어딘가",
      checkInDate: "2024.4.30",
      checkOutDate: "2024.5.2",
      personCount: "2명",
      price: "50,000원",
    );

    return Column(
      children: <Widget>[
        ListTile(
          title: Text('예약내역', style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        ListTile(
          title: Text('국내숙소'),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {
            // Navigate to the BookInKoreaPage and pass the bookItemData
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BookInKoreaPage(bookItemData: bookItemData),
              ),
            );
          },
        ),
        ListTile(
          title: Text('해외숙소'),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {
            // Navigate to the BookInAbroadPage
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => BookInAbroadPage()),
            );
          },
        ),
      ],
    );
  }
}
