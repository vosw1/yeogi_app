import 'package:flutter/material.dart';
import 'package:yogi_project/size.dart';
import '../../components/common/book_item_data.dart';

class BookInKoreaPage extends StatelessWidget {
  final BookItemData bookItemData;

  BookInKoreaPage({required this.bookItemData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('예약내역'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.asset(
                bookItemData.imagePath,
                width: 150,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: gap_s),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('숙소명: ${bookItemData.stayName}'),
                  Text('방: ${bookItemData.roomName}'),
                  Text('위치: ${bookItemData.location}'),
                  Text('체크인: ${bookItemData.checkInDate}'),
                  Text('체크아웃: ${bookItemData.checkOutDate}'),
                  Text('인원: ${bookItemData.personCount}'),
                  Text('가격: ${bookItemData.price}'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
