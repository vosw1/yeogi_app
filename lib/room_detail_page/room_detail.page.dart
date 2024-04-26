import 'package:flutter/material.dart';
import 'package:yogi_project/book_page/book_page.dart';
import 'package:yogi_project/room_detail_page/room_detail_appbar.dart';
import 'package:yogi_project/components/data/home_item_data.dart';
import 'package:yogi_project/stayListPage/stay_detail_page.dart';

import '../size.dart';
import '../style.dart'; // StayDetailPage를 import해야 합니다.

class RoomDetailPage extends StatelessWidget {
  final ItemData itemData;

  const RoomDetailPage({Key? key, required this.itemData}) : super(key: key);

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
            Text('${itemData.stayName}', style: h5()), // 숙소명
            SizedBox(
                width:600,
                height:200,
                child: Image.asset('assets/images/${itemData.stayImgTitle}')), // 숙소 이미지
            SizedBox(height: gap_m),

            Text('${itemData.location}', style: subtitle1()), // 위치
            Text('${itemData.roomName}', style: subtitle1()), // 방이름
            Text('${itemData.stayInfo}', style: subtitle1()), // 특이사항
            Text('${itemData.personCount}', style: subtitle1()), // 인원수
            Text('${itemData.price}', style: subtitle1()), // 금액
            Text('${itemData.checkInDate}', style: subtitle1()), // 체크인 시간
            Text('${itemData.checkOutDate}', style: subtitle1()), // 체크아웃 시간
            Text('${itemData.roomInfo}', style: subtitle1()), // 추가정보
            Text('${itemData.amenities}', style: subtitle1()), // 편의시설
            Text('${itemData.cancellationAndRefundPolicy}', style: subtitle1()), // 취소 및 환불 정책
            Text('${itemData.notice}', style: subtitle1()), // 여어떻노 공지
            SizedBox(height: gap_m), // 예약하기 버튼 위 여백
            SizedBox( // 예약하기 버튼
              width: double.infinity, // 가로로 꽉 채우도록 설정
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BookPage(itemData: itemData),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.redAccent, // 글자색을 흰색으로 설정
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
