import 'package:flutter/material.dart';
import '../../../../_core/constants/color.dart';
import '../../../../_core/constants/size.dart';
import '../../../../_core/constants/style.dart';
import '../../../../data/models/stay.dart';

class Stay {
  final String stayImgTitle; // 숙소 이미지 제목
  final String stayName; // 숙소 이름
  final String stayInfo; // 숙소 소개
  final String location; // 위치
  final String notice; // 이용공지
  final List<Map<String, dynamic>>? reviews; // 리뷰 리스트

  Stay({
    required this.stayImgTitle,
    required this.stayName,
    required this.stayInfo,
    required this.location,
    required this.notice,
    required this.reviews,
  });

  // Convert Stay object to JSON
  Map<String, dynamic> toJson() {
    return {
      "stayImgTitle": stayImgTitle,
      "stayName": stayName,
      "stayInfo": stayInfo,
      "location": location,
      "notice": notice,
      "reviews": reviews,
    };
  }

}

class Review {
  final double starCount;
  final String comment;

  Review({
    required this.starCount,
    required this.comment,
  });

  // Convert Review object to JSON
  Map<String, dynamic> toJson() {
    return {
      "starCount": starCount,
      "comment": comment,
    };
  }
}

class OverseasBookItem extends StatelessWidget {
  final Stay stayData;

  OverseasBookItem({Key? key, required this.stayData})
      : super(key: key);

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
            _buildPopularItemImage(),
            SizedBox(height: gap_s),
            _buildPopularItemStar(stayData.reviews),
            SizedBox(height: gap_s),
            _buildPopularItemComment(stayData.reviews),
          ],
        ),
      ),
    );
  }

  Widget _buildPopularItemImage() {
    return SizedBox(
      height: 210,
      width: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          "assets/images/${stayData.stayImgTitle}",
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }

  Widget _buildPopularItemStar(List<Map<String, dynamic>>? reviews) {
    if (reviews != null && reviews.isNotEmpty) {
      double totalStarCount = 0;
      for (var review in reviews) {
        totalStarCount += review['starCount'];
      }
      double averageStarCount = totalStarCount / reviews.length;
      int fullStars = averageStarCount.floor();
      double halfStar = averageStarCount - fullStars;

      return Row(
        children: [
          for (int i = 0; i < fullStars; i++)
            Icon(Icons.star, color: kAccentColor),
          if (halfStar > 0.0) Icon(Icons.star_half, color: kAccentColor),
          SizedBox(width: 4),
          Text(
            '$averageStarCount 점',
            style: TextStyle(color: Colors.black),
          ),
        ],
      );
    } else {
      return Container(
        constraints: BoxConstraints(minHeight: 50),
        child: Text(
          "리뷰가 없습니다",
          style: body1(),
        ),
      );
    }
  }

  Widget _buildPopularItemComment(List<Map<String, dynamic>>? reviews) {
    if (reviews != null && reviews.isNotEmpty) {
      // 여기에서 원하는 리뷰를 선택하거나 추출하는 로직을 구현합니다.
      // 이 예시에서는 첫 번째 리뷰를 선택했습니다.
      String comment = reviews.first['comment'];
      return Container(
        constraints: BoxConstraints(minHeight: 50),
        child: Text(
          comment,
          style: body1(),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      );
    } else {
      return Container(
        constraints: BoxConstraints(minHeight: 50),
        child: Text(
          "리뷰가 없습니다",
          style: body1(),
        ),
      );
    }
  }
}