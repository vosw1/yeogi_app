import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:yogi_project/_core/constants/size.dart';
import 'package:yogi_project/_core/constants/style.dart';
import 'package:yogi_project/data/models/room.dart';
import 'package:yogi_project/ui/pages/room/room_detail_page.dart';

class RoomInfoWidget extends StatelessWidget {
  final Room roomData;
  final int roomId;

  const RoomInfoWidget({required this.roomData, required this.roomId});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // RoomDetailPage로 이동하는 라우트 로직
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RoomDetailPage(rooms: roomData),
          ),
        );
      },
      child: Container(
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
                width: 180,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(gap_s),
                  image: DecorationImage(
                    image: AssetImage('assets${roomData.roomImagePath}'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 38), // 이미지와 텍스트 사이 간격 조절
              // 중간에 객실 정보 표시
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: gap_xx),
                    // 객실 이름 표시
                    Text(
                      roomData.roomName,
                      style: h5(),
                    ),
                    SizedBox(height: gap_xx),
                    // 입실 및 퇴실 정보 표시
                    Text(
                      '입실 : ${roomData.checkInTime}',
                      style: TextStyle(
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                    Text(
                      '퇴실 : ${roomData.checkOutTime}',
                      style: TextStyle(
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                    SizedBox(height: gap_xx),
                    // 가격 표시
                    Text(
                      '${NumberFormat('#,###').format(roomData.roomPrice)} 원',
                      style: TextStyle(
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.bold,
                        fontSize: 19,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: gap_s), // 텍스트와 우측 여백
            ],
          ),
        ),
      ),
    );
  }
}
