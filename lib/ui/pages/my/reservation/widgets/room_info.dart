import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:yogi_project/_core/constants/size.dart';
import 'package:yogi_project/_core/constants/style.dart';
import 'package:yogi_project/data/models/room.dart';

class RoomInfo extends StatelessWidget {
  final Room rooms;
  const RoomInfo({Key? key, required this.rooms}) : super(key: key);

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
              image: AssetImage("assets/images/${rooms.roomImgTitle}"),
            ),
          ),
        ),
        SizedBox(width: gap_m),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: gap_s),
              Container(
                constraints: BoxConstraints(minHeight: 40),
                child: Text(
                  '${rooms.roomName}',
                  style: h5(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text('체크인: ${rooms.checkInDate}'),
              Text('입실: ${rooms.checkInTime}'),
              Text('체크아웃: ${rooms.checkOutDate}'),
              Text('퇴실: ${rooms.checkOutTime}'),
              SizedBox(height: gap_s),
              Text('결제금액 : ${NumberFormat('#,###').format(rooms.price)} 원'),
            ],
          ),
        ),
      ],
    );
  }
}
