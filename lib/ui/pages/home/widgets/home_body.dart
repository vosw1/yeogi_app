import 'package:flutter/material.dart';
import '../../../../_core/constants/move.dart';
import '../../../../data/models/stay.dart';
import '../../../../data/models/user.dart';
import '../../stay/stay_page.dart';
import 'home_item.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 특가 숙소 리스트
    List<Stay> saleItemsList = [
      Stay(
        stayImgTitle: "hotel/hotel1.png",
        stayName: "★당일특가★ 하이원리조트 마운틴콘도",
        stayInfo: "복층 구조의 넓고 여유로운 공간, 고급 대리석과 원목 마루로 마감한 격조높은 인테리어가 차원이 다른 편안함을 드립니다\n최고의 부대시설을 갖춘 마운틴 콘도에서 내 집처럼 편안한 휴식을 취해 보세요",
        location: "강원 정선군 고한읍 고한리 438",
        notice: "리조트 시설 확인 및 운영여부, 운영시간, 기타문의 등 하이원리조트 대표번호 (1588-7789) 문의 부탁 드립니다\n객실 이미지는 대표 객실이며, 체크인 시 배정받는 동에 따라 객실 이미지와 상이할 수 있습니다",
        starCount: 4,
        comment: "스노우월드 가기위해서 객실 예약을 했는데 늦은시간 입실했지만 조용하고 24시간 편의점도 꽤 커서 잘 놀다가요! 객실도 따뜻하고 깨끗해서 너무 좋았고 화장실도 두개나 있어서 여유있게 사용했습니다 :) 스노우월드는 너무 너무 강추해요!!! 다음엔 스키타러 또 올게요~",
      ),
    ];
    // 국내 숙소 리스트
    List<Stay> dometicesStayItemList = [
      Stay(
        stayImgTitle: "hotel/hotel1.png",
        stayName: "제주의 아침",
        stayInfo: "ㅇ",
        location: "제주도",
        notice: "여기요는..",
        starCount: 4,
        comment: "역시 제주도~ 귤 나무들도 너무 예뻤고 산책로도 있어서 너무 좋았어요!!",
      ),
    ];
    // 해외 숙소 리스트
    List<Stay> overseasStayItemList = [
      Stay(
        stayImgTitle: "hotel/hotel1.png",
        stayName: "제주의 아침",
        stayInfo: "ㅇ",
        location: "제주도",
        notice: "여기요는..",
        starCount: 4,
        comment: "역시 제주도~ 귤 나무들도 너무 예뻤고 산책로도 있어서 너무 좋았어요!!",
      ),
    ];

    List<User> userDataList = [
      User(
       userImgTitle: "user/avarta.png",
        userName: "메타코딩",
        email: 'ssar@nate.com',
      ),
    ];

    return Align(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 16),
                  Text("특가 숙소", style: TextStyle(fontSize: 20)),
                ],
              ),
            ),
            // 특가 리스트 페이지뷰
            SizedBox(
              height: 400,
              child: PageView(
                children: [
                  for (var stayData in saleItemsList)
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                StayPage(stayData: stayData),
                          ),
                        );
                      },
                      child: HomeItem(userData: userDataList[0], stayData: stayData),
                    ),
                ],
              ),
            ),
            SizedBox(height: 8),
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 16),
                  Text("국내 숙소", style: TextStyle(fontSize: 20)),
                ],
              ),
            ),
            // 국내 숙소 리스트 페이지
            SizedBox(
              height: 400,
              child: PageView(
                children: [
                  for (var stayData in dometicesStayItemList)
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                StayPage(stayData: stayData),
                          ),
                        );
                      },
                      child: HomeItem(userData: userDataList[0], stayData: stayData),
                    ),
                ],
              ),
            ),
            SizedBox(height: 8),
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 16),
                  Text("해외 숙소", style: TextStyle(fontSize: 20)),
                ],
              ),
            ),
            // 해외 숙소 리스트 페이지뷰
            SizedBox(
              height: 400,
              child: PageView(
                children: [
                  for (var stayData in overseasStayItemList)
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                StayPage(stayData: stayData),
                          ),
                        );
                      },
                      child: HomeItem(userData: userDataList[0], stayData: stayData),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
