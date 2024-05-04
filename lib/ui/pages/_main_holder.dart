import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yogi_project/_core/constants/move.dart';
import 'package:yogi_project/data/models/stay.dart';
import 'package:yogi_project/ui/pages/my/my_page.dart'; // 수정된 경로 확인
import 'package:yogi_project/ui/pages/scrap/scrap_list_page.dart';

import 'home/home_page.dart';
import 'search/search_page.dart';
import 'surroundings/near_from_me_page.dart'; // 수정된 경로 확인

class MainHolder extends StatefulWidget {
  @override
  _MainHolderState createState() => _MainHolderState();
}

class _MainHolderState extends State<MainHolder> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          HomePage(),
          SearchPage(),
          NearFromMePage(), // 주변 페이지를 나타내는 위젯의 경로가 없는 것으로 보입니다. 수정이 필요할 수 있습니다.
          ScrapListPage(),
          MyPage(userData: userData, stayData: stayData, eventMyPageBannerData: eventMyPageBannerDataList ),
        ],
      ),
      bottomNavigationBar: HomeBottomNavigationBar(
        currentIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}

class HomeBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onItemTapped;

  const HomeBottomNavigationBar({
    Key? key,
    required this.currentIndex,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      currentIndex: currentIndex,
      onTap: onItemTapped,
      selectedItemColor: Colors.redAccent,
      items: [
        BottomNavigationBarItem(
          label: '홈',
          icon: Icon(CupertinoIcons.house_fill),
        ),
        BottomNavigationBarItem(
          label: '검색',
          icon: Icon(CupertinoIcons.search),
        ),
        BottomNavigationBarItem(
          label: '주변',
          icon: Icon(CupertinoIcons.placemark_fill),
        ),
        BottomNavigationBarItem(
          label: '찜',
          icon: Icon(CupertinoIcons.heart_fill),
        ),
        BottomNavigationBarItem(
          label: '내 정보',
          icon: Icon(CupertinoIcons.smiley_fill),
        ),
      ],
    );
  }
}
