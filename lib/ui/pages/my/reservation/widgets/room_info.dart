import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:yogi_project/_core/constants/size.dart';
import 'package:yogi_project/_core/constants/style.dart';
import 'package:yogi_project/data/models/room.dart';

class RoomInfo extends StatelessWidget {
  final Room rooms;
  final int numberOfNights;
  final DateTime selectedStartDate;
  final DateTime selectedEndDate;

  const RoomInfo(
      {Key? key,
        required this.rooms,
        required this.numberOfNights,
        required this.selectedStartDate,
        required this.selectedEndDate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("assets${rooms.roomImagePath}"),
            ),
          ),
        ),
        SizedBox(width: gap_m),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: gap_xx),
              Container(
                constraints: BoxConstraints(minHeight: 40),
                child: Text(
                  '${rooms.roomName}',
                  style: h5(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                '체크인: ${formatDate(selectedStartDate)}',
                style: TextStyle(
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              Text(
                '입실: ${formatTime(rooms.checkInTime)}',
                style: TextStyle(
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              Text(
                '체크아웃: ${formatDate(selectedEndDate)}',
                style: TextStyle(
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              Text(
                '퇴실: ${formatTime(rooms.checkOutTime)}',
                style: TextStyle(
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              SizedBox(height: gap_s),
                Text(
                  '결제금액 : ${NumberFormat('#,###').format(rooms.roomPrice * numberOfNights)} 원',
                  style: h6(),
                ),
            ],
          ),
        ),
      ],
    );
  }

  String formatDate(DateTime dateTime) {
    return '${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}';
  }

  String formatTime(String time) {
    try {
      // 다양한 시간 형식 처리
      if (time.length == 5 && time[2] == ':') {
        // 이미 "HH:mm" 형식인 경우
        return time;
      } else if (time.length == 4) {
        // "HHmm" 형식인 경우
        return '${time.substring(0, 2)}:${time.substring(2, 4)}';
      } else if (time.length == 8 && time[2] == ':' && time[5] == ':') {
        // "HH:mm:ss" 형식인 경우
        DateTime parsedTime = DateFormat('HH:mm:ss').parse(time);
        return DateFormat('HH:mm').format(parsedTime);
      } else {
        // 예상치 못한 형식일 경우 기본값 반환
        return '00:00';
      }
    } catch (e) {
      // 예외 발생 시 기본값 반환
      return '00:00';
    }
  }
}
