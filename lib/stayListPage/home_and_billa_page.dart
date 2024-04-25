import 'package:flutter/material.dart';

class HomeAndBillaPage extends StatelessWidget {
  const HomeAndBillaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( // 상단 앱바(페이지 제목)
          title: Text('홈&빌라')
      ),
    );
  }
}

