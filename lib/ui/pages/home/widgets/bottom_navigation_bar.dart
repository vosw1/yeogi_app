import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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