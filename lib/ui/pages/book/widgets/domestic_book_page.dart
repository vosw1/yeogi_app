import 'package:flutter/material.dart';
import 'package:yogi_project/data/dtos/book_request.dart';

import '../../../../_core/constants/size.dart';
import '../../../../_core/constants/style.dart';
import '../../../../data/models/stay.dart';
import '../../stay/stay_page.dart';

class DomesticBookPage extends StatelessWidget {
  const DomesticBookPage({super.key, required List<Book> DomesticStayBookList});

  @override
  Widget build(BuildContext context) {
    // 국내 숙소 리스트
    List<Stay> campingDataList = [
      Stay(
        stayImgTitle: "camping/camping1.png",
        stayName: "영흥도 코코로망스 카라반",
        stayInfo: "도심에서 가깝고, 바다가 보이는 코코로망스입니다\n다양한 부대시설을 구비하였으며 카라반 및 캠핑이 가능합니다",
        location: "인천 옹진군 영흥면 내리 1651-4",
        notice: "20시 이후 체크인 시 사전 문의 필수\n객실 내 취사 불가, 공용개수대 및 주방 시설 이용가능\n카라반 전 객실 요금은 2인 기준이며, 최대 3인까지 투숙가능\n(성인 3명은 비좁을 수 있으니 가급적 가족단위 3인까지 이용 요망)\n[당일이용-숙박불가]피크닉 상품 이용안내\n\n(7세 미만 추가금 없음 -> 고기 미제공)",
        starCount: 4.5,
        comment: "설 연휴에 아이와 함께 가족 여행 다녀왔습니다^^\n사진에서 봤던 것 보다 더 아기자기 하고 예쁘고 관리가 잘된 캠핑장이었구요^^",
      ),
      Stay(
        stayImgTitle: "camping/camping2.png",
        stayName: "가평 조이캠핑",
        stayInfo: "텐트앞 계곡뷰가 아름다운 캠핑",
        location: "경기 가평군 북면 목동리 344-1",
        notice: "\n예약시 참조하세요\n객실 예약은 2인기준 예약/숯불/캠프파이어 추가인원 현장결제\n바비큐or캠프파이어 두 개종 한개는 필수선택입니다",
        starCount: 5,
        comment: "가평에 4시간달려서 온 조이글램핑장.사진이랑 비슷한 캠핑장에 시설도 주방장비들도 구비되어있어서 좋았어요.",
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('국내 숙소'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: gap_m),
        child: ListView.builder(
          itemCount: campingDataList.length,
          itemBuilder: (context, index) {
            final Stay stay = campingDataList[index];
            return Padding(
              padding: const EdgeInsets.only(top: gap_m, left: gap_m, right: gap_m),
              child: Row(
                children: [
                  SizedBox(height: gap_xs),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => StayPage(stayData: stay),
                          ),
                        );
                      },
                      child: Container(
                        height: 150, // 사진의 높이
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: AssetImage("assets/images/${stay.stayImgTitle}"), // 이미지 경로
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8), // 사진과 텍스트 사이 간격
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity, // 화면 너비에 맞추기 위해 사용
                          child: Text(
                            stay.stayName,
                            style: h5(),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(height: 4), // 텍스트 사이 간격
                        Text(
                          stay.location, // 숙소 위치
                          style: TextStyle(),maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 4), // 텍스트 사이 간격
                        Text(
                          stay.stayInfo, // 숙소 정보
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}


