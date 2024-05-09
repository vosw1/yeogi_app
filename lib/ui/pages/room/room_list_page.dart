import 'package:flutter/material.dart';
import 'package:yogi_project/data/models/room.dart';
import 'package:yogi_project/ui/pages/room/room_detail_page.dart';
import 'package:yogi_project/_core/constants/size.dart';
import 'package:yogi_project/_core/constants/style.dart';

abstract class RoomListPage extends StatelessWidget {
  const RoomListPage({Key? key, required this.appBarTitle}) : super(key: key);

  final String appBarTitle;
  List<Room> getRoomDataList();

  Widget buildListItem(BuildContext context, Room room) {
    return Padding(
      padding: const EdgeInsets.only(top: gap_m, left: gap_m, right: gap_m),
      child: Row(
        children: [
          SizedBox(height: gap_xs),
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RoomDetailPage(roomData: room),
                  ),
                );
              },
              child: Container(
                height: 120, // 사진의 높이
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage("assets/images/${room.roomImgTitle}"), // 이미지 경로
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 8), // 사진과 텍스트 사이 간격
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity, // 화면 너비에 맞추기 위해 사용
                  child: Text(
                    room.roomName,
                    style: h5(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(height: 4), // 텍스트 사이 간격
                if (room.specialPrice != null && room.specialPrice! < room.price) // 할인된 가격이 있고, 기존 가격보다 작을 경우에만 표시
                  Row(
                    children: [
                      Text(
                        '\$${room.price.toStringAsFixed(2)}', // 기존 가격
                        style: TextStyle(decoration: TextDecoration.lineThrough),
                      ),
                      SizedBox(width: 4),
                      Text(
                        '\$${room.specialPrice!.toStringAsFixed(2)}', // 할인된 가격
                        style: TextStyle(color: Colors.red),
                      ),
                    ],
                  ),
                if (room.specialPrice == null || room.specialPrice! >= room.price) // 할인된 가격이 없거나 기존 가격과 동일한 경우에만 기존 가격만 표시
                  Text(
                    '\$${room.price.toStringAsFixed(2)}',
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Room> roomDataList = getRoomDataList();

    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: gap_m),
        child: ListView.builder(
          itemCount: roomDataList.length,
          itemBuilder: (context, index) {
            final Room room = roomDataList[index];
            return buildListItem(context, room);
          },
        ),
      ),
    );
  }
}
