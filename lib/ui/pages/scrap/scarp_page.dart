import 'package:flutter/cupertino.dart';
import 'package:yogi_project/ui/pages/stay/stay_list_pages/stay_list_page.dart';

import '../../../../data/models/stay.dart';

class ScrapListPage extends StayListPage {
  const ScrapListPage({Key? key}) : super(key: key, appBarTitle: '찜한 숙소');

  @override
  List<Stay> getStayDataList() {
    return [
      // 스크랩 숙소 리스트
      Stay(
        stayImgTitle: "pension/pension1.png",
        stayName: "장성 황룡강펜션게스트하우스",
        stayInfo:
            "안녕하세요\n저희 황룡강펜션게스트하우스는\n황룡강 및 장성읍내가 한눈에 보이는  전망 좋고 조용한 객실입니다",
        location: "전남 장성군 장성읍 기산리 214-2",
        notice:
            "기본 정보\n입실 : 14:00 | 퇴실 : 12:00\n22시 이후 입실 시 사전문의 (필수)\n전 객실 금연\n주차 가능",
        reviews: [
          {
            'starCount': 0,
            'comment': "",
          }
        ],
      ),
      Stay(
        stayImgTitle: "pension/pension4.png",
        stayName: "부산 더파크게스트하우스",
        stayInfo:
            "광안리 해변 도보 약 1분거리입니다\n부산을 여행하는 게스트들을 위한 소규모가정집 같은 분위기의 게스트하우스입니다",
        location: "부산 수영구 광안동 159-2",
        notice:
            "객실 가격은 원화, 달러와 가치가 상이하니 정확한 숙박요금계산은 호스트에게 문의필수\n온라인예약의 경우 인원추가시 발생되는 추가요금 사전결제불가(현장결제)\n비수기 1인 20,000원 성수기 1인 30,000원",
        reviews: [
          {
            'starCount': 3.5,
            'comment': "화장실 샤워부스의 온수가 잘 나오지 않는 것외에는 모든 것이 다 좋았다",
          }
        ],
      ),
    ];
  }
}
