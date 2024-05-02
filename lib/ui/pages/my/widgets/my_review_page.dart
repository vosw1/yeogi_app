import 'package:flutter/material.dart';
import 'package:yogi_project/data/models/my_review.dart';

class MyReviewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 가짜 데이터 예시
    List<MyReview> myReviews = [
      MyReview(
        accommodationName: '좋은 숙소',
        checkInDate: '2024년 5월 15일',
        reviewContent: '좋은 서비스에 만족합니다.',
      ),
      MyReview(
        accommodationName: '훌륭한 숙소',
        checkInDate: '2024년 5월 20일',
        reviewContent: '쾌적한 환경과 친절한 스태프가 좋았어요.',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('내 리뷰'),
      ),
      body: ListView.builder(
        itemCount: myReviews.length,
        itemBuilder: (context, index) {
          final review = myReviews[index];
          return ListTile(
            title: Text(review.accommodationName),
            subtitle: Text('이용 날짜 : ${review.checkInDate}\n${review.reviewContent}'),
            onTap: () {
              // 리뷰 상세 페이지로 이동하는 코드를 여기에 추가할 수 있습니다.
              // 예: Navigator.push(context, MaterialPageRoute(builder: (context) => ReviewDetailPage(review)));
            },
          );
        },
      ),
    );
  }
}

