import 'package:flutter/material.dart';
import 'package:yogi_project/data/models/user.dart';
import '../../../../_core/constants/color.dart';
import '../../../../_core/constants/size.dart';
import '../../../../_core/constants/style.dart';
import '../../../../data/models/payment.dart';
import '../../../../data/models/stay.dart';

// 국내 숙소 기본 틀
class DomesticStayItem extends StatelessWidget {
  final Stay stayData;
  final User userData;

  DomesticStayItem({required this.userData, required this.stayData});

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
            _buildPopularItemImage(), // 숙소 이미지
            SizedBox(height: gap_s),
           //_buildPopularItemStar(stayData.starCount), // 별점
            SizedBox(height: gap_s),
            //_buildPopularItemComment(), // 리뷰
            SizedBox(height: gap_s),
            _buildPopularItemUserInfo(userData.userImgTitle), // 유저정보
          ],
        ),
      ),
    );
  }

  Widget _buildPopularItemImage() { // 숙소 이미지
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

  Widget _buildPopularItemStar(double starCount) { // 별점
    int fullStars = starCount.floor();
    double halfStar = starCount - fullStars;

    return Row(
      children: [
        for (int i = 0; i < fullStars; i++)
          Icon(Icons.star, color: kAccentColor),
        if (halfStar > 0.0)
          Icon(Icons.star_half, color: kAccentColor),
        SizedBox(width: 4), // 별과 텍스트 사이의 간격 조정
        Text(
          '$starCount 점',
          style: TextStyle(color: Colors.black), // 검정색 글자로 표시
        ),
      ],
    );
  }

  // Widget _buildPopularItemComment() { // 리뷰
  //   return Container(
  //     constraints: BoxConstraints(minHeight: 50),
  //     child: Text(
  //       ///stayData.comment,
  //       style: body1(),
  //       maxLines: 2,
  //       overflow: TextOverflow.ellipsis,
  //     ),
  //   );
  // }

  Widget _buildPopularItemUserInfo(String imgTitle) { // 유저 정보
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundImage: AssetImage("assets/images/${userData.userImgTitle}"),
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