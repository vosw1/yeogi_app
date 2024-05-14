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
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => StayDetailPage(stayId: stay.id),
              ),
            );
          },
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
                        style: h5(),
                      ),
                      SizedBox(height: gap_xx),
                      Text(
                        stay.address,
                        style: TextStyle(
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                      SizedBox(height: gap_s),
                      Text(
                        stay.intro,
                        style: TextStyle(
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
