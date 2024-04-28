// 홈페이지 상단 앱바에 아이콘 + text 세트 기본 틀
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeHeaderItems extends StatelessWidget {
  final IconData iconData;
  final String text;

  const HomeHeaderItems({
    required this.iconData,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 48, // 아이콘의 가로 크기를 48로 설정
          height: 48, // 아이콘의 세로 크기를 48로 설정
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.2),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            iconData,
          ),
        ),
        SizedBox(height: 8),
        Text(text),
      ],
    );
  }
}
