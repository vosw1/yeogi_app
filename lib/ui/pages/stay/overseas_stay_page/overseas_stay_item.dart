import 'package:flutter/material.dart';
import '../../../../_core/constants/color.dart';
import '../../../../_core/constants/size.dart';
import '../../../../_core/constants/style.dart';
import '../../../../data/models/stay.dart'; // Import Stay model
import '../../../../data/models/user.dart';

class OverseasBookItem extends StatelessWidget {
  final Stay stayData; // Corrected Stay model import
  final User userData;

  OverseasBookItem({Key? key, required this.stayData, required this.userData}) : super(key: key);

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
            _buildPopularItemImage(), // 사진 이미지
            SizedBox(height: gap_s),
            _buildPopularItemStar(stayData.starCount), // 별점
            SizedBox(height: gap_s),
            _buildPopularItemComment(), // 리뷰
            SizedBox(height: gap_s),
            _buildPopularItemUserInfo(userData.userImgTitle), //프로필 사진
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

  Widget _buildPopularItemStar(double starCount) {
    int fullStars = starCount.floor();
    double halfStar = starCount - fullStars;

    return Row(
      children: [
        for (int i = 0; i < fullStars; i++)
          Icon(Icons.star, color: kAccentColor),
        if (halfStar > 0.0)
          Icon(Icons.star_half, color: kAccentColor),
        SizedBox(width: 4),
        Text(
          '$starCount 점',
          style: TextStyle(color: Colors.black),
        ),
      ],
    );
  }

  Widget _buildPopularItemComment() {
    return Container(
      constraints: BoxConstraints(minHeight: 50),
      child: Text(
        "${stayData.comment}",
        style: body1(),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _buildPopularItemUserInfo(String imgTitle) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundImage: AssetImage("assets/images/$imgTitle"), // Corrected usage of imgTitle
        ),
        SizedBox(width: gap_m),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              userData.userName,
              style: subtitle1(),
            ),
            Text(stayData.location),
          ],
        )
      ],
    );
  }
}
