import 'package:flutter/material.dart';
import 'package:yogi_project/_core/constants/move.dart';
import 'package:yogi_project/_core/constants/size.dart';
import 'package:yogi_project/_core/constants/style.dart';
import 'package:yogi_project/data/models/stay.dart';
import 'package:yogi_project/ui/pages/stay/stay_detail_page.dart';

class SearchResultList extends StatelessWidget {
  final Stay stayData;

  const SearchResultList({required this.stayData, required List<String> searchResults});

  @override
  Widget build(BuildContext context) {
    List<Stay> stayDataList = [
      Stay(
        stayImgTitle: "assets/images/hotel/hotel6.png",
        stayName: "제주의 아침",
        stayInfo: "ㅇ",
        location: "제주도",
        notice: "여기요는..",
        reviews: [
          {
            'starCount': 4,
            'comment': "역시 제주도~ 귤 나무들도 너무 예뻤고 산책로도 있어서 너무 좋았어요!!",
          },
          {
            'starCount': 5,
            'comment': "너무 좋았어요.",
          },
        ],
      ),
      Stay(
        stayImgTitle: "assets/images/hotel/hotel6.png",
        stayName: "제주의 아침",
        stayInfo: "ㅇ",
        location: "제주도",
        notice: "여기요는..",
        reviews: [
          {
            'starCount': 4,
            'comment': "역시 제주도~ 귤 나무들도 너무 예뻤고 산책로도 있어서 너무 좋았어요!!",
          },
          {
            'starCount': 5,
            'comment': "너무 좋았어요.",
          },
        ],
      ),
      Stay(
        stayImgTitle: "assets/images/hotel/hotel6.png",
        stayName: "제주의 아침",
        stayInfo: "ㅇ",
        location: "제주도",
        notice: "여기요는..",
        reviews: [
          {
            'starCount': 4,
            'comment': "역시 제주도~ 귤 나무들도 너무 예뻤고 산책로도 있어서 너무 좋았어요!!",
          },
          {
            'starCount': 5,
            'comment': "너무 좋았어요.",
          },
        ],
      ),
    ];

    return Expanded(
      child: stayDataList.isEmpty
          ? Center(
        child: Text(
          '검색 결과가 없습니다.',
          style: TextStyle(fontSize: 18),
        ),
      )
          : ListView.builder(
        itemCount: stayDataList.length,
        itemBuilder: (context, index) {
          final stayData = stayDataList[index];
          return ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(gap_s),
              child: Image.asset(
                stayData.stayImgTitle, // 에셋 이미지 경로
                width: 100,
                height: 120,
                fit: BoxFit.cover,
              ),
            ),
            title: Text(stayData.stayName, style: subtitle1()),
            subtitle: Text('${stayData.location}', style: subtitle1()),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      StayDetailPage(stayData: stayData, roomData: roomData),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
