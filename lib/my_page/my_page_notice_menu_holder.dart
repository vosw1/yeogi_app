import 'package:flutter/material.dart';

// 마이페이지 공지사항 메뉴
class MyPageNoticeMenuHolder extends StatelessWidget {
  const MyPageNoticeMenuHolder({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile( // 공지사항 버튼
          title: Text('공지사항'),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {

          },
        ),
        ListTile( // 설정 버튼
          title: Text('설정'),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {

          },
        ),
      ],
    );
  }
}
