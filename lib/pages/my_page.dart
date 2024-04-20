import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yogi_project/my_page/my_page_appbar.dart';
import 'package:yogi_project/my_page/my_page_body_banner.dart';
import 'package:yogi_project/my_page/my_page_faq_menu_holder.dart';
import 'package:yogi_project/my_page/my_page_header_banner.dart';
import 'package:yogi_project/my_page/my_page_login_button.dart';
import 'package:yogi_project/my_page/my_page_book_menu_holder.dart';

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          MyPageHeaderBanner(),
          SizedBox(height: 12),
          MyPageLoginButton(),
          SizedBox(height: 12),
          MyPageAppBar(),
          SizedBox(height: 12),
          Divider(
            color: Colors.grey[100],
            thickness: 10.0,
          ),
          MyPageBookMenuHolder(),
          Divider(
            color: Colors.grey[100],
            thickness: 10.0,
          ),
          MyPageFaqMenuHolder(),
          Divider(
            color: Colors.grey[100],
            thickness: 10.0,
          ),
          MyPageBodyBanner(),
        ],
      ),
    );
  }
}