import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yogi_project/size.dart';

import '../components/_header/home_header.dart';
import '../components/body/home_body.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          HomeHeader(),
          HomeBody(),
        ],
      ),
      bottomNavigationBar: HomeBottomNavigationBar(),
    );
  }

}

class HomeBottomNavigationBar extends StatefulWidget {
  @override
  State<HomeBottomNavigationBar> createState() => _HomeBottomNavigationBarState();
}

class _HomeBottomNavigationBarState extends State<HomeBottomNavigationBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      currentIndex: _selectedIndex,
      onTap: (index) {
        setState(() {
          _selectedIndex = index;
        });
      },
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
