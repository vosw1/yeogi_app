import 'package:flutter/material.dart';
import 'package:yogi_project/data/models/event_my_page_banner.dart';
import 'package:yogi_project/_core/constants/size.dart';

class EventMyPageBannerItem extends StatelessWidget {
  final EventMyPageBannerData eventMyPageBannerData;

  const EventMyPageBannerItem({Key? key, required this.eventMyPageBannerData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(gap_m),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  eventMyPageBannerData.imageTitle,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
                ),
              ),
              SizedBox(width: 16), // 타이틀과 이미지 사이의 간격 조정
            ],
          ),
          SizedBox(height: 8), // 타이틀과 이미지 사이의 간격 조정
          Image.asset(
            eventMyPageBannerData.imagePath,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
          SizedBox(height: 8), // 이미지와 데드라인 사이의 간격 조정
          Row(
            children: [
              SizedBox(width: 16), // 데드라인을 이미지와 맞추기 위한 간격 조정
              Text(
                '일시 : ${eventMyPageBannerData.deadLine}',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
