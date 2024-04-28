import 'package:flutter/material.dart';

class HomeAndBillaStayPage extends StatelessWidget {
  const HomeAndBillaStayPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( // 상단 앱바(페이지 제목)
          title: Text('홈&빌라')
      ),
    );
  }
}

