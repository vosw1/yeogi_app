import 'package:flutter/material.dart';

class GuesthousePage extends StatelessWidget {
  const GuesthousePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( // 상단 앱바(페이지 제목)
          title: Text('게스트하우스')
      ),
    );
  }
}

