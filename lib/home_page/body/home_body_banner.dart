import 'package:flutter/material.dart';
import 'package:yogi_project/home_page/body/set_banner_data.dart';
import '../../../size.dart';
import '../../../style.dart';

class HomeBodyBanner extends StatelessWidget {
  final BannerData bannerData; // 배너 데이터를 저장할 변수를 추가합니다.

  HomeBodyBanner(this.bannerData); // 생성자를 수정하여 배너 데이터를 받도록 합니다.

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(gap_m),
          child: _buildBanner(context),
        ),
      ],
    );
  }

  Widget _buildBanner(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            bannerData.imagePath, // 받은 배너 데이터의 이미지 경로를 사용
            fit: BoxFit.fill,
            width: double.infinity,
            height: 180,
          ),
        ),
        Positioned(
          top: gap_xs,
          left: gap_m,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: gap_s),
              _buildCaptionText(bannerData.bannerTitle, h4(mColor: Colors.redAccent)), // 받은 배너 데이터의 제목을 사용합니다.
              SizedBox(height: gap_xs),
              _buildCaptionText(
                bannerData.bannerText, // 받은 배너 데이터의 설명을 사용
                subtitle1(mColor: Colors.black),
              ),
              SizedBox(height: gap_xs),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCaptionText(String text, TextStyle style) {
    return Container(
      constraints: BoxConstraints(maxWidth: 250),
      child: Text(
        text,
        style: style,
      ),
    );
  }
}
