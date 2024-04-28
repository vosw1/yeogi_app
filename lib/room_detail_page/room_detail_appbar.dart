import 'package:flutter/material.dart';
import 'package:yogi_project/data/models/room.dart';
import 'package:yogi_project/ui/pages/book/book_page.dart';
import '../_core/constants/size.dart';

class RoomDetailPage extends StatelessWidget {
  final Room itemData;

  const RoomDetailPage({Key? key, required this.itemData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RoomDetailAppBar(), // Using custom RoomDetailAppBar widget
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('숙소명: ${itemData.stayName}'), // 숙소명
            Text('이미지: ${itemData.stayImgTitle}'), // 숙소 이미지
            Text('위치: ${itemData.location}'), // 위치
            Text('방 이름: ${itemData.roomName}'), // 방이름
            Text('특이사항: ${itemData.stayInfo}'), // 특이사항
            Text('인원수: ${itemData.personCount}'), // 인원수
            Text('가격: ${itemData.price}'), // 금액
            Text('체크인 시간: ${itemData.checkInDate}'), // 체크인 시간
            Text('체크아웃 시간: ${itemData.checkOutDate}'), // 체크아웃 시간
            Text('추가 정보: ${itemData.roomInfo}'), // 추가정보
            Text('편의 시설: ${itemData.amenities}'), // 편의시설
            Text('취소 및 환불 정책: ${itemData.cancellationAndRefundPolicy}'), // 취소 및 환불 정책
            Text('공지: ${itemData.notice}'), // 여어떻노 공지
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BookPage(itemData: itemData)),
                );
              },

              child: Text('예약하기'),
            ),
          ],
        ),
      ),
    );
  }
}

class RoomDetailAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        "여어떻노.",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Colors.redAccent,
          fontFamily: 'Jalnan2TTF',
        ),
      ),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {
            // Implement notification icon action
          },
          icon: Icon(
            Icons.notifications,
            color: Colors.grey,
          ),
        ),
        SizedBox(width: gap_m),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
