import 'package:flutter/material.dart';
import 'package:yogi_project/_core/constants/size.dart';
import 'package:yogi_project/_core/constants/style.dart';
import 'package:yogi_project/data/models/scrap.dart';
import 'package:yogi_project/ui/pages/stay/stay_detail_page.dart';

class ScrapListItem extends StatelessWidget {
  final Scrap scrap;

  const ScrapListItem({required this.scrap}); // 생성자 추가

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: gap_m, right: gap_m),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => StayDetailPage(stayId: scrap.stayId),
              ),
            );
          },
          child: Row(
            children: [
              SizedBox(height: gap_xs),
              Expanded(
                flex: 1,
                child: Container(
                  height: 120, // 사진의 높이
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage("assets${scrap.stayImagePath}"),
                      // 이미지 경로
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(width: gap_s), // 사진과 텍스트 사이 간격
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: gap_s),
                    Container(
                      width: double.infinity, // 화면 너비에 맞추기 위해 사용
                      child: Text(
                        scrap.stayName,
                        style: h5(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(height: gap_xx), // 텍스트 사이 간격
                    Text(
                      scrap.stayAddress, // 숙소 위치
                      style: TextStyle(
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: gap_s), // 텍스트 사이 간격
                    Text(
                      scrap.stayIntro,
                      style: TextStyle(
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.grey
                      ), // 숙소 정보
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
