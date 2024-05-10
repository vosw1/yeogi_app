import 'package:flutter/material.dart';
import 'package:yogi_project/_core/constants/size.dart';
import 'package:yogi_project/data/models/notification.dart';

class NotificationListItem extends StatelessWidget {
  final MyNotification notification;

  const NotificationListItem({Key? key, required this.notification}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(
              width: 1.0, // Adjust border width as needed
            ),
          ),
          child: ListTile(
            title: Text(
              '${notification.stayName} ${notification.title}',
              style: const TextStyle(
              ),
            ),
            subtitle: Text(
              '체크인 : ${notification.checkInDate}\n체크아웃 : ${notification.checkOutDate}',
              style: TextStyle(color: Colors.grey.shade700),
            ),
          ),
        ),
        SizedBox(height: gap_m), // Adjust the height as needed
      ],
    );
  }
}
