import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yogi_project/my_page/my_page_appbar.dart';
import 'package:yogi_project/my_page/my_page_header_banner.dart';
import 'package:yogi_project/my_page/my_page_login_button.dart';

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
          SizedBox(height: 5),
          // MyPageAppBar(),
        ],
      ),
    );
  }
}