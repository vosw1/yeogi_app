import 'dart:html';

import 'package:flutter/material.dart';
import '../../../../_core/constants/color.dart';
import '../../../../_core/constants/size.dart';
import '../../../../_core/constants/style.dart';
import '../../../../data/models/stay.dart';

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
            _buildItemStar(stayData.starCount),
            SizedBox(height: gap_s),
            _buildItemComment(stayData.comment), // commentData 사용
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
          "assets/images/${stayData.stayImgTitle}",
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
        SizedBox(width: 4),
        Text(
          '$starCount 점',
          style: TextStyle(color: Colors.black),
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

  Widget _buildItemUserInfo(String userName, String location) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              userName,
              style: subtitle1(),
            ),
            Container(
              constraints: BoxConstraints(minHeight: 40),
              child: Text(
                location,
                style: subtitle1(),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        )
      ],
    );
  }
}
