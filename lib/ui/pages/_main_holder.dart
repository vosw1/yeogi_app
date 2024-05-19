import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yogi_project/_core/constants/move.dart';
import 'package:yogi_project/ui/pages/scrap/scrap_list_page.dart';
import 'package:yogi_project/ui/pages/home/home_page.dart'; // 홈 페이지의 경로
import 'package:yogi_project/ui/pages/scrap/scrap_list_view_model.dart';
import 'package:yogi_project/ui/pages/search/search_page.dart';
import 'package:yogi_project/ui/pages/surroundings/near_from_me_page.dart';

import 'home/widgets/bottom_navigation_bar.dart';
import 'my/my_page.dart'; // 주변 페이지의 경로

class MainHolder extends ConsumerStatefulWidget {
  final int initialIndex;

  MainHolder({this.initialIndex = 0});

  @override
  _MainHolderState createState() => _MainHolderState();
}

class _MainHolderState extends ConsumerState<MainHolder> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 3) {
        ref.invalidate(scrapListProvider); // 스크랩 목록 상태 초기화
      }
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
          MyPage(users: users,), // users 변수를 제거했습니다.
        ],
      ),
      bottomNavigationBar: HomeBottomNavigationBar(
        currentIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
