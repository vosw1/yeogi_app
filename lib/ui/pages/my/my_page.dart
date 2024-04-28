import 'package:flutter/material.dart';
import 'package:yogi_project/data/models/stay.dart';
import 'package:yogi_project/ui/pages/my/widgets/my_page_book_menu_holder.dart';
import 'package:yogi_project/ui/pages/my/widgets/my_page_faq_menu_holder.dart';
import 'package:yogi_project/ui/pages/my/widgets/my_page_login_button.dart';
import 'widgets/my_page_appbar.dart';
import 'widgets/my_page_body_banner.dart';
import 'widgets/my_page_header_banner.dart';
import 'widgets/my_page_notice_menu_holder.dart';

class MyPage extends StatelessWidget {
  final Stay stayData;

  MyPage({required this.stayData});

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
          MyPageAppBar(),
          SizedBox(height: 12),
          Divider(
            color: Colors.grey[100],
            thickness: 10.0,
          ),
          // 예약 메뉴
          MyPageBookMenuHolder(stayData: stayData),
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
          // 하단 배너
          MyPageBodyBanner(),
          Divider(
            color: Colors.grey[100],
            thickness: 10.0,
          ),
          // 공지 메뉴
          MyPageNoticeMenuHolder(),
        ],
      ),
    );
  }
}
