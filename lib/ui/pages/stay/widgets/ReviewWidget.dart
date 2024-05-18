import 'package:flutter/material.dart';
import 'package:yogi_project/_core/constants/size.dart';
import 'package:yogi_project/_core/constants/style.dart';

class ReviewWidget extends StatelessWidget {
  final double stars;
  final String comment;
  final String userName;
  final String imagePath;
  final rating;

  ReviewWidget({
    required this.stars,
    required this.comment,
    required this.userName,
    required this.imagePath,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 150,
      margin: EdgeInsets.only(right: gap_m),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(gap_s),
        color: Colors.grey[200],
      ),
      child: Padding(
        padding: EdgeInsets.all(gap_s),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 사용자 정보 표시
            _buildReviewUserInfo(),
            SizedBox(height: gap_xs),
            // 별점 표시
            Row(
              children: [
                Row(
                  children: List.generate(
                    5,
                    (index) => Icon(
                      index < stars ? Icons.star : Icons.star_border,
                      color: Colors.redAccent,
                      size: gap_m,
                    ),
                  ),
                ),
                SizedBox(width: gap_xs), // 별 아이콘과 텍스트 사이의 간격 조정
                Text(
                  '${rating.toStringAsFixed(1)} 점',
                  style: TextStyle(
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
            SizedBox(height: gap_xs),
            // 코멘트 표시
            Text(
              comment,
              style: TextStyle(
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReviewUserInfo() {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: AssetImage("assets/images/${imagePath}"),
        ),
        SizedBox(width: gap_s),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              userName,
              style: subtitle1(),
            ),
          ],
        )
      ],
    );
  }
}
