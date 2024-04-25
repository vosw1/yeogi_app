import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../../../size.dart';
import '../../../style.dart';
import '../../components/data/home_item_data.dart';

// 해외 예약내역 기본 틀
class HomeAbroadItem extends StatelessWidget {
  final ItemData homeAbroadItemData;

  HomeAbroadItem({Key? key, required this.homeAbroadItemData}) : super(key: key);

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
            _buildPopularItemStar(homeAbroadItemData.starCount), // 별점
            SizedBox(height: gap_s),
            _buildPopularItemComment(), // 리뷰
            SizedBox(height: gap_s),
            _buildPopularItemUserInfo(homeAbroadItemData.userImgTitle), //프로필 사진
          ],
        ),
      ),
    );
  }

  // 숙소 이미지
  Widget _buildPopularItemImage() {
    return SizedBox(
      height: 210,
      width: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          "assets/images/${homeAbroadItemData.stayImgTitle}",
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }

  // 별점
  Widget _buildPopularItemStar(double starCount) {
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

  Widget _buildPopularItemComment() { // 리뷰
    return Container(
      constraints: BoxConstraints(minHeight: 50),
      child: Text(
        homeAbroadItemData.comment,
        style: body1(),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  // 사용자 프로필 사진제목 -> 경로로 가져오기
  Widget _buildPopularItemUserInfo(String imgTitle) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundImage: AssetImage("assets/images/${homeAbroadItemData.userImgTitle}"),
        ),
        SizedBox(width: gap_m),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              homeAbroadItemData.userName,
              style: subtitle1(),
            ),
            Text(homeAbroadItemData.location),
          ],
        )
      ],
    );
  }
}
