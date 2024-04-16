import 'package:flutter/material.dart';
import '../../size.dart';
import 'header_appbar_item.dart';

class HomeHeaderAppBar extends StatelessWidget {
  const HomeHeaderAppBar({Key? key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isWideScreen = screenWidth > 600; // 웹을 위한 임계값

    return Container(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.only(right: 30, left: 30),
        child: isWideScreen ? WideScreenAppbarItemList() : NarrowScreenAppbarItemList(),
      ),
    );
  }
}

// 웹용 전체 1줄 화면
class WideScreenAppbarItemList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        HeadAppBarItem(iconData: Icons.loyalty_outlined, text: '프리미엄'),
        SizedBox(width: gap_xm),
        HeadAppBarItem(iconData: Icons.bed_outlined, text: '모텔'),
        SizedBox(width: gap_xm),
        HeadAppBarItem(iconData: Icons.location_city_outlined, text: '호텔'),
        SizedBox(width: gap_xm),
        HeadAppBarItem(iconData: Icons.beach_access_outlined, text: '펜션'),
        SizedBox(width: gap_xm),
        HeadAppBarItem(iconData: Icons.home, text: '홈&빌라'),
        SizedBox(width: gap_xm),
        HeadAppBarItem(iconData: Icons.landscape_outlined, text: '캠핑'),
        SizedBox(width: gap_xm),
        HeadAppBarItem(iconData: Icons.cabin_outlined, text: '게하'),
        SizedBox(width: gap_xm),
        HeadAppBarItem(iconData: Icons.celebration_outlined, text: '펜션'),
      ],
    );
  }
}

//웹용 4개씩 2줄 화면
class NarrowScreenAppbarItemList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            HeadAppBarItem(iconData: Icons.loyalty_outlined, text: '프리미엄'),
            SizedBox(width: gap_xm),
            HeadAppBarItem(iconData: Icons.bed_outlined, text: '모텔'),
            SizedBox(width: gap_xm),
            HeadAppBarItem(iconData: Icons.location_city_outlined, text: '호텔'),
            SizedBox(width: gap_xm),
            HeadAppBarItem(iconData: Icons.beach_access_outlined, text: '펜션'),
          ],
        ),
        SizedBox(height: gap_m),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            HeadAppBarItem(iconData: Icons.home, text: '홈&빌라'),
            SizedBox(width: gap_xm),
            HeadAppBarItem(iconData: Icons.landscape_outlined, text: '캠핑'),
            SizedBox(width: gap_xm),
            HeadAppBarItem(iconData: Icons.cabin_outlined, text: '게하'),
            SizedBox(width: gap_xm),
            HeadAppBarItem(iconData: Icons.celebration_outlined, text: '펜션'),
          ],
        ),
      ],
    );
  }
}
