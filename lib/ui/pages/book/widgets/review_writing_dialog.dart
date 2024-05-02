import 'package:flutter/material.dart';
import 'package:yogi_project/_core/constants/size.dart';
import 'package:yogi_project/ui/pages/stay/widgets/star_rating.dart';
import 'my_review_page.dart';

class ReviewWritingDialog extends StatefulWidget {
  @override
  _ReviewWritingDialogState createState() => _ReviewWritingDialogState();
}

class _ReviewWritingDialogState extends State<ReviewWritingDialog> {
  TextEditingController _reviewController = TextEditingController();

  double _rating = 0.0;

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
      content: Column(
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
          SizedBox(height: gap_m), // 별점과 리뷰 내용 사이 간격 추가
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
        ],
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent, // 배경색 레드 악센트
                foregroundColor: Colors.white, // 글자색 흰색
              ),
              onPressed: () {
                // 작성 완료 버튼 누를 때 동작하는 코드 추가
                Navigator.of(context).pop(); // 다이얼로그 닫기
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => MyReviewPage(), // 내 리뷰 페이지로 이동
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
