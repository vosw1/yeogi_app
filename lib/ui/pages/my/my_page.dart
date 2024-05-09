import 'package:flutter/material.dart';
import 'package:yogi_project/_core/constants/move.dart';
import 'package:yogi_project/data/models/event_my_page_banner.dart';
import 'package:yogi_project/data/models/event_title_banner.dart';
import 'package:yogi_project/data/models/stay.dart';
import 'package:yogi_project/data/models/user.dart';
import 'package:yogi_project/ui/pages/my/widgets/my_page_appbar.dart';
import 'package:yogi_project/ui/pages/my/widgets/my_page_book_menu_holder.dart';
import 'package:yogi_project/ui/pages/my/service_center/my_page_faq_menu_holder.dart';
import 'package:yogi_project/ui/pages/my/widgets/my_page_header_banner.dart';
import 'package:yogi_project/ui/pages/my/widgets/my_page_login_button.dart';

class MyPage extends StatelessWidget {
  final Stay stays;
  final User users;
  final List<EventMyPageBannerData> eventMyPageBannerData;

  MyPage({
    required this.stays,
    required this.users,
    required this.eventMyPageBannerData,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          MyPageHeaderBanner(),
          SizedBox(height: 12),
          MyPageLoginButton(),
          SizedBox(height: 12),
          MyPageAppBar(user: users, eventMyPageBannerDataList: eventMyPageBannerDataList),
          Divider(
            color: Colors.grey[100],
            thickness: 10.0,
          ),
          MyPageBookMenuHolder(stays: stays),
          Divider(
            color: Colors.grey[100],
            thickness: 10.0,
          ),
          MyPageFaqMenuHolder(),
          Divider(
            color: Colors.grey[100],
            thickness: 10.0,
          ),
        ],
      ),
    );
  }
}