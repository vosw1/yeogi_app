import 'package:flutter/cupertino.dart';
import 'package:yogi_project/_core/constants/size.dart';
import 'home_header_appbar.dart';
import 'home_header_logo.dart';

// 홈 페이지의 상단 로고와 앱바
class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          // 로고 + 종모양 아이콘
          HomeHeaderLogo(),
          // 로고 밑 아이콘 + text 버튼
          HomeHeaderItemList(),
        ],
      ),
    );
  }
}