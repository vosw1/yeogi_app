import 'package:flutter/material.dart';
import 'package:yogi_project/_core/constants/size.dart';
import 'package:yogi_project/data/models/notification.dart';
import 'package:yogi_project/ui/pages/book/book_detail_page.dart';

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
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(
              color: Colors.grey[300]!, // Adjust border color as needed
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
