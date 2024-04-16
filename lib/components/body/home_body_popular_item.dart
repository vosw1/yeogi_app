import 'package:flutter/material.dart';
import '../../size.dart';
import '../../style.dart';

class HomeBodyBanner extends StatelessWidget {
  const HomeBodyBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: gap_xm),
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
            "assets/images/body_banner.jpg",
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
              _buildCaptionText("여행은 여기어때?", h4(mColor: Colors.redAccent)),
              SizedBox(height: gap_xs),
              _buildCaptionText(
                "다양한 목적에 맞는 숙소를 찾아보세요.",
                subtitle1(mColor: Colors.black),
              ),
              SizedBox(height: gap_xs),
              _buildButton("가까운 여행지 둘러보기", () {}),
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

  Widget _buildButton(String text, VoidCallback onPressed) {
    return SizedBox(
      height: 35,
      width: 150,
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: subtitle2(),
        ),
        style: TextButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
    );
  }
}
