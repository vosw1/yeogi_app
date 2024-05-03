import 'package:flutter/material.dart';
import 'package:yogi_project/data/models/event_my_page_banner.dart';
import 'package:yogi_project/data/models/event_title_banner.dart';
import 'package:yogi_project/_core/constants/size.dart';
import 'package:yogi_project/ui/pages/event/event_my_page_banner_item.dart';
import 'package:yogi_project/ui/pages/event/event_title_banner_item.dart';

class EventMyPageBannerPage extends StatelessWidget {
  final List<EventMyPageBannerData> eventMyPageBannerDataList;

  const EventMyPageBannerPage({Key? key, required this.eventMyPageBannerDataList}) : super(key: key);

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
                for (int i = 0; i < eventMyPageBannerDataList.length; i++)
                  EventMyPageBannerItem(eventMyPageBannerData: eventMyPageBannerDataList[i]),
                SizedBox(height: gap_m),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
