import 'package:flutter/material.dart';

class AbroadStayPage extends StatelessWidget {
  const AbroadStayPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( // 상단 앱바(페이지 제목)
          title: Text('해외숙소')
      ),
    );
  }
}
