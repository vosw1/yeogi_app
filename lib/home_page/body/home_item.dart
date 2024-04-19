import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../../../size.dart';
import '../../../style.dart';
import '../../components/common/set_item_data.dart';

class HomeItem extends StatelessWidget {
  final ItemData itemData;

  HomeItem({Key? key, required this.itemData}) : super(key: key);

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
            _buildItemImage(itemData.imagePath),
            SizedBox(height: gap_s),
            _buildItemStar(itemData.starCount),
            SizedBox(height: gap_s),
            _buildItemComment(itemData.comment),
            SizedBox(height: gap_s),
            _buildItemUserInfo(itemData.userName, itemData.location, itemData.imgTitle),
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
          imagePath,
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }

  Widget _buildItemStar(double starCount) {
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



  Widget _buildItemComment(String comment) {
    return Container(
      constraints: BoxConstraints(minHeight: 50),
      child: Text(
        comment,
        style: body1(),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _buildItemUserInfo(String userName, String location, String imgTitle) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundImage: AssetImage("assets/images/${imgTitle}.png"),
        ),
        SizedBox(width: gap_m),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              userName,
              style: subtitle1(),
            ),
            Text(location),
          ],
        )
      ],
    );
  }
}
