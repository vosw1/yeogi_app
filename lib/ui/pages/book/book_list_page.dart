import 'package:flutter/material.dart';
import 'package:yogi_project/_core/constants/style.dart';

import '../../../data/dtos/book_request.dart';
import 'book_detail_page.dart';

class BookListPage extends StatelessWidget {
  final List<Book> bookList;
  final String appBarText;

  const BookListPage({
    Key? key,
    required this.bookList,
    required this.appBarText,
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
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BookDetailPage(book: book),
                ),
              );
            },
            child: Container(
              padding: EdgeInsets.all(8.0),
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
                  SizedBox(width: 16.0),
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
                        SizedBox(height: 8.0),
                        Text(
                          book.location,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 8.0),
                        // Text(
                        //   book.checkInDate,
                        //   maxLines: 1,
                        //   overflow: TextOverflow.ellipsis,
                        // ),
                        // SizedBox(height: 8.0),
                        // Text(
                        //   book.checkOutDate,
                        //   maxLines: 1,
                        //   overflow: TextOverflow.ellipsis,
                        // ),
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
