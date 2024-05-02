import 'package:flutter/material.dart';
import 'package:yogi_project/data/models/home_banner.dart';
import 'package:yogi_project/ui/pages/home/widgets/home_banner_item.dart';
import 'package:yogi_project/_core/constants/size.dart';

class EventBannerPage extends StatefulWidget {
  final List<BannerData> bannerDataList;

  const EventBannerPage({Key? key, required this.bannerDataList}) : super(key: key);

  @override
  _EventBannerPageState createState() => _EventBannerPageState();
}

class _EventBannerPageState extends State<EventBannerPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("이벤트")),
      body: Center( // Center 추가
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(gap_s),
          ),
          child: Column(
            children: [
              for (int i = 0; i < widget.bannerDataList.length; i++)
                Column(
                  children: [
                    SizedBox(
                      width: 350,
                      height: 120,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(gap_s),
                        child: BannerItem(bannerData: widget.bannerDataList[i]),
                      ),
                    ),
                    SizedBox(height: gap_m),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
