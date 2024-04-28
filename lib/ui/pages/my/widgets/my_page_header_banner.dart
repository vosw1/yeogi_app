import 'package:flutter/material.dart';
import 'package:yogi_project/_core/constants/size.dart';

// 마이페이지 상단 회원가입/로그인 버튼 위 이미지
class MyPageHeaderBanner extends StatelessWidget {
  const MyPageHeaderBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: gap_m),
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.12,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Image.asset(
            "assets/images/LE SSERAFIM1.jpg",
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
