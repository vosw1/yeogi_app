import 'package:flutter/material.dart';
import 'package:yogi_project/_core/constants/size.dart';

import 'ReviewWidget.dart';

class ReviewSection extends StatelessWidget {
  final double stars;
  final String comment;

  const ReviewSection({Key? key, required this.stars, required this.comment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('리뷰', style: Theme.of(context).textTheme.headline6),
        SizedBox(height: gap_s),
        ReviewWidget(stars: stars.toInt(), comment: comment),
        SizedBox(height: gap_s),
      ],
    );
  }
}
