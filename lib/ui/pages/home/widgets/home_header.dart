import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'home_header_items.dart';
import 'home_appbar_logo.dart';

// 홈 페이지의 상단 로고와 앱바
class HomeHeader extends StatelessWidget {
  const HomeHeader({Key? key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          // 로고 + 종모양 아이콘
          HomeHeaderLogo(),
          // 로고 밑 아이콘 + text 버튼
          HomeHeaderItems(iconData: FontAwesomeIcons.gift, text: "특가"),
          HomeHeaderItems(iconData: FontAwesomeIcons.planeDeparture, text: "해외"),
          HomeHeaderItems(iconData: FontAwesomeIcons.hotel, text: "호텔"),
          HomeHeaderItems(iconData: FontAwesomeIcons.bed, text: "모텔"),
          HomeHeaderItems(iconData: FontAwesomeIcons.umbrellaBeach, text: "펜션"),
          HomeHeaderItems(iconData: FontAwesomeIcons.house, text: "홈&빌라"),
          HomeHeaderItems(iconData: FontAwesomeIcons.mountainCity, text: "캠핑"),
          HomeHeaderItems(iconData: FontAwesomeIcons.warehouse, text: "게하"),
        ],
      ),
    );
  }
}
