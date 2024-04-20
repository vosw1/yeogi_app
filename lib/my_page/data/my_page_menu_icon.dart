import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyPageMenu{
  final String title;
  final IconData iconData;

  MyPageMenu({required this.title, required this.iconData});
}

final List<MyPageMenu> myPageMenu = [
  MyPageMenu(title: '자주 묻는 질문', iconData:FontAwesomeIcons.info),
  MyPageMenu(title: '1:1 카카오 문의', iconData:FontAwesomeIcons.comment),
  MyPageMenu(title: '고객 행복센터 연결', iconData:FontAwesomeIcons.phone),
];

