import 'package:flutter/material.dart';
import 'package:yogi_project/_core/constants/size.dart';

import '../../../../_core/constants/style.dart';
import 'ReviewWidget.dart';

class ReviewSection extends StatelessWidget {
  final int stars;
  final String comment;

  ReviewSection({required this.stars, required this.comment});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '리뷰',
          style: h6(),
        ),
        SizedBox(height: gap_s),
        Container(
          height: 120,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 1,
            itemBuilder: (context, index) {
              return ReviewWidget(stars: stars.toInt(), comment: comment);
            },
          ),
        ),
        SizedBox(height: gap_s),
        Divider(),
        SizedBox(height: gap_s),
      ],
    );
  }
}