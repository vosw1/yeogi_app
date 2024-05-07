import 'package:flutter/material.dart';
import 'package:yogi_project/_core/constants/move.dart';
import 'package:yogi_project/data/models/Reply.dart';
import 'package:yogi_project/data/models/review.dart';
import 'package:yogi_project/data/models/stay.dart';
import 'package:yogi_project/data/models/user.dart';
import 'package:yogi_project/ui/pages/my/my_page.dart';

class MyPageLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            final User userData = User(
              username: '홍길동',
              password: '1234',
              phone: '010-1234-5678',
              birth: '1988-11-11',
            );
            final Stay stayData = Stay(
              stayName: '★당일특가★ 하이원리조트 마운틴콘도',
              stayImgTitle: 'hotel/hotel1.png',
              location: '강원 정선군 고한읍 고한리 438',
              stayInfo: 'dsh',
              notice: 'ttfdgjn',
              reviews: [
                Review(
                  rating: 4,
                  comment:
                      "스노우월드 가기위해서 객실 예약을 했는데 늦은시간 입실했지만 조용하고 24시간 편의점도 꽤 커서 잘 놀다가요! 객실도 따뜻하고 깨끗해서 너무 좋았고 화장실도 두개나 있어서 여유있게 사용했습니다 :) 스노우월드는 너무 너무 강추해요!!! 다음엔 스키타러 또 올게요~",
                  replies: [
                    Reply(
                      text: "이용해주셔서 감사합니다",
                    ),
                  ]
                      .map((reply) => Review(
                            rating: 4, // 대댓글에는 별점이 없으므로 기본값으로 설정
                            comment: reply.text, userName: '', userImgTitle: '',
                          ))
                      .toList(), userName: '', userImgTitle: '',
                ),
                Review(
                  rating: 3,
                  comment: "별루였어요. 다음에는 다른 곳을 이용해볼 생각입니다.",
                  replies: [
                    Reply(
                      text: "다음에 방문해주신다면 이런일 없도록 하겠습니다 감사합니다",
                    ),
                  ]
                      .map((reply) => Review(
                            rating: 4, // 대댓글에는 별점이 없으므로 기본값으로 설정
                            comment: reply.text, userName: '', userImgTitle: '',
                          ))
                      .toList(), userName: '', userImgTitle: '',
                ),
              ],
            );
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MyPage(
                        userData: userData,
                        stayData: stayData,
                        eventTitleBannerData: eventTitleBannerDataList,
                      )),
            );
          },
          child: Text('Go to My Page'),
        ),
      ),
    );
  }
}
