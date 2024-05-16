import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart'; // SharedPreferences for token management
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

  Future<String?> _getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  void _showLoginRequiredDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('미 로그인 상태'),
          content: Text('로그인을 먼저 해주세요.'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Center(child: Text('확인')),
            ),
          ],
        );
      },
    );
  }

  void _checkLoginAndNavigate(BuildContext context, Widget page) async {
    String? token = await _getToken();
    if (token == null) {
      _showLoginRequiredDialog(context);
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => page),
      );
    }
  }

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
              _checkLoginAndNavigate(context, MyPageUpdate(users: user));
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
              _checkLoginAndNavigate(context, MyReviewPage());
            },
          ),
          MyPageBodyIcon(
            iconData: FontAwesomeIcons.bell,
            title: "알림함",
            onTap: () {
              _checkLoginAndNavigate(context, NotificationPage());
            },
          ),
        ],
      ),
    );
  }
}
