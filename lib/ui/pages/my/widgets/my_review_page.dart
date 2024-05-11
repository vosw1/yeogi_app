import 'package:flutter/material.dart';
import 'package:yogi_project/_core/constants/size.dart';
import 'package:yogi_project/_core/constants/style.dart';
import 'package:yogi_project/data/models/my_review.dart';
import 'package:yogi_project/ui/pages/my/reservation/widgets/review_writing_dialog.dart';

class MyReviewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 가짜 데이터 예시
    List<MyReview> myReviews = [
      MyReview(
        stayName: '좋은 숙소',
        checkInDate: '2024년 5월 15일',
        reviews: [
          {
            'starCount': 4,
            'comment':
            "설 연휴에 아이와 함께 가족 여행 다녀왔습니다^^ 사진에서 봤던 것 보다 더 아기자기 하고 예쁘고 관리가 잘된 캠핑장이었구요^^",
          },
        ],
      ),
      MyReview(
        stayName: '훌륭한 숙소',
        checkInDate: '2024년 5월 20일',
        reviews: [
          {
            'starCount': 5,
            'comment':
            "설 연휴에 아이와 함께 가족 여행 다녀왔습니다^^ 사진에서 봤던 것 보다 더 아기자기 하고 예쁘고 관리가 잘된 캠핑장이었구요^^",
          },
        ],
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
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: gap_m),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(gap_s),
                    side: BorderSide(color: Colors.grey),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(gap_s),
                    child: ListTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(review.stayName, style: h5()),
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('리뷰 삭제'),
                                    content: Text('리뷰를 삭제하시겠습니까?'),
                                    actions: <Widget>[
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: Text('예'),
                                          ),
                                          SizedBox(width: 8),
                                          TextButton(
                                            onPressed: () {
                                              print('Delete review: ${review.stayName}');
                                              Navigator.of(context).pop();
                                            },
                                            child: Text('아니요'),
                                          ),
                                        ],
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          ),
                        ],
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('이용 날짜 : ${review.checkInDate}',
                              style: TextStyle(color: Colors.grey)),
                          SizedBox(height: 4),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: review.reviews!.map<Widget>((reviewData) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Row(
                                        children: List.generate(5, (index) {
                                          if (index < reviewData['starCount']) {
                                            return Icon(Icons.star,
                                                color: Colors.amber);
                                          } else {
                                            return Icon(Icons.star_border,
                                                color: Colors.amber);
                                          }
                                        }),
                                      ),
                                      SizedBox(width: gap_s),
                                      Text(
                                        '${reviewData['starCount']} 점',
                                        style: TextStyle(color: Colors.black87),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: gap_s),
                                  Text(
                                    '${reviewData['comment']}',
                                    style: TextStyle(color: Colors.black87),
                                  ),
                                ],
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return ReviewWritingDialog(review: review);
                          },
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(height: gap_m),
              ],
            ),
          );
        },
      ),
    );
  }
}
