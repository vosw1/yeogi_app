import 'package:flutter/material.dart';
import 'package:yogi_project/_core/constants/size.dart';
import 'package:yogi_project/ui/pages/home/widgets/home_body.dart';
import 'package:yogi_project/ui/pages/home/widgets/home_header.dart';
import '../../../data/models/user.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

List<User> userDataList = [
  User(
    userImgTitle: "user/avarta.png",
    userName: "메타코딩",
    email: "ssar@nate.com",
  ),
];

class _HomePageState extends State
{
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            SizedBox(height: gap_xm),
            //상단 로고, 벨 아이콘 + 상단 아이콘
            HomeHeader(),
            SizedBox(height: gap_m),
            HomeBody(),
          ],
        ),
      ),
      // 맨위, 맨 아래 이동 버튼
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'up_button',
            onPressed: () {
              // 버튼을 누르면 맨 위로 올라가도록 스크롤 위치를 조정
              _scrollController.animateTo(
                0,
                duration: Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );
            },
            mini: true, // 버튼 크기 최소화
            backgroundColor: Colors.white,
            child: Icon(Icons.keyboard_arrow_up, color: Colors.black),
          ),
          SizedBox(height: 1), // 버튼 사이의 간격을 줄이기
          FloatingActionButton(
            heroTag: 'down_button',
            onPressed: () {
// 버튼을 누르면 맨 아래로 이동하도록 스크롤 위치 조정
              _scrollController.animateTo(
                _scrollController.position.maxScrollExtent,
                duration: Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );
            },
            mini: true, // 버튼 크기 최소화
            backgroundColor: Colors.white,
            child: Icon(Icons.keyboard_arrow_down, color: Colors.black),
          ),
        ],
      ),
    );
  }
}