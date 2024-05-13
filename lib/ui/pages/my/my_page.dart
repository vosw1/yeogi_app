import 'package:flutter/material.dart';
import 'package:yogi_project/_core/constants/move.dart';
import 'package:yogi_project/_core/constants/size.dart';
import 'package:yogi_project/data/models/stay.dart';
import 'package:yogi_project/data/models/user.dart';
import 'package:yogi_project/ui/pages/my/widgets/my_page_appbar.dart';
import 'package:yogi_project/ui/pages/my/widgets/my_page_header_banner.dart';
import 'package:yogi_project/ui/pages/my/widgets/my_page_login_button.dart';
import 'package:yogi_project/ui/pages/my/service_center/my_page_faq_menu_holder.dart';
import 'package:yogi_project/ui/pages/my/widgets/my_page_book_menu_holder.dart';

class MyPage extends StatefulWidget {
  final Stay stays;
  final User? users; // Nullable to handle both logged-in and logged-out states

  MyPage({Key? key, this.users, required this.stays}) : super(key: key);

  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  bool _isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    // Initialize login status based on if user data is available
    _isLoggedIn = widget.users != null;
  }

  void _logOut() {
    setState(() {
      _isLoggedIn = false;
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
          if (!_isLoggedIn)
            MyPageLoginButton(
              onTap: () {
                setState(() {
                  _isLoggedIn = true; // Simulate a login action
                });
              },
            ),
          if (_isLoggedIn)
            Column(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(widget.users!.userImgTitle), // Assuming the User model has an imageUrl field
                ),
                SizedBox(height: gap_s),
                Text('${widget.users!.name} 님'), // Display the user's name.
                SizedBox(height: gap_s),
                TextButton(
                  onPressed: _logOut,
                  child: Text('로그아웃', style: TextStyle(color: Colors.white)),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                  ),
                ),
              ],
            ),
          Divider(
            color: Colors.grey[100],
            thickness: 10.0,
          ),
          // 자주쓰는 버튼(최근화면, 할인혜택, 리뷰, 알림창)
          MyPageAppBar(user: users, eventMyPageBannerDataList: eventMyPageBanners),
          // 예약 메뉴
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
