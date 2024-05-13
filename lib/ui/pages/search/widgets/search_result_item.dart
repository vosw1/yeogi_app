import 'package:flutter/material.dart';
import 'package:yogi_project/_core/constants/move.dart';
import 'package:yogi_project/_core/constants/size.dart';
import 'package:yogi_project/_core/constants/style.dart';
import 'package:yogi_project/data/models/stay.dart';
import 'package:yogi_project/ui/pages/stay/stay_detail_page.dart';

class SearchResultItem extends StatelessWidget {
  final Stay stay;

  const SearchResultItem({required this.stay});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: gap_m),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(gap_s),
          border: Border.all(
            color: Colors.grey[300]!,
            width: 1,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(gap_s),
          child: Row(
            children: [
              // 이미지
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(gap_s),
                  image: DecorationImage(
                    image: AssetImage('assets${stay.imagePath}'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: gap_s), // 이미지와 텍스트 사이 간격 조절
              // 객실 정보 표시
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      stay.name,
                      style: subtitle1(),
                    ),
                    SizedBox(height: gap_s),
                    Text(
                      stay.intro,
                      style: subtitle1(),
                    ),
                  ],
                ),
              ),
              SizedBox(width: gap_s), // 텍스트와 버튼 사이 간격 조절
              // 상세보기 버튼
              SizedBox(
                width: 70, // 버튼의 너비를 설정하여 텍스트가 한 줄로 표시되도록 함
                child: ElevatedButton(
                  onPressed: () {
                    // 상세보기 페이지로 이동
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        // TODO: 수정 필요
                        builder: (context) => StayDetailPage(stayId: 0),
                      ),
                    );
                  },
                  child: Text('상세보기', style: subtitle2(mColor: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero, // 버튼 내부의 패딩 제거
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20), // 버튼의 모양을 더 둥글게 만듦
                    ),
                    backgroundColor: Colors.redAccent,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
