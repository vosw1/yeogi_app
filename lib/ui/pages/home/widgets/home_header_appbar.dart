import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yogi_project/_core/constants/size.dart';
import 'package:yogi_project/ui/pages/stay/stay_list_pages/camping_stay_list.dart';
import 'package:yogi_project/ui/pages/stay/stay_list_pages/guest_house_stay_list.dart';
import 'package:yogi_project/ui/pages/stay/stay_list_pages/home_and_billa_stay_list.dart';
import 'package:yogi_project/ui/pages/stay/stay_list_pages/hotel_stay_list.dart';
import 'package:yogi_project/ui/pages/stay/stay_list_pages/motel_stay_list.dart';
import 'package:yogi_project/ui/pages/stay/stay_list_pages/oversea_list_page.dart';
import 'package:yogi_project/ui/pages/stay/stay_list_pages/overseas_stay_list.dart';
import 'package:yogi_project/ui/pages/stay/stay_list_pages/pension_stay_list.dart';
import 'package:yogi_project/ui/pages/stay/stay_list_pages/sale_list_page.dart';

import 'home_header_appbar_item.dart';

// 홈 페이지에 앱바 (아이콘 + 텍스트)
class HomeHeaderItemList extends StatelessWidget {
  const HomeHeaderItemList({Key? key});

  @override
  Widget build(BuildContext context) {

    return Container(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: gap_xm, vertical: gap_s),
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
                  MaterialPageRoute(builder: (context) => SaleStayListPage()),
                );
              },
              child: HeadAppBarItem(iconData: FontAwesomeIcons.gift, text: '특가'),
            ),
            SizedBox(width: gap_m),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OverseaStayListPage()),
                 );
              },
              child: HeadAppBarItem(iconData: FontAwesomeIcons.planeDeparture, text: '해외'),
            ),
            SizedBox(width: gap_m),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HotelStayList()),
                );
              },
              child: HeadAppBarItem(iconData: FontAwesomeIcons.hotel, text: '호텔'),
            ),
            SizedBox(width: gap_m),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MotelStayList()),
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
                  MaterialPageRoute(builder: (context) => PensionStayList()),
                );
              },
              child: HeadAppBarItem(iconData: FontAwesomeIcons.umbrellaBeach, text: '펜션'),
            ),
            SizedBox(width: gap_m),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeAndBillaStayList()),
                );
              },
              child: HeadAppBarItem(iconData: FontAwesomeIcons.house, text: '홈&빌라'),
            ),
            SizedBox(width: gap_m),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CampingStayList()),
                );
              },
              child: HeadAppBarItem(iconData: FontAwesomeIcons.mountainCity, text: '캠핑'),
            ),
            SizedBox(width: gap_m),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GuestHouseStayList()),
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
