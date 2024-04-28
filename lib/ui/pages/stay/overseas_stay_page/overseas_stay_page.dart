import 'package:flutter/material.dart';
import 'package:yogi_project/data/dtos/book_request.dart';

class OverseasStayPage extends StatelessWidget {
  const OverseasStayPage({super.key, required List<Book> bookInAbroardList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( // 상단 앱바(페이지 제목)
          title: Text('해외숙소')
      ),
    );
  }
}
