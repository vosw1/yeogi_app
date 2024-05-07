import 'package:flutter/cupertino.dart';
import 'package:yogi_project/data/models/reply.dart';
import 'package:yogi_project/data/models/review.dart';
import 'package:yogi_project/data/models/stay.dart';
import 'package:yogi_project/ui/pages/stay/stay_list_pages/stay_list_page.dart'; // Import the Reply class

class ScrapListPage extends StayListPage {
  const ScrapListPage({Key? key}) : super(key: key, appBarTitle: '찜한 숙소');

  @override
  List<Stay> getStayDataList() {
    return [
      Stay(
        stayImgTitle: "pension/pension1.png",
        stayName: "장성 황룡강펜션게스트하우스",
        stayInfo:
            "안녕하세요\n저희 황룡강펜션게스트하우스는\n황룡강 및 장성읍내가 한눈에 보이는  전망 좋고 조용한 객실입니다",
        location: "전남 장성군 장성읍 기산리 214-2",
        notice:
            "기본 정보\n입실 : 14:00 | 퇴실 : 12:00\n22시 이후 입실 시 사전문의 (필수)\n전 객실 금연\n주차 가능",
        reviews: [],
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
          Review(
            rating: 4,
            comment:
                "스노우월드 가기위해서 객실 예약을 했는데 늦은시간 입실했지만 조용하고 24시간 편의점도 꽤 커서 잘 놀다가요! 객실도 따뜻하고 깨끗해서 너무 좋았고 화장실도 두개나 있어서 여유있게 사용했습니다 :) 스노우월드는 너무 너무 강추해요!!! 다음엔 스키타러 또 올게요~",
            replies: [
              Reply(
                text: "우리 기업도 함께 노력하겠습니다. 감사합니다!",
              ),
            ]
                .map((reply) => Review(
                      rating: 4, // 대댓글에는 별점이 없으므로 기본값으로 설정
                      comment: reply.text, userName: '', userImgTitle: '',
                    ))
                .toList(),
            userName: '',
            userImgTitle: '',
          ),
          Review(
            rating: 3,
            comment: "별루였어요. 다음에는 다른 곳을 이용해볼 생각입니다.",
            userName: '',
            userImgTitle: '',
          ),
        ],
      ),
    ];
  }
}
