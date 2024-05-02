import 'package:flutter/material.dart';
import 'package:yogi_project/_core/constants/move.dart';
import 'package:yogi_project/data/models/stay.dart';
import 'package:yogi_project/data/models/user.dart';
import 'package:yogi_project/ui/pages/my/my_page.dart';

class MyPageLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            final User userData = User(
              username: '홍길동',
              password: '1234',
              phone: '010-1234-5678',
              birth: '1988-11-11',
            );
            final Stay stayData = Stay(
              stayName: '★당일특가★ 하이원리조트 마운틴콘도',
              stayImgTitle: 'hotel/hotel1.png',
              location: '강원 정선군 고한읍 고한리 438',
              stayInfo: 'dsh',
              notice: 'ttfdgjn',
              reviews: [
                {
                  'starCount': 5,
                  'comment': 'tjgdfsz',
                }
              ],
            );
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyPage(userData: userData, stayData: stayData)),
            );
          },
          child: Text('Go to My Page'),
        ),
      ),
    );
  }
}
