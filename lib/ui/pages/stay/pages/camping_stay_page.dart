import 'package:flutter/material.dart';

import '../../../../data/models/stay.dart';
import '../../home/home_page.dart';
import '../../home/widgets/home_item.dart';
import '../stay_page.dart';

class CampingStayPage extends StatelessWidget {
  const CampingStayPage({super.key});

  @override
  Widget build(BuildContext context) {
    // 캠핑 숙소 리스트
    List <Stay> campingDataList = [
      Stay(
        stayImgTitle: "/camping/camping1.png",
        stayName: "영흥도 코코로망스 카라반",
        stayInfo: "도심에서 가깝고, 바다가 보이는 코코로망스입니다\n다양한 부대시설을 구비하였으며 카라반 및 캠핑이 가능합니다",
        location: "제주도",
        notice: "20시 이후 체크인 시 사전 문의 필수\n객실 내 취사 불가, 공용개수대 및 주방 시설 이용가능\n카라반 전 객실 요금은 2인 기준이며, 최대 3인까지 투숙가능\n(성인 3명은 비좁을 수 있으니 가급적 가족단위 3인까지 이용 요망)\n[당일이용-숙박불가]피크닉 상품 이용안내\n\n(7세 미만 추가금 없음 -> 고기 미제공)",
        starCount: 4,
        comment: "설 연휴에 아이와 함께 가족 여행 다녀왔습니다^^\n사진에서 봤던것 보다 더 아기자기 하고 예쁘고 관리가 잘된 캠핑장이었구요^^",
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
                  Text(
                    "캠핑",
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
            // 캠핑 리스트뷰
            SizedBox(
              height: 400,
              child: ListView(
                children: [
                  for (var itemData in campingDataList)
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => StayPage(stayData: itemData),
                          ),
                        );
                      },
                      child: HomeItem(
                          userData: userDataList[0], stayData: itemData),
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
