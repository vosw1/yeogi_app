import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../_core/constants/size.dart';
import '../../../../data/models/review.dart';
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
              // 레이팅을 별로 변환
              final starRating = review.rating / 5.0 * 5.0;
              return GestureDetector(
                onTap: () {
                  _showReviewPopup(context, starRating, review.comment);
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

  void _showReviewPopup(BuildContext context, double starRating, String comment) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('리뷰 상세'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Icon(Icons.star, color: Colors.yellow),
                  SizedBox(width: 8),
                  Text('별점: ${starRating.toStringAsFixed(1)}'),
                ],
              ),
              SizedBox(height: gap_s),
              Text(comment),
            ],
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
