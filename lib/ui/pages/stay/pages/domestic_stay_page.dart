import 'package:flutter/material.dart';
import 'package:yogi_project/data/dtos/book_request.dart';

class DomesticStayPage extends StatelessWidget {
  const DomesticStayPage({super.key, required List<Book> bookInKoreaList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( // 상단 앱바(페이지 제목)
          title: Text('국내숙소')
      ),
    );
  }
}

