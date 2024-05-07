import 'package:flutter/material.dart';
import 'package:yogi_project/_core/constants/size.dart';
import 'package:yogi_project/_core/constants/style.dart';
import 'package:yogi_project/data/models/review.dart';

class ReviewPopup extends StatefulWidget {
  final List<Review> reviews;
  final int initialIndex;

  ReviewPopup({required this.reviews, required this.initialIndex});

  @override
  _ReviewPopupState createState() => _ReviewPopupState();
}

class _ReviewPopupState extends State<ReviewPopup> {
  late PageController _pageController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.initialIndex);
    _currentIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        children: [
          Expanded(
            child: Text(
              '리뷰',
              textAlign: TextAlign.left,
            ),
          ),
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      content: SizedBox(
        width: double.maxFinite,
        height: 400,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: widget.reviews.length, // 모든 리뷰를 표시하기 위해 itemCount 수정
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  final Review review = widget.reviews[index];
                  return _buildReviewContent(review);
                },
              ),
            ),
            SizedBox(height: 8),
            _buildIndicator(),
          ],
        ),
      ),
    );
  }

  Widget _buildReviewContent(Review review) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: _buildUserInfo(review.userName, review.userImgTitle),
        ),
        Row(
          children: [
            for (int i = 0; i < 5; i++)
              Icon(
                i < review.rating ? Icons.star : Icons.star_border,
                color: Colors.redAccent,
              ),
            SizedBox(width: 8),
            Text('${review.rating.toStringAsFixed(1)} 점'),
          ],
        ),
        SizedBox(height: gap_s),
        SingleChildScrollView(
          child: Text(review.comment),
        ),
        SizedBox(height: gap_s),
        Divider(),
        // 대댓글 표시
        ListView.builder(
          shrinkWrap: true,
          itemCount: review.replies.length,
          itemBuilder: (context, index) {
            final subComment = review.replies[index];
            return Padding(
              padding: const EdgeInsets.all(gap_s),
              child: Row(
                children: [
                  Icon(
                    Icons.subdirectory_arrow_right,
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Text(subComment.comment),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  // 사용자 정보 표시 위젯
  Widget _buildUserInfo(String userName, String userImgTitle) {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: AssetImage('assets/images/$userImgTitle'),
        ),
        SizedBox(width: gap_s),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              userName,
              style: subtitle1(),
            ),
          ],
        )
      ],
    );
  }

  // 인디케이터 위젯
  Widget _buildIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        widget.reviews.length,
            (index) => Container(
          margin: EdgeInsets.symmetric(horizontal: 4.0),
          width: 8.0,
          height: 8.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _currentIndex == index ? Colors.redAccent : Colors.grey,
          ),
        ),
      ),
    );
  }
}
