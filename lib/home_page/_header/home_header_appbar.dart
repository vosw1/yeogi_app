import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yogi_project/stayListPage/camping_page.dart';
import 'package:yogi_project/stayListPage/guesthouse_page.dart';
import 'package:yogi_project/stayListPage/home_and_billa_page.dart';
import 'package:yogi_project/stayListPage/hotel_page.dart';
import 'package:yogi_project/stayListPage/motel_page.dart';
import 'package:yogi_project/stayListPage/pension_page.dart';
import 'package:yogi_project/stayListPage/sale_stay_page.dart';
import '../../../size.dart';
import '../../stayListPage/abroad_stay_page.dart';
import 'header_appbar_item.dart';

// 홈 페이지에 앱바 (아이콘 + 텍스트)
class HomeHeaderAppBar extends StatelessWidget {
  const HomeHeaderAppBar({Key? key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isWideScreen = screenWidth > 600; // 웹을 위한 임계값

    return Container(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.only(right: gap_xm, left: gap_xm),
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
                  MaterialPageRoute(builder: (context) => SaleStayPage()),
                );
              },
              child: HeadAppBarItem(iconData: FontAwesomeIcons.gift, text: '특가'),
            ),
            SizedBox(width: gap_xm),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AbroadStayPage()),
                );
              },
              child: HeadAppBarItem(iconData: FontAwesomeIcons.planeDeparture, text: '해외'),
            ),
            SizedBox(width: gap_xm),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MotelPage()),
                );
              },
              child: HeadAppBarItem(iconData: FontAwesomeIcons.bed, text: '모텔'),
            ),
            SizedBox(width: gap_xm),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HotelPage()),
                );
              },
              child: HeadAppBarItem(iconData: FontAwesomeIcons.hotel, text: '호텔'),
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
                  MaterialPageRoute(builder: (context) => PensionPage()),
                );
              },
              child: HeadAppBarItem(iconData: FontAwesomeIcons.umbrellaBeach, text: '펜션'),
            ),
            SizedBox(width: gap_xm),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeAndBillaPage()),
                );
              },
              child: HeadAppBarItem(iconData: FontAwesomeIcons.house, text: '홈&빌라'),
            ),
            SizedBox(width: gap_xm),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CampingPage()),
                );
              },
              child: HeadAppBarItem(iconData: FontAwesomeIcons.mountainCity, text: '캠핑'),
            ),
            SizedBox(width: gap_xm),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GuesthousePage()),
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
