import 'package:flutter/material.dart';
import 'package:yogi_project/ui/pages/stay/hotel_stay_page/hotel_stay_page.dart';

import '../../stay/camping_stay_page/camping_stay_page.dart';
import '../../stay/guest_house_page/guest_house_stay_page.dart';
import '../../stay/home_and_billa_dtay_page/home_and_billa_stay_page.dart';
import '../../stay/motel_stay_page/motel_stay_page.dart';
import '../../stay/overseas_stay_page/overseas_stay_page.dart';
import '../../stay/pansion_stay_page/pension_stay_page.dart';
import '../../stay/sale_stay_page/sale_stay_page.dart';

// 홈 페이지에 앱바 (아이콘 + 텍스트)
class HomeHeaderItems extends StatelessWidget {
  final IconData iconData;
  final String text;

  const HomeHeaderItems({required this.iconData, required this.text});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isWideScreen = screenWidth > 600; // 웹을 위한 임계값

    return GestureDetector(
      onTap: () {
        _handleTap(context);
      },
      child: Row(
        children: [
          Icon(iconData),
          SizedBox(width: 8), // 아이콘과 텍스트 사이 여백 조절
          Text(text),
        ],
      ),
    );
  }

  void _handleTap(BuildContext context) {
    // 각각의 아이콘에 맞는 동작 구현
    switch (text) {
      case "특가":
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SaleStayPage()),
        );
        break;
      case "해외":
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => OverseasStayPage(bookInAbroardList: [],)),
        );
        break;
      case "호텔":
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HotelStayPage()),
        );
      case "모텔":
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ModelStayPage()),
        );
        break;
        break;
      case "펜션":
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PansionStayPage()),
        );
        break;
      case "홈&빌라":
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeAndBillaStayPage()),
        );
        break;
      case "캠핑":
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CampingStayPage()),
        );
        break;
      case "게하":
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => GuestHouseStayPage()),
        );
        break;
    }
  }
}
