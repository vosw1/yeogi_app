import 'package:flutter/material.dart';
import 'package:yogi_project/data/dtos/book_request.dart';
import 'package:yogi_project/data/models/payment.dart';
import 'package:yogi_project/ui/pages/room/room_page.dart';

import '../../../../data/models/stay.dart';

class OverseasStayPage extends StatelessWidget {
  final List<Book> bookInAbroardList; // 예약 리스트 추가

  const OverseasStayPage({required this.bookInAbroardList});

  get roomData => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('해외숙소'),
      ),
      body: ListView.builder(
        itemCount: bookInAbroardList.length,
        itemBuilder: (context, index) {
          final book = bookInAbroardList[index];
          return ListTile(
            title: Text(book.stayName), // 숙소 이름으로 변경하거나 다른 필드로 수정
            subtitle: Text(book.roomName), // 방 이름으로 변경하거나 다른 필드로 수정
            onTap: () {
              // 예약된 숙소의 상세 정보 페이지로 이동하는 로직 추가
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RoomPage(),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
