import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yogi_project/ui/pages/surroundings/surroundings_page.dart';
import 'package:yogi_project/ui/pages/scrap/scarp_page.dart';
import 'package:yogi_project/ui/pages/search/search_page.dart';

import '../../data/models/payment.dart';
import '../../data/models/stay.dart';
import 'home/home_page.dart';
import 'my/my_page.dart';

// 전체 화면 틀
class MainHolder extends StatefulWidget {

  @override
  _MainScreensState createState() => _MainScreensState();
}

class _MainScreensState extends State<MainHolder> {
  int _selectedIndex = 0;

  get roomData => null;

  get stayData => null;

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
        children: [HomePage(), SearchPage(), NearFromMePage(), ScrapPage(), MyPage()],
      ),
      bottomNavigationBar: HomeBottomNavigationBar(
        currentIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}

// 하단 네비데이션바
class HomeBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onItemTapped;

  HomeBottomNavigationBar({required this.currentIndex, required this.onItemTapped});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      currentIndex: currentIndex,
      onTap: onItemTapped,
      items: [
        const BottomNavigationBarItem(
          label: '홈',
          icon: Icon(CupertinoIcons.house_fill),
        ),
        const BottomNavigationBarItem(
          label: '검색',
          icon: Icon(CupertinoIcons.search),
        ),
        const BottomNavigationBarItem(
          label: '주변',
          icon: Icon(CupertinoIcons.placemark_fill),
        ),
        const BottomNavigationBarItem(
          label: '찜',
          icon: Icon(CupertinoIcons.heart_fill),
        ),
        const BottomNavigationBarItem(
          label: '내 정보',
          icon: Icon(CupertinoIcons.smiley_fill),
        ),
      ],
    );
  }
}
