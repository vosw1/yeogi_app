import 'package:flutter/material.dart';
import 'package:yogi_project/_core/constants/move.dart';
import 'package:yogi_project/_core/constants/size.dart';
import 'package:yogi_project/data/models/event_title_banner.dart';
import 'package:yogi_project/ui/pages/my/event/event_detail_page.dart';
import 'package:yogi_project/ui/pages/my/event/widgets/event_title_banner_item.dart';

class EventTitleBannerPage extends StatelessWidget {
  final List<EventTitleBannerData> eventTitleBannerDataList;

  const EventTitleBannerPage({Key? key, required this.eventTitleBannerDataList}) : super(key: key);

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
                for (int i = 0; i < eventTitleBannerDataList.length; i++)
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EventDetailPage(
                              BannerImagePath: eventContentBanners[i].eventImagePath,
                          ),
                        ),
                      );
                    },
                    child: EventTitleBannerItem(eventTitleBannerData: eventTitleBannerDataList[i]),
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
