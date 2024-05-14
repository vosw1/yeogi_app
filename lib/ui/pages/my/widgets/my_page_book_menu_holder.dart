import 'package:flutter/material.dart';
import 'package:yogi_project/_core/constants/move.dart';
import 'package:yogi_project/_core/constants/size.dart';
import 'package:yogi_project/_core/constants/style.dart';
import 'package:yogi_project/ui/pages/my/reservation/my_reservation_page.dart';

// 마이페이지의 예약메뉴
class MyPageBookMenuHolder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
            // 국내 숙소 탭 시 MyReservationPage로 이동, 사용자 정보와 이벤트 배너 목록 전달
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MyReservationPage(
                    users: users, eventMyPageBanners: eventMyPageBanners),
              ),
            );
          },
        ),
      ],
    );
  }
}
