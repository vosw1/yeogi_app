import 'package:flutter/material.dart';
import 'package:yogi_project/_core/constants/size.dart';
import 'package:yogi_project/data/models/review.dart';
import 'package:yogi_project/ui/pages/stay/widgets/review_popup.dart';

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
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(height: gap_s),
        reviews.isEmpty
            ? Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Center(
            child: Text(
              '리뷰가 없습니다',
              style: TextStyle(fontSize: 16),
            ),
          ),
        )
            : Container(
          height: 160,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: reviews.length,
            itemBuilder: (context, index) {
              final review = reviews[index];
              final starRating = review.reviewScore / 5.0 * 5.0;
              return GestureDetector(
                onTap: () {
                  _showReviewPopup(context, index);
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: gap_xx),
                    ReviewWidget(
                      stars: starRating,
                      comment: review.reviewContent,
                      userName: review.userName,
                      imagePath: review.userImgTitle,
                      rating: review.reviewScore, // 추가된 부분
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        SizedBox(height: gap_xs),
        Divider(),
        SizedBox(height: gap_s),
      ],
    );
  }

  void _showReviewPopup(BuildContext context, int initialIndex) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ReviewPopup(reviews: reviews, initialIndex: initialIndex);
      },
    );
  }
}
