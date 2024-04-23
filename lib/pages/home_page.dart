import 'package:flutter/material.dart';
import 'package:yogi_project/size.dart';
import '../home_page/_header/home_header.dart';
import '../home_page/body/home_body.dart';
import '_main_holder.dart';

// 홈페이지 기본 틀
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            // 여백
            SizedBox(height: gap_m),
            //상단 로고, 벨 아이콘
            HomeHeader(),
            // 배너 + 추천 숙소 리스트
            HomeBody(),
            SizedBox(height: 20), // 스크롤 가능한 공간을 추가하여 버튼과 컨텐츠를 분리합니다.
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
            child: Icon(Icons.keyboard_arrow_up,
                color: Colors.black),
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
            child: Icon(Icons.keyboard_arrow_down,
                color: Colors.black),
          ),
        ],
      ),
    );
  }
}


