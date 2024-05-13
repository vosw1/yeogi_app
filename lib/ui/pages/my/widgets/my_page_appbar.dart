import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yogi_project/_core/constants/move.dart';
import 'package:yogi_project/_core/constants/size.dart';
import 'package:yogi_project/data/models/event_my_page_banner.dart';
import 'package:yogi_project/data/models/user.dart';
import 'package:yogi_project/ui/pages/my/event/event_my_page_banner_page.dart';
import 'package:yogi_project/ui/pages/my/widgets/my_page_update.dart';
import 'package:yogi_project/ui/pages/my/widgets/my_review_page.dart';
import 'my_page_body_icon.dart';
import 'notification_page.dart';

class MyPageAppBar extends StatelessWidget {
  final User user;
  final List<EventMyPageBannerData> eventMyPageBannerDataList; // 이벤트 배너 데이터 추가

  const MyPageAppBar({Key? key, required this.user, required this.eventMyPageBannerDataList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(gap_s),
      child: Wrap(
        alignment: WrapAlignment.spaceBetween,
        spacing: 15,
        runSpacing: 30,
        children: [
          MyPageBodyIcon(
            iconData: FontAwesomeIcons.idBadge,
            title: "정보 수정",
            onTap: () {
              Navigator.push(
                context,
               MaterialPageRoute(builder: (context) => MyPageUpdate(users: users,)),
              );
            },
          ),
          MyPageBodyIcon(
            iconData: FontAwesomeIcons.gift,
            title: "이벤트",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EventMyPageBannerPage(eventMyPageBannerDataList: eventMyPageBannerDataList)),
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
