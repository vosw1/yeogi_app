import 'package:flutter/material.dart';
import '../../../../_core/constants/size.dart';

// 여 어떻노 로고 + 종모양 아이콘
class HomeHeaderLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center, // 로고를 중앙에 위치시키기 위해 추가
      children: [
        Padding(
          padding: EdgeInsets.all(gap_m),
        ),
        Expanded( // Center 위젯 대신 Expanded 사용하여 텍스트를 중앙 정렬
          child: Padding(
            padding: const EdgeInsets.all(gap_m),
            child: Text(
              "여어떻노.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 43,
                fontWeight: FontWeight.w900,
                color: Colors.redAccent,
                fontFamily: 'Jalnan2TTF',
              ),
            ),
          ),
        ),
        Icon(
          Icons.notifications,
          color: Colors.grey,
        ),
        SizedBox(width: gap_m),
      ],
    );
  }
}