import 'package:flutter/material.dart';
import 'package:yogi_project/_core/constants/size.dart';
import 'package:yogi_project/_core/constants/style.dart';
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
          style: TextStyle(fontSize: 20),
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
          height: 160,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: reviews.length,
            itemBuilder: (context, index) {
              final review = reviews[index];
              final starRating = review.rating / 5.0 * 5.0;
              return GestureDetector(
                onTap: () {
                  _showReviewPopup(context, review);
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: gap_xx),
                    ReviewWidget(
                      stars: starRating,
                      comment: review.comment,
                      userName: review.userName,
                      userImgTitle: review.userImgTitle,
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

  void _showReviewPopup(BuildContext context, Review review) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ReviewPopup(review: review);
      },
    );
  }
}

class ReviewPopup extends StatelessWidget {
  final Review review;

  ReviewPopup({required this.review});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('리뷰'),
      content: SizedBox(
        width: double.maxFinite,
        height: 400,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 사용자 정보 표시
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: _buildUserInfo(review.userName, review.userImgTitle),
            ),
            // 별점 및 코멘트 표시
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    for (int i = 0; i < 5; i++)
                      Icon(
                        i < review.rating ? Icons.star : Icons.star_border,
                        color: Colors.redAccent,
                      ),
                    SizedBox(width: 8),
                    Text('${review.rating.toStringAsFixed(1)} 점'),
                  ],
                ),
                SizedBox(height: gap_s),
                SingleChildScrollView(
                  child: Text(review.comment),
                ),
              ],
            ),
            Divider(),
            // 대댓글 표시
            ListView.builder(
              shrinkWrap: true,
              itemCount: review.replies.length,
              itemBuilder: (context, index) {
                final subComment = review.replies[index];
                return Padding(
                  padding: const EdgeInsets.all(gap_s),
                  child: Row(
                    children: [
                      Icon(
                        Icons.subdirectory_arrow_right,
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Text(subComment.comment),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
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
  }

  // 사용자 정보 표시 위젯
  Widget _buildUserInfo(String userName, String userImgTitle) {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(userImgTitle),
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
