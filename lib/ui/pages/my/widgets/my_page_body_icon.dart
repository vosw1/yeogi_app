import 'package:flutter/material.dart';
import 'package:yogi_project/_core/constants/style.dart';

// 회원가입, 로그인 아래에 아이콘들
class MyPageBodyIcon extends StatelessWidget {
  final IconData iconData;
  final String title;
  final VoidCallback onTap; // 수정된 부분

  const MyPageBodyIcon({Key? key, required this.iconData, required this.title, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector( // GestureDetector로 감싸서 탭 이벤트 처리
      onTap: onTap,
      child: Container(
        width: 80,
        child: Column(
          children: [
            Icon(iconData, size: 30),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                title,
                style: h6(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
