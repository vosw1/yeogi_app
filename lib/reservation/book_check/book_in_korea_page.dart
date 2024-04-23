import 'package:flutter/material.dart';
import 'package:yogi_project/size.dart';
import 'package:yogi_project/style.dart';
import '../../components/common/book_item_data.dart';

class BookInKoreaPage extends StatelessWidget {
  final List<BookItemData> bookInKoreaList; // 전체 목록을 받도록 수정

  BookInKoreaPage({required this.bookInKoreaList}); // 생성자 수정

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('국내 예약내역'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(gap_m),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("이용 ${bookInKoreaList.length}건", style: h6()), // 예약 데이터는 하나씩만 전달되므로 일단 "이용 1건"으로 고정
            SizedBox(height: gap_s),
            Divider(),
            // 각 예약 데이터 항목에 대한 UI를 반복하여 빌드합니다.
            for (var bookItemData in bookInKoreaList)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
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
                      SizedBox(width: gap_s), // Divider between image and text
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: gap_m),
                            Text('${bookItemData.stayName}', style: h4()),
                            Text('${bookItemData.roomName}  |  ${bookItemData.location}', style: subtitle2(mColor: Colors.grey)),
                            SizedBox(height: gap_m),
                            Text('체크인 ${bookItemData.checkInDate}  |  체크아웃 ${bookItemData.checkOutDate}', style: overLine()),
                            SizedBox(height: gap_xx),
                            Text('인원 ${bookItemData.personCount}  |  가격 ${bookItemData.price}', style: overLine()),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Divider(), // Divider between items
                ],
              ),
          ],
        ),
      ),
    );
  }
}
