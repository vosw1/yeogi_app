import 'package:flutter/material.dart';
import 'package:yogi_project/_core/constants/size.dart';
import 'package:yogi_project/data/models/event_title_banner.dart';

class EventTitleBannerItem extends StatelessWidget {
  final EventTitleBannerData eventTitleBannerData;

  const EventTitleBannerItem({Key? key, required this.eventTitleBannerData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(gap_m),
      child: Container(
        width: double.infinity, // 가로로 최대로 확장되도록 설정
        height: 100, // 이미지의 높이를 원하는 크기로 설정
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(eventTitleBannerData.imagePath), // 이미지 경로 수정
            fit: BoxFit.fitWidth,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
          ),
        ),
      ),
    );
  }
}
