import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yogi_project/_core/constants/move.dart';
import 'package:yogi_project/_core/constants/size.dart';
import 'package:yogi_project/data/models/user.dart';
import 'package:yogi_project/data/store/session_store.dart';
import 'package:yogi_project/ui/pages/my/widgets/my_page_appbar.dart';
import 'package:yogi_project/ui/pages/my/widgets/my_page_header_banner.dart';
import 'package:yogi_project/ui/pages/my/widgets/my_page_login_button.dart';
import 'package:yogi_project/ui/pages/my/widgets/my_page_logout_button.dart';
import 'package:yogi_project/ui/pages/my/service_center/my_page_faq_menu_holder.dart';
import 'package:yogi_project/ui/pages/my/widgets/my_page_book_menu_holder.dart';
import 'package:yogi_project/main.dart';

// 이 코드는 이미 가지고 있는 SessionStore 및 sessionProvider를 사용하고 있어야 합니다.
class MyPage extends ConsumerWidget {
  MyPage({Key? key, required User users}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sessionStore = ref.watch(sessionProvider);

    return Scaffold(
      body: ListView(
        children: [
          SizedBox(height: gap_s),
          MyPageHeaderBanner(),
          SizedBox(height: gap_s),
          if (!sessionStore.isLogin)
            MyPageLoginButton(),
          if (sessionStore.isLogin)
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
