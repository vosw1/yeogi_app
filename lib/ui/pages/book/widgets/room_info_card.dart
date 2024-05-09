import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:yogi_project/_core/constants/size.dart';
import 'package:yogi_project/_core/constants/style.dart';
import 'package:yogi_project/data/models/room.dart';

class RoomInfoCard extends StatelessWidget {
  final Room rooms;
  RoomInfoCard({required this.rooms});

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
          child: RoomDetails(room: rooms),
        ),
      ],
    );
  }
}

class RoomDetails extends StatelessWidget {
  final Room room;
  RoomDetails({required this.room});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: gap_s),
        Container(
          constraints: BoxConstraints(minHeight: 40),
          child: Text(
            '${room.roomName}',
            style: h5(),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Text('체크인: ${room.checkInDate}'),
        Text('입실: ${room.checkInTime}'),
        Text('체크아웃: ${room.checkOutDate}'),
        Text('퇴실: ${room.checkOutTime}'),
        SizedBox(height: gap_s),
        Text('결제금액 : ${NumberFormat('#,###').format(room.price)} 원'),
      ],
    );
  }
}
