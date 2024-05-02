import 'package:flutter/material.dart';
import 'package:yogi_project/_core/constants/size.dart';

class ReviewWidget extends StatelessWidget {
  final double stars;
  final String comment;

  ReviewWidget({required this.stars, required this.comment});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
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
            // 별점 표시
            // ReviewWidget에서 별점 표시 부분 수정
            Row(
              children: List.generate(
                5,
                    (index) => Icon(
                  index < stars ? Icons.star : Icons.star_border,
                  color: Colors.amber,
                  size: gap_m,
                ),
              ),
            ),
            SizedBox(height: gap_s),
            // 코멘트 표시
            Text(
              comment,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
