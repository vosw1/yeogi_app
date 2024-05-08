import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:yogi_project/_core/constants/move.dart';
import 'package:yogi_project/_core/constants/size.dart';
import 'package:yogi_project/_core/constants/style.dart';
import 'package:yogi_project/data/models/book.dart';
import 'package:yogi_project/data/models/payment.dart';
import 'book_detail_page.dart';

class BookListPage extends StatelessWidget {
  final List<Book> bookList;
  final String appBarText;
  final Payment payData;

  const BookListPage({
    Key? key,
    required this.bookList,
    required this.appBarText,
    required this.payData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarText),
      ),
      body: ListView.builder(
        itemCount: bookList.length,
        itemBuilder: (context, index) {
          final book = bookList[index];

          // Calculate the duration of stay
          final checkIn = book.checkInDate;
          final checkOut = book.checkOutDate;
          final duration = checkOut.difference(checkIn);
          final numberOfNights = duration.inDays;

          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BookDetailPage(bookData: book, roomData: roomData, payData: payData,),
                ),
              );
            },
            child: Container(
              padding: const EdgeInsets.only(top: gap_m, left: gap_m, right: gap_m),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      "assets/images/${book.roomImgTitle}",
                      width: 120,
                      height: 120,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: gap_s),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          book.stayName,
                          style: h6(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: gap_xs),
                        Text(
                          book.location,
                          style: subtitle1(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: gap_xs),
                        Text(
                          '${DateFormat('yyyy-MM-dd HH:mm').format(checkIn)} | ${DateFormat('yyyy-MM-dd HH:mm').format(checkOut)}',
                          style: TextStyle(fontSize: gap_s),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: gap_xs),
                        Text('${numberOfNights} 박 ${numberOfNights + 1} 일',
                            style: TextStyle(fontSize: gap_s)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
