import 'package:flutter/material.dart';
import 'package:yogi_project/_core/constants/color.dart';
import 'package:yogi_project/_core/constants/size.dart';
import 'package:yogi_project/_core/constants/style.dart';
import 'package:yogi_project/data/models/reply.dart';
import 'package:yogi_project/data/models/review.dart';
import 'package:yogi_project/data/models/stay.dart';

class HomeItem extends StatelessWidget {
  final Stay stayData;

  HomeItem({required this.stayData});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minWidth: 320,
        minHeight: 320,
        maxHeight: 320,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: gap_m, right: gap_m),
        child: Column(
          children: [
            SizedBox(height: gap_s),
            _buildItemImage(stayData.stayImgTitle),
            SizedBox(height: gap_s),
            _buildItemStar(stayData.reviews),
            SizedBox(height: gap_s),
            _buildItemComments(stayData.reviews),
          ],
        ),
      ),
    );
  }

  Widget _buildItemImage(String imagePath) {
    return SizedBox(
      height: 210,
      width: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          "assets/images/$imagePath",
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }

  Widget _buildItemStar(List<Review>? reviews) {
    if (reviews != null && reviews.isNotEmpty) {
      double totalStars = 0;
      for (var review in reviews) {
        totalStars += review.rating;
      }
      double averageStars = totalStars / reviews.length;

      int fullStars = averageStars.floor();
      double halfStar = averageStars - fullStars;

      return Row(
        children: [
          for (int i = 0; i < fullStars; i++)
            Icon(Icons.star, color: kAccentColor),
          if (halfStar > 0.0) Icon(Icons.star_half, color: kAccentColor),
          SizedBox(width: 4),
          Text(
            '${averageStars.toStringAsFixed(1)} 점',
            style: TextStyle(color: Colors.black),
          ),
        ],
      );
    } else {
      return Text(
        '리뷰가 없습니다',
        style: TextStyle(color: Colors.black),
      );
    }
  }

  Widget _buildItemComments(List<Review>? reviews) {
    if (reviews != null && reviews.isNotEmpty) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (var review in reviews) ...[
            _buildReviewComment(review),
            if (review.replies.isNotEmpty)
              for (var reply in review.replies) _buildReplyComment(reply as Reply), // Pass each reply
          ],
        ],
      );
    } else {
      return Text(
        '리뷰가 없습니다',
        style: TextStyle(color: Colors.black),
      );
    }
  }

  Widget _buildReviewComment(Review review) {
    return Container(
      constraints: BoxConstraints(minHeight: 50),
      child: Text(
        review.comment,
        style: body1(),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _buildReplyComment(Reply reply) {
    return Container(
      constraints: BoxConstraints(minHeight: 50),
      child: Text(
        reply.text,
        style: body1(),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
