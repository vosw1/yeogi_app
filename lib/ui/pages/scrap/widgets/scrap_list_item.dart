import 'package:flutter/material.dart';
import 'package:yogi_project/_core/constants/size.dart';
import 'package:yogi_project/_core/constants/style.dart';
import 'package:yogi_project/data/models/scrap.dart';
import 'package:yogi_project/ui/pages/stay/stay_detail_page.dart';

class ScrapListItem extends StatelessWidget {
  final Scrap scrap; // Scrap 데이터를 받아올 변수 추가

  const ScrapListItem({required this.scrap}); // 생성자 추가

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: gap_m, left: gap_m, right: gap_m),
        child: Row(
          children: [
            SizedBox(height: gap_xs),
            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => StayDetailPage(stayId: scrap.stayId),
                    ),
                  );
                },
                child: Container(
                  height: 120, // 사진의 높이
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage("assets${scrap.stayImagePath}"), // 이미지 경로
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: 8), // 사진과 텍스트 사이 간격
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity, // 화면 너비에 맞추기 위해 사용
                    child: Text(
                      scrap.stayName,
                      style: h5(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(height: 4), // 텍스트 사이 간격
                  Text(
                    scrap.stayAddress, // 숙소 위치
                    style: subtitle1(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4), // 텍스트 사이 간격
                  Text(
                    scrap.stayIntro, // 숙소 정보
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}