import 'package:flutter/material.dart';
import 'package:yogi_project/_core/constants/size.dart';

class ReviewWidget extends StatelessWidget {
  final double stars;
  final String comment;
  final List<String> replies;

  ReviewWidget({
    required this.stars,
    required this.comment,
    required this.replies,
  });

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
            // 원댓글 표시
            Text(
              comment,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            // 대댓글 표시
            if (replies.isNotEmpty) ...[
              SizedBox(height: gap_s),
              Text(
                "대댓글:",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: replies
                    .map((reply) => Padding(
                  padding: EdgeInsets.only(left: gap_s),
                  child: Text(reply),
                ))
                    .toList(),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
