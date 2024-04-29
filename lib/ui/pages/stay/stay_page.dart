import 'package:flutter/material.dart';
import 'package:yogi_project/ui/pages/room/room_page.dart';
import 'package:yogi_project/_core/constants/size.dart';
import 'package:yogi_project/_core/constants/style.dart';
import '../../../_core/constants/move.dart';
import '../../../data/models/stay.dart';

class StayPage extends StatelessWidget {
  final Stay stayData;

  const StayPage({required this.stayData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${stayData.stayName}',
          style: h5(),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(gap_m),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 600,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(gap_s),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(gap_s),
                child: Image.asset(
                  'assets/images/${stayData.stayImgTitle}',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // 숙소 이미지
            SizedBox(height: gap_m),
            Text('${stayData.location}', style: subtitle1()), // 위치
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RoomPage(roomData: roomData),
                  ),
                );
              },
              child: Text('상세보기'),
            ),
          ],
        ),
      ),
    );
  }
}
