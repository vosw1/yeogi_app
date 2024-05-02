import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yogi_project/_core/constants/size.dart';
import 'package:yogi_project/data/models/my_review.dart';
import 'package:yogi_project/ui/pages/my/widgets/my_review_page.dart';
import 'event_banner_page.dart';
import 'my_page_body_icon.dart';
import 'my_profile_page.dart';
import 'notification_page.dart';

// 마이페이지에 앱바 -> 로그인 버튼 밑에 버튼
class MyPageAppBar extends StatelessWidget {
  const MyPageAppBar({Key? key}) : super(key: key);

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
                MaterialPageRoute(builder: (context) => MyProfilePage()),
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




