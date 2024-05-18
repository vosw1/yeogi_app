import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yogi_project/_core/constants/size.dart';
import 'package:yogi_project/data/models/event_my_page_banner.dart';
import 'package:yogi_project/data/models/user.dart';
import 'package:yogi_project/data/store/session_store.dart';
import 'package:yogi_project/ui/pages/auth/login/login_page.dart';
import 'package:yogi_project/ui/pages/my/event/event_my_page_banner_page.dart';
import 'package:yogi_project/ui/pages/my/widgets/my_page_update.dart';
import 'package:yogi_project/ui/pages/my/widgets/my_review_page.dart';
import 'my_page_body_icon.dart';
import 'notification_page.dart';

class MyPageAppBar extends ConsumerWidget {
  final User user;
  final List<EventMyPageBannerData> eventMyPageBannerDataList;

  const MyPageAppBar({Key? key, required this.user, required this.eventMyPageBannerDataList}) : super(key: key);

  void _showLoginRequiredDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('로그인 필요'),
          content: Text('로그인을 먼저 해주세요.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // 닫기
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              child: Center(child: Text('로그인 페이지로 이동', style: TextStyle(color: Colors.redAccent),)),
            ),
          ],
        );
      },
    );
  }

  void _checkLoginAndNavigate(BuildContext context, WidgetRef ref, Widget page) {
    final sessionStore = ref.read(sessionProvider);

    if (sessionStore.isLogin) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => page),
      );
    } else {
      _showLoginRequiredDialog(context);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
              _checkLoginAndNavigate(context, ref, MyPageUpdate(users: user));
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
              _checkLoginAndNavigate(context, ref, MyReviewPage());
            },
          ),
          MyPageBodyIcon(
            iconData: FontAwesomeIcons.bell,
            title: "알림함",
            onTap: () {
              _checkLoginAndNavigate(context, ref, NotificationPage());
            },
          ),
        ],
      ),
    );
  }
}
