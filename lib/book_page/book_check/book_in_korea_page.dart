import 'package:flutter/material.dart';
import 'package:yogi_project/size.dart';
import 'package:yogi_project/style.dart';
import '../../components/data/book_item_data.dart';

class BookInKoreaPage extends StatelessWidget {
  final List<BookItemData> bookInKoreaList;

  BookInKoreaPage({required this.bookInKoreaList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( // 상단 앱바(페이지 제목)
        title: Text('국내 예약내역'),
      ),
      body: Padding( // 이용 내역
        padding: const EdgeInsets.all(gap_m),
        child: ListView( // Wrap the Column with a ListView
          children: [
            Column( // 예약 내역
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("이용 ${bookInKoreaList.length}건", style: h6()),
                SizedBox(height: gap_s),
                Divider(),
                // Display reservation items using ListView.builder
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: bookInKoreaList.length,
                  itemBuilder: (context, index) {
                    final bookItemData = bookInKoreaList[index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect( // 예약 이미지
                              borderRadius: BorderRadius.circular(12.0),
                              child: Image.asset(
                                "assets/images/${bookItemData.stayImgTitle}",
                                width: 150,
                                height: 150,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(width: gap_s),
                            Expanded( // 예약 정보
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
                        Divider(),
                      ],
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
