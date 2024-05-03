import 'package:flutter/material.dart';
import 'package:yogi_project/_core/constants/size.dart';
import 'package:yogi_project/data/models/notification.dart';

import 'notificaion_list_item.dart';

class NotificationPage extends StatelessWidget {
  final List<MyNotification> notificationList = [
    MyNotification(
      title: '예약이 완료되었습니다',
      stayName: '오늘의 숙소',
      checkInDate: '2024-05-05',
      checkOutDate: '2024-05-07',
    ),
    MyNotification(
      title: '예약이 완료되었습니다',
      stayName: '오늘의 숙소',
      checkInDate: '2024-05-05',
      checkOutDate: '2024-05-07',
    ),
    MyNotification(
      title: '예약이 완료되었습니다',
      stayName: '오늘의 숙소',
      checkInDate: '2024-05-05',
      checkOutDate: '2024-05-07',
    ),
    MyNotification(
      title: '예약이 완료되었습니다',
      stayName: '오늘의 숙소',
      checkInDate: '2024-05-05',
      checkOutDate: '2024-05-07',
    ),
    // Add more notifications if needed.
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('알림'),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(30.0),
          child: Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: gap_m),
            child: Text(
              '총 ${notificationList.length}건',
              style: TextStyle(
                fontSize: gap_m,
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(gap_m),
        child: ListView.builder(
          itemCount: notificationList.length,
          itemBuilder: (context, index) {
            return NotificationListItem(notification: notificationList[index]);
          },
        ),
      ),
    );
  }
}
