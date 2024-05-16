import 'package:flutter/material.dart';
import 'package:yogi_project/_core/constants/move.dart';
import 'package:yogi_project/data/models/event_my_page_banner.dart';
import 'package:yogi_project/_core/constants/size.dart';
import 'package:yogi_project/ui/pages/my/event/event_detail_page.dart';

import 'widgets/event_my_page_banner_item.dart';

class EventMyPageBannerPage extends StatelessWidget {
  final List<EventMyPageBannerData> eventMyPageBannerDataList;

  const EventMyPageBannerPage({Key? key, required this.eventMyPageBannerDataList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("이벤트")),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(gap_s),
            ),
            child: Column(
              children: [
                for (int i = 0; i < eventMyPageBannerDataList.length; i++)
                  GestureDetector(
                    onTap: () {
                      // 이벤트 배너를 클릭하면 해당 이벤트의 세부 정보 페이지로 이동
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EventDetailPage(
                              BannerImagePath: eventContentBanners[i].eventImagePath
                          ),
                        ),
                      );
                    },
                    child: EventMyPageBannerItem(eventMyPageBannerData: eventMyPageBannerDataList[i]),
                  ),
                SizedBox(height: gap_m),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
