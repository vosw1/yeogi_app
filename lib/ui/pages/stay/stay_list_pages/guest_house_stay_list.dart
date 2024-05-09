import 'package:flutter/material.dart';
import 'package:yogi_project/data/models/reply.dart';
import 'package:yogi_project/data/models/review.dart';
import 'package:yogi_project/data/models/stay.dart';
import 'package:yogi_project/ui/pages/stay/stay_list_pages/stay_list_page.dart';

class GuestHouseStayList extends StayListPage {
  const GuestHouseStayList({Key? key}) : super(key: key, appBarTitle: '게스트하우스');

  @override
  List<Stay> getStayDataList() {
    return [
      // 게스트하우스 숙소 리스트
      Stay(
        stayImgTitle: "guest_house/guestHouse1.png",
        stayName: "전주 소소한 한옥",
        stayInfo: "소소하게 행복이 머무는 공간입니다\n #새로 오픈했어요",
        location: "전북특별자치도 전주시 완산구 풍남동2가 11-2",
        notice: "현장 요금 추가 정보\n인원 추가 시 1인 20000원(영유아 포함)",
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
            userImgTitle: 'user1.png',
          ),
          Review(
            rating: 3,
            comment: "별루였어요. 다음에는 다른 곳을 이용해볼 생각입니다.",
            userName: '',
            userImgTitle: 'user1.png',
          ),
        ],
      ),
      Stay(
        stayImgTitle: "guest_house/guestHouse2.png",
        stayName: "전주 한옥마을 한옥고택 고을",
        stayInfo:
            "안녕하세요! 한옥고택고을입니다\n천년의숨결 그대로, 그리고 전주한옥마을이 함께하는 곳\n휴식에 휴식을 더하는 힐링공간으로 초대합니다",
        location: "전라북도 전주시 완산구 풍남동3가 76-63",
        notice: "인원 추가 시 10,000원 (12개월 이상~성인), 12개월 미만 1인까지 무료 (단, 2명부터 요금 발생)",
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
        stayImgTitle: "guest_house/guestHouse3.png",
        stayName: "군산 여미랑",
        stayInfo:
            "여미랑(잊을 여, 못할 미, 사랑채 랑)은 아픈 역사를 잊지 말고 하룻밤 묵으면서 만든 추억도 잊지 말자는 의미로,\n일제시대의 아픔을 되새기고자 만들어진 근대역사의 체험공간이자 숙박시설입니다",
        location: "전북 군산시 월명동 16-8",
        notice: "체크인 15~23시까지 (늦은 체크인 미리 연락 필수)\n애완동물 동반 입실 불가",
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
            userImgTitle: 'user1.png',
          ),
          Review(
            rating: 3,
            comment: "별루였어요. 다음에는 다른 곳을 이용해볼 생각입니다.",
            userName: '',
            userImgTitle: 'user1.png',
          ),
        ],
      ),
      Stay(
        stayImgTitle: "guest_house/guestHouse4.png",
        stayName: "경주 행복 한옥마을 셔블",
        stayInfo:
            "신라 천년이 이야기가 있는 신라 왕릉과 돌담길, 정감이 있는 한옥\n더불어 “셔블”\n“행복 한옥마을 셔블”에 오신 것을 환영합니다.",
        location: "경상북도 경주시 황남동 76-10",
        notice:
            " PM 11 : 00 시 이후 소등\n객실 내 식음 금지\n시설물을 파손하거나 침구류 훼손 및 오염 (세탁 불가능) 시 전액 배상",
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
            userImgTitle: 'user1.png',
          ),
          Review(
            rating: 3,
            comment: "별루였어요. 다음에는 다른 곳을 이용해볼 생각입니다.",
            userName: '',
            userImgTitle: 'user1.png',
          ),
        ],
      ),
      Stay(
        stayImgTitle: "guest_house/guestHouse5.png",
        stayName: "전주 한옥마을 골목길 게스트하우스",
        stayInfo:
            "인거리100m옆.도보1분\n모든방은 한옥 민박 가족방입니다.가족*연인*친구가 따로따로 주무시는 방1개와화장실1개의 독립적인 방입니다.\n4인까지 무조건 추가요금 전혀없이 숙박합니다.",
        location: "전라북도 전주시 완산구 교동 45-6 전주골목길게스트하우스",
        notice:
            "입실 : 15:00 | 퇴실 : 11:00\n객실은 현장배정(고객 지정 불가)\n동계 시즌 가스난로 이용 시 1박당 20,000원 추가됩니다",
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
            userImgTitle: 'user1.png',
          ),
          Review(
            rating: 3,
            comment: "별루였어요. 다음에는 다른 곳을 이용해볼 생각입니다.",
            userName: '',
            userImgTitle: 'user1.png',
          ),
        ],
      ),
      Stay(
        stayImgTitle: "guest_house/guestHouse6.png",
        stayName: "경주 신라고택",
        stayInfo:
            "황리단길 중심지에 위치하며,주변에 유명 맛집/커피숍/술집.상가 형성되어있습니다.\n주변관광지는(대릉원도보 5분거리,첨성대도보10분거리,안압지 도보 15분거리,교촌마을(월정교)도보 15분 거리\n국립박물관 도보 15분거리)소요됩니다.",
        location: "경상북도 경주시 황남동 229-33  번지",
        notice:
            "20시 이후 체크인 시 사전 문의 필수\n객실 내 취사 불가, 공용개수대 및 주방 시설 이용가능\n카라반 전 객실 요금은 2인 기준이며, 최대 3인까지 투숙가능\n(성인 3명은 비좁을 수 있으니 가급적 가족단위 3인까지 이용 요망)\n[당일이용-숙박불가]피크닉 상품 이용안내\n\n(7세 미만 추가금 없음 -> 고기 미제공)",
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
            userImgTitle: 'user1.png',
          ),
          Review(
            rating: 3,
            comment: "별루였어요. 다음에는 다른 곳을 이용해볼 생각입니다.",
            userName: '',
            userImgTitle: 'user1.png',
          ),
        ],
      ),
    ];
  }
}
