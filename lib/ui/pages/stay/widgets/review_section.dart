import 'package:flutter/material.dart';
import 'package:yogi_project/_core/constants/size.dart';
import '../../../../_core/constants/style.dart';
import 'ReviewWidget.dart';

class ReviewSection extends StatelessWidget {
  final List<Map<String, dynamic>> reviews;

  ReviewSection({required this.reviews});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '리뷰',
          style: h6(),
        ),
        SizedBox(height: gap_s),
        reviews.isEmpty
            ? Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            '리뷰가 없습니다',
            style: TextStyle(fontSize: 16),
          ),
        )
            : Container(
          height: 120,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: reviews.length,
            itemBuilder: (context, index) {
              final review = reviews[index];
              // stars 값을 double로 변환하여 전달
              final stars = (review['stars'] as num?)?.toDouble() ?? 0.0;
              final comment = review['comment'] as String;
              return ReviewWidget(
                stars: stars,
                comment: comment,
              );
            },
          ),
        ),
        SizedBox(height: gap_s),
        Divider(),
        SizedBox(height: gap_s),
      ],
    );
  }
}
