import 'package:flutter/material.dart';
import '../../components/data/banner_data.dart';

class HomeBannerPage extends StatelessWidget {
  final BannerData bannerData;

  const HomeBannerPage({Key? key, required this.bannerData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( // 상단 앱바(페이지 제목)
          title: Text('배너 페이지')
      ),
    );
  }
}

