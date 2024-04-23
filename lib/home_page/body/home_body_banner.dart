import 'package:flutter/material.dart';
import 'package:yogi_project/components/data/set_banner_data.dart';
import '../../../size.dart';
import '../../../style.dart';

// 이벤트 배너 기본 틀
class HomeBodyBanner extends StatelessWidget {
  final BannerData bannerData; // 배너 데이터 저장 변수

  HomeBodyBanner(this.bannerData);

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
        ClipRRect( // 배너 이미지
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            "assets/images/${bannerData.imageTitle}", // 받은 배너 데이터의 이미지
            fit: BoxFit.fill,
            width: double.infinity,
            height: 180,
          ),
        ),
        Positioned(// 배너 text
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

  // 배너 text 기본 틀
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
