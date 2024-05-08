import 'package:flutter/material.dart';
import 'package:yogi_project/_core/constants/move.dart';
import 'package:yogi_project/data/dtos/book_request.dart';
import 'package:yogi_project/data/models/book.dart';
import 'package:yogi_project/ui/pages/book/book_list_page.dart';

class BookList extends StatelessWidget {
  final List<Book> domesticbookList;

  const BookList({Key? key, required this.domesticbookList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Book> domesticbookList = [
      Book(
        stayName: '스카이베이호텔 경포',
        roomImgTitle: 'hotel/hotel4.png',
        roomName: '디럭스 더블 (레이크뷰)',
        location: '강원 강릉시 강문동 258-4',
        checkInDate: DateTime(2024, 5, 1, 18, 0), // 체크인 날짜와 시간
        checkOutDate: DateTime(2024, 5, 6, 12, 0), // 체크아웃 날짜와 시간
        price: 300000,
        bookName: '설동훈',
        bookTel: '010-1234-5678',
      ),
      Book(
        stayName: '스카이베이호텔 경포',
        roomImgTitle: 'hotel/hotel4.png',
        roomName: '디럭스 더블 (레이크뷰)',
        location: '강원 강릉시 강문동 258-4',
        checkInDate: DateTime(2024, 5, 1, 18, 0), // 체크인 날짜와 시간
        checkOutDate: DateTime(2024, 5, 6, 12, 0), // 체크아웃 날짜와 시간
        price: 300000,
        bookName: '설동훈',
        bookTel: '010-1234-5678',
      ),
    ];
    return BookListPage(bookList: domesticbookList, appBarText: '예약내역', payData: payData);
  }
}
