import 'package:flutter/material.dart';
import 'package:yogi_project/_core/constants/move.dart';
import 'package:yogi_project/ui/pages/scrap/scrap_list_page.dart';
import 'package:yogi_project/ui/pages/home/home_page.dart'; // 홈 페이지의 경로
import 'package:yogi_project/ui/pages/search/search_page.dart';
import 'package:yogi_project/ui/pages/surroundings/near_from_me_page.dart';

import 'home/widgets/bottom_navigation_bar.dart';
import 'my/my_page.dart'; // 주변 페이지의 경로

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
          NearFromMePage(),
          ScrapListPage(),
          MyPage(),
        ],
      ),
      bottomNavigationBar: HomeBottomNavigationBar(
        currentIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}

