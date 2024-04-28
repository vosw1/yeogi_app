import 'package:flutter/material.dart';
import 'package:yogi_project/data/models/room.dart';
import 'package:yogi_project/ui/pages/book/book_page.dart';
import '../../../_core/constants/move.dart';
import '../../../_core/constants/size.dart';
import '../../../_core/constants/style.dart';
import '../../../data/models/stay.dart';

class RoomPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('룸 상세 페이지'),
      ),
      body: Padding(
        padding: EdgeInsets.all(gap_m),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${roomData.roomName}', style: h5()),
            // 숙소명
            SizedBox(
              width: 600,
              height: 200,
              child: Image.asset('assets/images/${roomData.roomImgTitle}'),
            ),
            // 숙소 이미지
            SizedBox(height: gap_m),

            Text('${stayData.location}', style: subtitle1()),
            // 위치
            Text('${roomData.roomName}', style: subtitle1()),
            // 방이름
            Text('${roomData.personCount}', style: subtitle1()),
            // 인원수
            Text('${roomData.price}', style: subtitle1()),
            // 금액
            Text('${roomData.checkInDate}', style: subtitle1()),
            // 체크인 시간
            Text('${roomData.checkOutDate}', style: subtitle1()),
            // 편의시설
            Text('${roomData.cancellationAndRefundPolicy}', style: subtitle1()),
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
                          BookPage(roomData: widget.roomData), // Pass roomData
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
