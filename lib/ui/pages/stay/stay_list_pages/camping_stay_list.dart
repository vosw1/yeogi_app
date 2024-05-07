import 'package:flutter/cupertino.dart';
import 'package:yogi_project/data/models/Reply.dart';
import 'package:yogi_project/data/models/review.dart';
import 'package:yogi_project/data/models/stay.dart';
import 'package:yogi_project/ui/pages/stay/stay_list_pages/stay_list_page.dart';

class CampingStayList extends StayListPage {
  const CampingStayList({Key? key}) : super(key: key, appBarTitle: '캠핑');

  @override
  List<Stay> getStayDataList() {
    return [
      // 캠핑 숙소 리스트
      Stay(
        stayImgTitle: "camping/camping1.png",
        stayName: "영흥도 코코로망스 카라반",
        stayInfo:
            "도심에서 가깝고, 바다가 보이는 코코로망스입니다\n다양한 부대시설을 구비하였으며 카라반 및 캠핑이 가능합니다",
        location: "인천 옹진군 영흥면 내리 1651-4",
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
        stayImgTitle: "camping/camping2.png",
        stayName: "가평 조이캠핑",
        stayInfo: "텐트앞 계곡뷰가 아름다운 캠핑",
        location: "경기 가평군 북면 목동리 344-1",
        notice:
            "\n예약시 참조하세요\n객실 예약은 2인기준 예약/숯불/캠프파이어 추가인원 현장결제\n바비큐or캠프파이어 두 개종 한개는 필수선택입니다",
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
        stayImgTitle: "camping/camping3.png",
        stayName: "가평 더상상풀빌라&캠핑",
        stayInfo: "야외 수영장, 전 객실 개별 바비큐와 불멍을 즐길 수 있는 캠핑장입니다",
        location: "경기 가평군 가평읍 경반리 583-71",
        notice:
            "입실 : 15:00 | 퇴실 : 11:00\n22시 이후 입실 시 사전문의 (필수)\n무료 Wi-Fi\n주차 가능",
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
        stayImgTitle: "camping/camping4.png",
        stayName: "가평 디프라이빗 캠핑",
        stayInfo:
            "낭만적인 뷰가 끝내주는 럭셔리 아트빌라 캠핑장입니다\n프라이빗한 글램핑과 감성 돋는 카라반 객실이 갖춰져 있습니다",
        location: "경기 가평군 북면 적목리 337",
        notice:
            " 화장실이 개별화장실 입니다\n도로 결빙/안전을 위하여 동절기(12월-2월) 에는 입실 제한이 오후 7시 입니다. 이점 유의 하시여 예약 부탁 드립니다",
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
        stayImgTitle: "camping/camping5.png",
        stayName: "포천 백운계곡 글램핑",
        stayInfo:
            "서울 근교에 가족, 연인, 친구들과 추억을 만들 수 있는 럭셔리한 캠핑장입니다\n난방 완비된 깨끗한 공용 부대시설과 객실에서 편안한 휴식을 취할 수 있습니다",
        location: "경기 포천시 이동면 도평리 272-5",
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
        stayImgTitle: "camping/camping6.png",
        stayName: "가평 캡틴 캠핑&글램핑",
        stayInfo:
            "확 트인 자연의 풍경을 감상하며 일상에 지쳐 있던 심신을 힐링 받을 수 있는 곳입니다\n넓고 깨끗한 수영장과 고객님들에게 청결과 친절을 최우선으로 생각하여 편안한 여행의 도움을 드리겠습니다",
        location: "경기 가평군 상면 임초리 493-1",
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
