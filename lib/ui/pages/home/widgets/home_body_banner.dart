import 'package:flutter/material.dart';
import 'package:yogi_project/_core/constants/move.dart';
import 'package:yogi_project/_core/constants/size.dart';
import 'package:yogi_project/data/models/event_title_banner.dart';
import 'home_banner_item.dart';
import 'package:yogi_project/ui/pages/my/event/event_detail_page.dart'; // EventDetailPage 임포트

class HomeBodyBanner extends StatefulWidget {
  final List<EventTitleBannerData> eventTitleBannerDataList; // 타입 변경

  const HomeBodyBanner({Key? key, required this.eventTitleBannerDataList}) : super(key: key);

  @override
  _HomeBodyBannerState createState() => _HomeBodyBannerState();
}

class _HomeBodyBannerState extends State<HomeBodyBanner> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView.builder(
            controller: _pageController,
            itemCount: widget.eventTitleBannerDataList.length,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              return GestureDetector( // GestureDetector로 수정
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EventDetailPage(
                        BannerImagePath: eventContentBanners[index].eventImagePath,
                      ),
                    ),
                  );
                },
                child: HomeBannerItem(bannerData: widget.eventTitleBannerDataList[index]),
              );
            },
          ),
        ),
        SizedBox(height: gap_m),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            widget.eventTitleBannerDataList.length,
                (index) => Container(
              width: 8,
              height: 8,
              margin: EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: index == _currentPage ? Colors.blue : Colors.grey,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
