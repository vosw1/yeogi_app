import 'package:flutter/material.dart';
import '../../../../data/dtos/book_request.dart';
import '../book_list_page.dart';

class DomesticBookList extends StatelessWidget {
  final List<Book> domesticbookList;

  const DomesticBookList({Key? key, required this.domesticbookList})
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
        way: '카드결제',
        payAt: DateTime.parse('2024-04-20'), // 문자열을 DateTime으로 변환
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
        way: '카드결제',
        payAt: DateTime.parse('2024-04-20'), // 문자열을 DateTime으로 변환
      ),
    ];
    return BookListPage(bookList: domesticbookList, appBarText: '국내 예약내역');
  }
}
