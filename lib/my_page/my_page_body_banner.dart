import 'package:flutter/material.dart';
import 'package:yogi_project/_core/constants/size.dart';

// 고객센터 밑에 이미지
class MyPageBodyBanner extends StatelessWidget {
  const MyPageBodyBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: gap_m, bottom: gap_m),
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.20,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Image.asset(
            "assets/images/IDLE3.jpg",
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
