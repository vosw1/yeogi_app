import 'package:flutter/material.dart';
import '../../components/common/set_item_data.dart';
import '../../size.dart';

// 예약 내역 페이지
class ReservationInKoreaPage extends StatelessWidget {
  final List<ItemData> reservationItemsData;

  ReservationInKoreaPage({required this.reservationItemsData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('예약 내역'),
      ),
      body: Padding(
        padding: EdgeInsets.all(gap_m), // 전체적인 패딩 설정
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: gap_m), // 아래쪽에 간격 추가
              child: Text(
                '예약 ${reservationItemsData.length}건',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ),
            Divider(), // 구분선
            Expanded(
              child: ListView.builder(
                itemCount: reservationItemsData.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: gap_m), // 위아래 간격 추가
                        child: Text(
                          '${index + 1}. ${reservationItemsData[index].location}', // 숙소 이름
                          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                      ListTile(
                        leading: Image.asset(
                          reservationItemsData[index].imagePath,
                          width: 100.0,
                          height: 100.0,
                          fit: BoxFit.cover,
                        ),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('체크인: ${_randomDate()}'), // 임의의 체크인 날짜
                            Text('체크아웃: ${_randomDate()}'), // 임의의 체크아웃 날짜
                            Text('인원: ${_randomNumber()}명'), // 임의의 인원
                            Text('가격: ${_randomPrice()}'), // 임의의 가격
                          ],
                        ),
                        onTap: () {
                          // 해당 상세페이지로 이동
                          // 예약 내역에 대한 상세페이지를 구현해야 함
                        },
                      ),
                      Divider(), // 구분선
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 임의의 날짜 생성
  String _randomDate() {
    return '2024-04-30'; // 예시로 고정된 날짜 반환
  }

  // 임의의 숫자 생성
  int _randomNumber() {
    return 2; // 예시로 고정된 숫자 반환
  }

  // 임의의 가격 생성
  String _randomPrice() {
    return '\$200'; // 예시로 고정된 가격 반환
  }
}

void main() {
  // 테스트 데이터
  List<ItemData> reservationItemsData = [
    ItemData(
      imagePath: "assets/images/p1.png",
      starCount: 5,
      comment: "역시 제주도~ 귤 나무들도 너무 예뻤고 산책로도 있어서 너무 좋았어요!!",
      imgTitle: "p1",
      userName: "낭만여행가",
      location: "제주도",
    ),
    ItemData(
      imagePath: "assets/images/p2.png",
      starCount: 4,
      comment: "경치가 좋아서 너무 만족스럽습니다.",
      imgTitle: "p2",
      userName: "행복한여행객",
      location: "강원도",
    ),
  ];

  runApp(MaterialApp(
    home: ReservationInKoreaPage(reservationItemsData: reservationItemsData),
  ));
}
