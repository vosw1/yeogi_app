import 'package:flutter/material.dart';
import 'package:yogi_project/size.dart';

class HomeHeaderLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center, // 로고를 중앙에 위치시키기 위해 추가
      children: [
        Padding(
          padding: EdgeInsets.all(gap_xm),
        ),
        Expanded( // Center 위젯 대신 Expanded 사용하여 텍스트를 중앙 정렬
          child: Text(
            "여어떻노",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 43,
              fontWeight: FontWeight.w900,
              color: Colors.redAccent,
              fontFamily: 'Jalnan2TTF',
            ),
          ),
        ),
        SizedBox(width: gap_l),
        Icon(
          Icons.notifications,
          color: Colors.grey,
        ),
      ],
    );
  }
}
