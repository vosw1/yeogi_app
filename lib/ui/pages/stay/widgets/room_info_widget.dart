import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:yogi_project/_core/constants/size.dart';
import 'package:yogi_project/_core/constants/style.dart';
import 'package:yogi_project/data/models/room.dart';
import 'package:yogi_project/ui/pages/room/room_detail_page.dart';

class RoomInfoWidget extends StatelessWidget {
  final Room roomData;

  const RoomInfoWidget({required this.roomData});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(gap_s),
        border: Border.all(
          color: Colors.grey[300]!,
          width: 1,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(gap_s),
        child: Row(
          children: [
            // 왼쪽에 이미지
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(gap_s),
                image: DecorationImage(
                  image: AssetImage('assets/images/${roomData.roomImgTitle}'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: gap_s), // 이미지와 텍스트 사이 간격 조절
            // 중간에 객실 정보 표시
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 객실 이름 표시
                  Text(
                    roomData.roomName,
                    style: subtitle1(),
                  ),
                  SizedBox(height: gap_s),
                  // 입실 및 퇴실 정보 표시
                  Text(
                    '입실: ${roomData.checkInTime}',
                    style: subtitle2().copyWith(color: Colors.black),
                  ),
                  Text(
                    '퇴실: ${roomData.checkOutTime}',
                    style: subtitle2().copyWith(color: Colors.black),
                  ),
                  SizedBox(height: gap_s),
                  // 가격 표시
                  Text(
                    '${NumberFormat('#,###').format(roomData.price)}원',
                    style: subtitle1().copyWith(color: Colors.grey),
                  ),
                ],
              ),
            ),
            SizedBox(width: gap_s), // 텍스트와 버튼 사이 간격 조절
            // 오른쪽에 상세보기 버튼
            SizedBox(
              width: 70, // 버튼의 너비를 설정하여 텍스트가 한 줄로 표시되도록 함
              child: ElevatedButton(
                onPressed: () {
                  // 상세보기 페이지로 이동
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RoomDetailPage(roomData: roomData),
                    ),
                  );
                },
                child: Text('상세보기', style: subtitle2(mColor: Colors.white)),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero, // 버튼 내부의 패딩 제거
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20), // 버튼의 모양을 더 둥글게 만듦
                  ),
                  backgroundColor: Colors.redAccent,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
