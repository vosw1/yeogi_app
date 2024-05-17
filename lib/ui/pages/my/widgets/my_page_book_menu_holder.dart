import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yogi_project/_core/constants/size.dart';
import 'package:yogi_project/_core/constants/style.dart';
import 'package:yogi_project/data/store/session_store.dart';
import 'package:yogi_project/ui/pages/my/reservation/my_reservation_page.dart';

class MyPageBookMenuHolder extends ConsumerWidget {

  void _showLoginRequiredDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('로그인 필요'),
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

  void _checkLoginAndNavigate(BuildContext context, WidgetRef ref, Widget page) async {
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
    return Column(
      children: <Widget>[
        ListTile(
          // 예약내역 타이틀
          title: Text(
            '예약내역',
            style: h4(),
          ),
          onTap: () {},
        ),
        ListTile(
          // 국내숙소 리스트
          leading: Icon(Icons.receipt_long, size: 30),
          title: Text(
            '숙소',
            style: TextStyle(
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.bold,
              fontSize: gap_m,
            ),
          ),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {
            _checkLoginAndNavigate(
              context,
              ref,
              MyReservationPage(),
            );
          },
        ),
      ],
    );
  }
}
