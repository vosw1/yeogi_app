import 'package:flutter/material.dart';
import 'package:yogi_project/_core/constants/size.dart';
import 'package:yogi_project/data/models/review.dart';
import 'ReviewWidget.dart';

class ReviewSection extends StatelessWidget {
  final List<Review> reviews;

  ReviewSection({required this.reviews});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '리뷰',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
              final starRating = review.rating / 5.0 * 5.0;
              return GestureDetector(
                onTap: () {
                  _showReviewPopup(context, reviews);
                },
                child: ReviewWidget(
                  stars: starRating,
                  comment: review.comment,
                ),
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

  void _showReviewPopup(BuildContext context, List<Review> reviews) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('리뷰 상세'),
          content: SizedBox(
            width: double.maxFinite,
            height: 400, // 필요한 높이에 맞게 조정하세요
            child: ListView.builder(
              itemCount: reviews.length,
              itemBuilder: (context, index) {
                final review = reviews[index];
                final starRating = review.rating / 5.0 * 5.0;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        for (int i = 0; i < 5; i++)
                          Icon(
                            i < starRating ? Icons.star : Icons.star_border,
                            color: Colors.yellow,
                          ),
                        SizedBox(width: 8),
                        Text('${starRating.toStringAsFixed(1)} 점'),
                      ],
                    ),
                    SizedBox(height: gap_s),
                    Text(review.comment),
                    SizedBox(height: gap_s),
                    Divider(),
                  ],
                );
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('닫기'),
            ),
          ],
        );
      },
    );
  }
}
