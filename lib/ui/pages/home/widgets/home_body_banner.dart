import 'package:flutter/material.dart';
import '../../../../_core/constants/size.dart';
import '../../../../data/models/home_banner.dart';
import 'home_banner_item.dart';

class HomeBodyBanner extends StatefulWidget {
  final List<BannerData> bannerDataList;

  const HomeBodyBanner({Key? key, required this.bannerDataList}) : super(key: key);

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
            itemCount: widget.bannerDataList.length,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              return BannerItem(bannerData: widget.bannerDataList[index]);
            },
          ),
        ),
        SizedBox(height: gap_m),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            widget.bannerDataList.length,
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
