import 'package:flutter/material.dart';
import 'package:yogi_project/_core/constants/size.dart';
import 'package:yogi_project/_core/constants/style.dart';
import 'package:yogi_project/data/models/room.dart';
import 'package:yogi_project/ui/pages/room/room_detail_page.dart';

class ConcreteRoomListPage extends StatelessWidget {
  final List<Room> roomDataList;
  final String appBarTitle;

  ConcreteRoomListPage({required this.roomDataList, required this.appBarTitle});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: roomDataList.length,
      itemBuilder: (context, index) {
        final Room room = roomDataList[index];
        return _buildRoomItem(context, room);
      },
    );
  }

  Widget _buildRoomItem(BuildContext context, Room room) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: gap_s),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(gap_s),
          border: Border.all(
            color: Colors.grey[300]!,
            width: 1,
          ),
        ),
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
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(gap_s),
                      bottomLeft: Radius.circular(gap_s),
                    ),
                    image: DecorationImage(
                      image: AssetImage("assets/images/${room.roomImgTitle}"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(width: gap_s),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      room.roomName,
                      style: h6(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: gap_xs),
                    Text(
                      '가격: \$${room.price.toString()}',
                      style: body1(),
                    ),
                    SizedBox(height: gap_xs),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RoomDetailPage(roomData: room),
                          ),
                        );
                      },
                      child: Text('상세보기'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
