import 'package:flutter/material.dart';
import 'package:yogi_project/_core/constants/move.dart';
import 'package:yogi_project/data/models/stay.dart';
import 'package:yogi_project/data/models/user.dart';
import 'package:yogi_project/ui/pages/my/service_center/my_page_faq_menu_holder.dart';
import 'package:yogi_project/ui/pages/my/widgets/my_page_appbar.dart';
import 'package:yogi_project/ui/pages/my/widgets/my_page_book_menu_holder.dart';
import 'package:yogi_project/ui/pages/my/widgets/my_page_login_button.dart';
import 'widgets/my_page_header_banner.dart';

class MyPage extends StatelessWidget {
  final Stay stays;
  final User users; // 사용자 정보를 저장하는 변수

  MyPage({required this.stays, required this.users}); // 생성자를 통해 사용자 정보를 받아옵니다.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          // 상단 이미지
          MyPageHeaderBanner(),
          SizedBox(height: 12),
          // 회원가입/로그인 버튼
          MyPageLoginButton(),
          SizedBox(height: 12),
          // 자주쓰는 버튼(최근화면, 할인혜택, 리뷰, 알림창)
          MyPageAppBar(user: users, eventMyPageBannerDataList: eventMyPageBanners,), // 사용자 정보를 MyPageAppBar에 전달합니다.
          Divider(
            color: Colors.grey[100],
            thickness: 10.0,
          ),
          // 예약 메뉴
          MyPageBookMenuHolder(),
          Divider(
            color: Colors.grey[100],
            thickness: 10.0,
          ),
          // 고객센터 메뉴
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