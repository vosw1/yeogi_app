import 'package:flutter/material.dart';
import 'package:yogi_project/data/models/event_title_banner.dart';
import 'package:yogi_project/_core/constants/size.dart';

import 'event_title_banner_item.dart';

class EventTitleBannerPage extends StatelessWidget {
  final List<EventTitleBannerData> eventTitleBannerDataList;

  const EventTitleBannerPage({Key? key, required this.eventTitleBannerDataList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("이벤트")),
      body: SingleChildScrollView( // 스크롤 가능한 위젯으로 변경
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(gap_s),
            ),
            child: Column(
              children: [
                for (int i = 0; i < eventTitleBannerDataList.length; i++)
                  EventTitleBannerItem(eventTitleBannerData: eventTitleBannerDataList[i]),
                SizedBox(height: gap_m),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
