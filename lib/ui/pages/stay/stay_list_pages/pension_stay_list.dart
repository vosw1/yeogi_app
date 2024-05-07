import 'package:flutter/cupertino.dart';
import 'package:yogi_project/data/models/Reply.dart';
import 'package:yogi_project/data/models/review.dart';
import 'package:yogi_project/data/models/stay.dart';
import 'package:yogi_project/ui/pages/stay/stay_list_pages/stay_list_page.dart';

class PensionStayList extends StayListPage {
  const PensionStayList({Key? key}) : super(key: key, appBarTitle: '펜션');

  @override
  List<Stay> getStayDataList() {
    return [
      // 펜션 숙소 리스트
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
        stayImgTitle: "pension/pension2.png",
        stayName: "전의 게스트하우스",
        stayInfo:
            "전의역 근처 마을 주민들이 정성스레 가꾸는 펜션입니다\n여행의 꽃 바비큐 파티를 즐기면서 힐링을 할 수 있습니다",
        location: "세종특별자치시 전의면 읍내리 149-8",
        notice:
            "기본 정보\n입실 : 15:00 | 퇴실 : 11:00\n22시 이후 입실 시 사전문의 (필수)\n무료 Wi-Fi\n전 객실 금연 / 적발 시 특수 청소비(10만원) 청구\n주차 가능 (숙소 앞 마당 주차)",
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
                .map(
                  (reply) => Review(
                    rating: 4, // 대댓글에는 별점이 없으므로 기본값으로 설정
                    comment: reply.text, userName: '', userImgTitle: '',
                  ),
                )
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
      Stay(
        stayImgTitle: "pension/pension3.png",
        stayName: "서울 종로모꼬지게스트하우스펜션",
        stayInfo:
            "조식서비스 / 야외바베큐장 / 개별바베큐 / 객실내 무료 Wi-Fi도심속 휴식공간 모꼬지에 오신 것을 환영합니다!모꼬지는 서울의 심장 종로 혜화동, 대학로 주택가에 자리잡은 한옥 게스트하우스입니다",
        location: "서울 종로구 혜화동 5-12",
        notice:
            "입실 : 15:00 | 퇴실 : 11:00\n22시 이후 입실 시 사전문의 (필수)\n전 객실 금연\n주차 가능",
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
                .map(
                  (reply) => Review(
                    rating: 4, // 대댓글에는 별점이 없으므로 기본값으로 설정
                    comment: reply.text, userName: '', userImgTitle: '',
                  ),
                )
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
      Stay(
        stayImgTitle: "pension/pension5.png",
        stayName: "전주 남덕이네당금빛 독채",
        stayInfo:
            "서울 근교에 가족, 연인, 친구들과 추억을 만들 수 있는 럭셔리한 캠핑장입니다\n난방 완비된 깨끗한 공용 부대시설과 객실에서 편안한 휴식을 취할 수 있습니다",
        location: "전북특별자치도 전주시 완산구 남노송동 157-4",
        notice:
            "기본 정보\n입실 : 14:00 | 퇴실 : 11:00\n22시 이후 입실 시 사전문의 (필수)\n무료 Wi-Fi\n전 객실 금연\n주차 가능 (공간협소 / 전주한옥마을 공영주차장 이용)",
        reviews: [],
      ),
      Stay(
        stayImgTitle: "pension/pension6.png",
        stayName: "경주 누리봄 한옥스테이",
        stayInfo: "황리단길 걸어서 1분 거리에 있습니다\n전통 한옥 게스트하우스입니다",
        location: "경북 경주시 사정동 116-10",
        notice:
            "공지사항\n최대인원 초과시 입실 불가 / 환불없음\n기준인원 2인 초과 시 인원추가요금 발생(현장결제) / 사전신청필수\n24개월 미만 유아도 인원에 포함\n201 사계절 객실 제외 전 객실-객실 내 취사불가(공동주방 이용)\n바베큐 이용불가\n주차장 없음 / 주변 유료 주차장 혹은 도로변에 주차 필요(숙소 문의)\n짐보관 가능 / 귀중품 보관불가 / 분실시 책임 지지 않음",
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
                .map(
                  (reply) => Review(
                    rating: 4, // 대댓글에는 별점이 없으므로 기본값으로 설정
                    comment: reply!.text, userName: '', userImgTitle: '',
                  ),
                )
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
