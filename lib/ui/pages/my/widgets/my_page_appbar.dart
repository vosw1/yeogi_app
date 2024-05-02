import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yogi_project/_core/constants/size.dart';
import 'package:yogi_project/data/models/my_review.dart';
import 'package:yogi_project/data/models/user.dart';
import 'package:yogi_project/ui/pages/my/widgets/my_page_update.dart';
import 'package:yogi_project/ui/pages/my/widgets/my_review_page.dart';
import 'event_banner_page.dart';
import 'my_page_body_icon.dart';
import 'my_profile_page.dart';
import 'notification_page.dart';

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
          MyPageBodyIcon(
            iconData: FontAwesomeIcons.idBadge,
            title: "정보 수정",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyPageUpdate(user: user)),
              );
            },
          ),
          MyPageBodyIcon(
            iconData: FontAwesomeIcons.gift,
            title: "이벤트",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EventBannerPage()),
              );
            },
          ),
          MyPageBodyIcon(
            iconData: FontAwesomeIcons.commentDots,
            title: "내 리뷰",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyReviewPage()),
              );
            },
          ),
          MyPageBodyIcon(
            iconData: FontAwesomeIcons.bell,
            title: "알림함",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
