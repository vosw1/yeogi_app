import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../size.dart';
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
                _navigateToUrl('특가 아이콘 클릭 시 이동할 URL');
              },
              child: HeadAppBarItem(iconData: FontAwesomeIcons.gift, text: '특가'),
            ),
            SizedBox(width: gap_xm),
            GestureDetector(
              onTap: () {
                _navigateToUrl('이벤트 아이콘 클릭 시 이동할 URL');
              },
              child: HeadAppBarItem(iconData: FontAwesomeIcons.planeDeparture, text: '해외'),
            ),
            SizedBox(width: gap_xm),
            GestureDetector(
              onTap: () {
                _navigateToUrl('모텔 아이콘 클릭 시 이동할 URL');
              },
              child: HeadAppBarItem(iconData: FontAwesomeIcons.bed, text: '모텔'),
            ),
            SizedBox(width: gap_xm),
            GestureDetector(
              onTap: () {
                _navigateToUrl('호텔 아이콘 클릭 시 이동할 URL');
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
                _navigateToUrl('펜션 아이콘 클릭 시 이동할 URL');
              },
              child: HeadAppBarItem(iconData: FontAwesomeIcons.umbrellaBeach, text: '펜션'),
            ),
            SizedBox(width: gap_xm),
            GestureDetector(
              onTap: () {
                _navigateToUrl('홈&빌라 아이콘 클릭 시 이동할 URL');
              },
              child: HeadAppBarItem(iconData: FontAwesomeIcons.house, text: '홈&빌라'),
            ),
            SizedBox(width: gap_xm),
            GestureDetector(
              onTap: () {
                _navigateToUrl('캠핑 아이콘 클릭 시 이동할 URL');
              },
              child: HeadAppBarItem(iconData: FontAwesomeIcons.mountainCity, text: '캠핑'),
            ),
            SizedBox(width: gap_xm),
            GestureDetector(
              onTap: () {
                _navigateToUrl('게하 아이콘 클릭 시 이동할 URL');
              },
              child: HeadAppBarItem(iconData: FontAwesomeIcons.warehouse, text: '게하'),
            ),
          ],
        ),
      ],
    );
  }
}
