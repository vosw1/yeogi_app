import 'package:flutter/material.dart';
import 'package:yogi_project/_core/constants/size.dart';
import 'package:yogi_project/data/models/my_review.dart';
import 'package:yogi_project/ui/pages/my/widgets/my_review_page.dart';
import 'package:yogi_project/ui/pages/stay/widgets/star_rating.dart';

class ReviewWritingDialog extends StatefulWidget {
  final MyReview? review;

  const ReviewWritingDialog({Key? key, this.review}) : super(key: key);

  @override
  _ReviewWritingDialogState createState() => _ReviewWritingDialogState();
}

class _ReviewWritingDialogState extends State<ReviewWritingDialog> {
  TextEditingController _reviewController = TextEditingController();
  double _rating = 0.0;

  @override
  void initState() {
    super.initState();
    if (widget.review != null) {
      _reviewController.text = widget.review!.reviews!.first['comment'];
      _rating = widget.review!.reviews!.first['starCount'].toDouble();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('리뷰 작성'),
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                StarRating(
                  onChanged: (rating) {
                    setState(() {
                      _rating = rating;
                    });
                  },
                  rating: _rating,
                ),
              ],
            ),
            SizedBox(height: gap_m),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(gap_s),
                border: Border.all(color: Colors.black),
              ),
              child: TextField(
                controller: _reviewController,
                decoration: InputDecoration(
                  labelText: '리뷰 내용',
                  contentPadding: EdgeInsets.all(gap_s),
                  border: InputBorder.none,
                ),
                maxLines: 5,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: gap_s),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '*30일 이내에만 작성 가능합니다.',
                  style: TextStyle(
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => MyReviewPage(),
                  ),
                );
              },
              child: Text('작성 완료'),
            ),
          ],
        ),
      ],
    );
  }

  @override
  void dispose() {
    _reviewController.dispose();
    super.dispose();
  }
}
