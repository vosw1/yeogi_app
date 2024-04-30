import 'package:flutter/material.dart';
import 'package:yogi_project/data/models/room.dart';
import 'package:yogi_project/ui/pages/book/book_page.dart';
import '../../../_core/constants/size.dart';
import '../../../_core/constants/style.dart';

class RoomPage extends StatelessWidget {
  final Room roomData; // Add stayData property

  const RoomPage(
      {required this.roomData}); // Modify constructor to include stayData

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${roomData.roomName}',
          style: h5(),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(gap_m),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 600,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(gap_s),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(gap_s),
                child: Image.asset(
                  'assets/images/${roomData.roomImgTitle}',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // 숙소 이미지
            SizedBox(height: gap_m),
            Text('${roomData.roomName}', style: subtitle1()), // 방이름
            Text('${roomData.price}', style: subtitle1()), // 금액
            Text('${roomData.checkInDate}', style: subtitle1()), // 체크인 날짜
            Text('${roomData.checkOutDate}', style: subtitle1()), // 체크아웃 날짜
            Text('${roomData.checkInTime}', style: subtitle1()), // 체크인 시간
            Text('${roomData.checkOutTime}', style: subtitle1()), // 체크아웃 시간
            Text('${roomData.cancellationAndRefundPolicy}', style: subtitle1()), // 환불 정책
            SizedBox(height: gap_m),
            // 예약하기 버튼 위 여백
            SizedBox(
              // 예약하기 버튼
              width: double.infinity, // 가로로 꽉 채우도록 설정
              child: ElevatedButton(
                onPressed: () {
                  var widget;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          BookPage(roomData: roomData), // Pass roomData
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.redAccent, // 글자색을 흰색으로 설정
                ),
                child: Text('예약하기'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
