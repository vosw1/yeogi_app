import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'my_page_body_icon.dart';

// 마이페이지에 앱바 -> 로그인 버튼 밑에 버튼
class MyPageAppBar extends StatelessWidget {
  const MyPageAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 30),
      child: Wrap(
        alignment: WrapAlignment.start,
        spacing: 15,
        runSpacing: 30,
        children: [
          const MyPageBodyIcon(
              iconData: FontAwesomeIcons.clock, title: "최근 본 상품"),
          const MyPageBodyIcon(
              iconData: FontAwesomeIcons.gift, title: "할인 * 혜택"),
          const MyPageBodyIcon(
              iconData: FontAwesomeIcons.commentDots, title: "내 리뷰"),
          const MyPageBodyIcon(
              iconData: FontAwesomeIcons.bell, title: "알림함"),
        ],
      ),
    );
  }
}
