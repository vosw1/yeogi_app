import 'package:flutter/material.dart';

// 회원가입, 로그인 아래에 아이콘들
class MyPageBodyIcon extends StatelessWidget {
  final IconData iconData;
  final String title;

  const MyPageBodyIcon({Key? key, required this.iconData, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      child: Column(
        children: [
          Icon(iconData, size: 30),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              title,
              style: TextStyle(fontSize: 14, color: Colors.black),
            ),
          )
        ],
      ),
    );
  }
}
