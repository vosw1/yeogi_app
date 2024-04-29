import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../_core/constants/move.dart';
import '../../../../_core/constants/size.dart';
import '../../stay/pages/camping_stay_page.dart';
import '../../stay/pages/guest_house_stay_page.dart';
import '../../stay/pages/home_and_billa_stay_page.dart';
import '../../stay/pages/hotel_stay_page.dart';
import '../../stay/pages/motel_stay_page.dart';
import '../../stay/pages/overseas_stay_page.dart';
import '../../stay/pages/pension_stay_page.dart';
import '../../stay/pages/sale_stay_page.dart';
import 'home_header_appbar_item.dart';

// 홈 페이지에 앱바 (아이콘 + 텍스트)
class HomeHeaderItemList extends StatelessWidget {
  const HomeHeaderItemList({Key? key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isWideScreen = screenWidth > 600; // 웹을 위한 임계값

    return Container(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: gap_xm, vertical: gap_m),
        child: HeaderAppbarItemList(),
      ),
    );
  }
}

//4개씩 2줄 화면
class HeaderAppbarItemList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void _navigateToUrl(String url) {
      // URL로 이동하는 코드 작성
    }

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SaleStayPage(stayData: stayData)),
                );
              },
              child: HeadAppBarItem(iconData: FontAwesomeIcons.gift, text: '특가'),
            ),
            SizedBox(width: gap_m),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HotelStayPage()),
                 );
              },
              child: HeadAppBarItem(iconData: FontAwesomeIcons.planeDeparture, text: '해외'),
            ),
            SizedBox(width: gap_m),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OverseasStayPage(bookInAbroardList: [], stayData: stayData)),
                );
              },
              child: HeadAppBarItem(iconData: FontAwesomeIcons.hotel, text: '호텔'),
            ),
            SizedBox(width: gap_m),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HotelStayPage()),
                );
              },
              child: HeadAppBarItem(iconData: FontAwesomeIcons.bed, text: '모텔'),
            ),
          ],
        ),
        SizedBox(height: gap_m),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PensionStayPage()),
                );
              },
              child: HeadAppBarItem(iconData: FontAwesomeIcons.umbrellaBeach, text: '펜션'),
            ),
            SizedBox(width: gap_m),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeAndBillaStayPage()),
                );
              },
              child: HeadAppBarItem(iconData: FontAwesomeIcons.house, text: '홈&빌라'),
            ),
            SizedBox(width: gap_m),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CampingStayPage()),
                );
              },
              child: HeadAppBarItem(iconData: FontAwesomeIcons.mountainCity, text: '캠핑'),
            ),
            SizedBox(width: gap_m),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GuestHouseStayPage()),
                );
              },
              child: HeadAppBarItem(iconData: FontAwesomeIcons.warehouse, text: '게하'),
            ),
          ],
        ),
      ],
    );
  }
}