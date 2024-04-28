import 'package:flutter/material.dart';
import '../../../../data/models/pay.dart';
import '../../stay/stay_detail_page.dart';
import 'home_item.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 특가 숙소 리스트
    List<Stay> saleItemsData = [
      Stay(
        stayImgTitle: "p1.png",
        stayName: "제주의 아침",
        stayInfo: "ㅇ",
        roomName: "바다뷰",
        roomInfo: "ㅇ",
        amenities: "드라이기, 칫솔, 스타일러",
        location: "제주도",
        checkInDate: "2024-04-30",
        checkOutDate: "2024-05-02",
        personCount: "2",
        price: 60000,
        cancellationAndRefundPolicy: "일주일 이내 환불 가능 및 당일 취소 불가",
        notice: "여기요는..",
        starCount: 4,
        comment: "역시 제주도~ 귤 나무들도 너무 예뻤고 산책로도 있어서 너무 좋았어요!!",
        userImgTitle: "p2.png",
        userName: "낭만여행가",
      ),
    ];
    // 국내 숙소 리스트
    List<Stay> popularItemsData = [
      Stay(
        stayImgTitle: "p1.png",
        stayName: "제주의 아침",
        stayInfo: "ㅇ",
        roomName: "바다뷰",
        roomInfo: "ㅇ",
        amenities: "드라이기, 칫솔, 스타일러",
        location: "제주도",
        checkInDate: "2024-04-30",
        checkOutDate: "2024-05-02",
        personCount: "2",
        price: 60000,
        cancellationAndRefundPolicy: "일주일 이내 환불 가능 및 당일 취소 불가",
        notice: "여기요는..",
        starCount: 4,
        comment: "역시 제주도~ 귤 나무들도 너무 예뻤고 산책로도 있어서 너무 좋았어요!!",
        userImgTitle: "p2.png",
        userName: "낭만여행가",
      ),
    ];
    // 해외 숙소 리스트
    List<Stay> homeAbroadItemData = [
      Stay(
        stayImgTitle: "p1.png",
        stayName: "제주의 아침",
        stayInfo: "ㅇ",
        roomName: "바다뷰",
        roomInfo: "ㅇ",
        amenities: "드라이기, 칫솔, 스타일러",
        location: "제주도",
        checkInDate: "2024-04-30",
        checkOutDate: "2024-05-02",
        personCount: "2",
        price: 60000,
        cancellationAndRefundPolicy: "일주일 이내 환불 가능 및 당일 취소 불가",
        notice: "여기요는..",
        starCount: 4,
        comment: "역시 제주도~ 귤 나무들도 너무 예뻤고 산책로도 있어서 너무 좋았어요!!",
        userImgTitle: "p2.png",
        userName: "낭만여행가",
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
                  Text("국내 숙소 추천", style: TextStyle(fontSize: 20)),
                ],
              ),
            ),
            // 인기 숙소 리스트 페이지뷰
            SizedBox(
              height: 400,
              child: PageView(
                children: [
                  for (var itemData in popularItemsData)
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                StayDetailPage(itemData: itemData),
                          ),
                        );
                      },
                      child: HomeItem(itemData: itemData),
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
                  Text("인기 숙소 추천", style: TextStyle(fontSize: 20)),
                ],
              ),
            ),
            // 인기 숙소 리스트 페이지뷰
            SizedBox(
              height: 400,
              child: PageView(
                children: [
                  for (var itemData in popularItemsData)
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                StayDetailPage(itemData: itemData),
                          ),
                        );
                      },
                      child: HomeItem(itemData: itemData),
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
                  Text("인기 해외 추천", style: TextStyle(fontSize: 20)),
                ],
              ),
            ),
            // 인기 해외 숙소 리스트 페이지뷰
            SizedBox(
              height: 400,
              child: PageView(
                children: [
                  for (var itemData in homeAbroadItemData)
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                StayDetailPage(itemData: itemData),
                          ),
                        );
                      },
                      child: HomeItem(itemData: itemData),
                    ),
                ],
              ),
            ),
          ],
        )
        ,
      )
      ,
    );
  }
}
