import 'package:flutter/material.dart';
import 'package:yogi_project/data/models/event_title_banner.dart';
import 'package:yogi_project/data/models/home_banner.dart';

class HomeBannerItem extends StatelessWidget {
  final EventTitleBannerData bannerData; // EventTitleBannerData 타입으로 변경

  const HomeBannerItem({Key? key, required this.bannerData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200, // 예시로 너비를 200으로 설정
      height: 300, // 예시로 높이를 300으로 설정
      child: Stack( // Stack으로 변경
        children: [
          Image.asset(
            'assets/images/${bannerData.imageTitle}', // 이미지의 경로를 표시
            fit: BoxFit.cover, // 이미지를 화면에 맞게 늘리기
            width: double.infinity, // 이미지를 컨테이너의 가로 길이에 맞게 늘림
            height: double.infinity, // 이미지를 컨테이너의 세로 길이에 맞게 늘림
          ),
          Positioned(
            bottom: 16, // 아래 여백 설정
            left: 16, // 왼쪽 여백 설정
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  bannerData.bannerTitle, // 배너 제목을 표시
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.redAccent, // 텍스트 색상을 흰색으로 설정
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
