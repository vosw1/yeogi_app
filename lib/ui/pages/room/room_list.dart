import 'package:flutter/material.dart';
import 'package:yogi_project/_core/constants/size.dart';
import 'package:yogi_project/data/models/room.dart';
import 'package:yogi_project/ui/pages/room/room_detail_page.dart';
import 'package:yogi_project/ui/pages/room/room_list_page.dart';

import '../../../_core/constants/style.dart';

class ConcreteRoomListPage extends RoomListPage {
  ConcreteRoomListPage({Key? key, required String appBarTitle}) : super(key: key, appBarTitle: appBarTitle);

  @override
  Widget build(BuildContext context) {
    List<Room> roomDataList = [
      Room(
        roomName: '마운틴 패밀리 스위트',
        roomImgTitle: 'hotel/hotel1.png',
        price: 100000,
        checkInDate: '2024-04-30',
        checkOutDate: '2024-05-01',
        checkInTime: '',
        checkOutTime: "",
        roomInfo: '',
        amenities: '',
        notice: '',
      ),
      // Add more Room objects here as needed
    ];

    return Container( // Wrap with a Container
      height: 500, // Set a fixed height or adjust as needed
      child: ListView.builder(
        itemCount: roomDataList.length,
        itemBuilder: (context, index) {
          final Room room = roomDataList[index];
          return buildListItem(context, room);
        },
      ),
    );
  }


  @override
  Widget buildListItem(BuildContext context, Room room) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0), // Adjust padding as needed
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RoomDetailPage(roomData: room),
            ),
          );
        },
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0), // Adjust border radius as needed
                  border: Border.all(
                    color: Colors.grey[300]!,
                    width: 1,
                  ),
                  image: DecorationImage(
                    image: AssetImage("assets/images/${room.roomImgTitle}"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(width: 8.0), // Adjust spacing as needed
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    room.roomName,
                    style: h5(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4.0),
                  // Add more room details if needed
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  List<Room> getRoomDataList() {
    // TODO: implement getRoomDataList
    throw UnimplementedError();
  }
}
