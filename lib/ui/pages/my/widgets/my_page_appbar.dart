import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yogi_project/_core/constants/move.dart';
import 'package:yogi_project/_core/constants/size.dart';
import 'package:yogi_project/data/models/user.dart';
import 'package:yogi_project/ui/pages/my/widgets/my_page_appbar.dart';
import 'package:yogi_project/ui/pages/my/widgets/my_page_body_icon.dart';
import 'package:yogi_project/ui/pages/my/widgets/my_page_update.dart';

class MyPageAppBar extends StatelessWidget {
  final User user; // 사용자 정보를 전달받는 변수

  const MyPageAppBar({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(gap_s),
      child: Wrap(
        alignment: WrapAlignment.start,
        spacing: 15,
        runSpacing: 30,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyPageUpdate(user: userData,)), // MyPageUpdate 페이지로 이동합니다.
              );
            },
            child: const MyPageBodyIcon(
              iconData: FontAwesomeIcons.idBadge,
              title: "정보 수정",
            ),
          ),
          const MyPageBodyIcon(iconData: FontAwesomeIcons.gift, title: "이벤트"),
          const MyPageBodyIcon(
              iconData: FontAwesomeIcons.commentDots, title: "내 리뷰"),
          const MyPageBodyIcon(iconData: FontAwesomeIcons.bell, title: "알림함"),
        ],
      ),
    );
  }
}
