import 'package:flutter/material.dart';
import 'package:yogi_project/_core/constants/move.dart';
import 'package:yogi_project/_core/constants/size.dart';
import 'package:yogi_project/data/models/stay.dart';
import 'package:yogi_project/data/models/user.dart';
import 'package:yogi_project/data/store/session_store.dart';
import 'package:yogi_project/ui/pages/my/widgets/my_page_appbar.dart';
import 'package:yogi_project/ui/pages/my/widgets/my_page_header_banner.dart';
import 'package:yogi_project/ui/pages/my/widgets/my_page_login_button.dart';
import 'package:yogi_project/ui/pages/my/service_center/my_page_faq_menu_holder.dart';
import 'package:yogi_project/ui/pages/my/widgets/my_page_book_menu_holder.dart';
import 'package:yogi_project/ui/pages/my/widgets/my_page_logout_button.dart';

class MyPage extends StatefulWidget {
  final Stay stays;
  final User? users;

  MyPage({Key? key, this.users, required this.stays}) : super(key: key);

  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  bool _isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    updateLoginStatus();
  }

  void updateLoginStatus() {
    var session = SessionStore();
    setState(() {
      _isLoggedIn = session.accessToken != null; // Check if the token is NOT null for logged in
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(height: gap_s),
          MyPageHeaderBanner(),
          SizedBox(height: gap_s),
          if (!_isLoggedIn) // Shows login button if NOT logged in
            MyPageLoginButton(),
          if (_isLoggedIn) // Shows logout button if logged in
            MyPageLogoutButton(),
          Divider(color: Colors.grey[100], thickness: 10.0),
          MyPageAppBar(user: users, eventMyPageBannerDataList: eventMyPageBanners),
          Divider(color: Colors.grey[200], thickness: 10),
          MyPageBookMenuHolder(),
          Divider(color: Colors.grey[200], thickness: 10),
          MyPageFaqMenuHolder(),
          Divider(color: Colors.grey[200], thickness: 10),
        ],
      ),
    );
  }

}
