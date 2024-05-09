import 'package:flutter/cupertino.dart';
import 'package:yogi_project/data/models/reply.dart';
import 'package:yogi_project/data/models/review.dart';
import 'package:yogi_project/data/models/stay.dart';
import 'package:yogi_project/ui/pages/stay/stay_list_pages/stay_list_page.dart';

class MotelStayList extends StayListPage {
  const MotelStayList({Key? key}) : super(key: key, appBarTitle: '모텔');

  @override
  List<Stay> getStayDataList() {
    return [
      // 모텔 숙소 리스트
      Stay(
        stayImgTitle: "motel/motel1.png",
        stayName: "종로 부티크 호텔K",
        stayInfo:
            "안녕하세요 K클래식&부티크호텔k입니다 . 2022년 08월01일부터 K클래식호텔과 부티크k호텔을 통합 운영합니다. 따라서 객실 예약시  사전 확인 부탁드립니다  *(입실 후  운영상 변경이 불가하시는점 참고 부탁드립니다) 또한  보여지는 객실과  다른 구조의 객실로 배정 받으실 수 있는 점 참고하여 예약 해주시길 바랍니다 .",
        location: "서울 종로구 관철동 21",
        notice:
            "객실 내부 시설\n객실 배정은 손님 오시는 순서대로 랜덤 배정입니다\n특히 K클래식 준특실의 경우 욕조가 없는 객실을 배정 받을 수 있습니다.\n전객실 넷플릭스&유튜브 이용가능합니다넷플릭스 개인 계정 사용 필수)",
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
                    comment: reply.text, userName: '', userImgTitle: 'user1.png',
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
        stayImgTitle: "motel/motel2.png",
        stayName: "종로 K-World-종로 3가",
        stayInfo: "",
        location: "서울 종로구 관수동 104-2",
        notice: "객실별 취소 정책이 상이하니 객실 상세정보에서 확인해주세요.",
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
                    comment: reply.text, userName: '', userImgTitle: 'user1.png',
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
        stayImgTitle: "motel/motel3.png",
        stayName: "영등포 H-AVENUE",
        stayInfo:
            "⭐2023.06.30 GRAND OPEN⭐\n모든것이 신규 신상인 신축 건물입니다.\n신규 신상 신축이 영원하도록 철저한 객실 관리와 꼼꼼한 소독 및 방역\n고객님이 떠나실때마다 소독과 점검을꼬박꼬박 실시하고 있습니다.\n고객님께 룸제공시 청결도 확인으로 인하여 입실시간이 늦어질수 있는점\n양해 부탁드립니다^^(최대5분~10분)",
        location: "서울 영등포구 영등포동3가 23",
        notice:
            "객실 내부 시설\nH-AVENU HOTEL 고객님 편의사항\n숙박업소 최초 전객실 천정형 공기순환기 설치\n전객실 1GB 광랜설치\n전객실 Wi-Fi\n전객실 시스템 냉,난방\n전객실 넷플릭스 무료 이용가능\n전객실 LG스마트 TV\n전객실 스마트 비데설치\n전객실 헝가리구스 침구\n호텔내 얼음제빙기,커피머신기,렌즈통,렌즈액,전자렌지,ATM현금지급기 설치.능",
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
                    comment: reply.text, userName: '', userImgTitle: 'user1.png',
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
        stayImgTitle: "motel/motel4.png",
        stayName: "역삼 인트로호텔",
        stayInfo: "",
        location: "서울 강남구 역삼동 677-14",
        notice: "객실별 취소 정책이 상이하니 객실 상세정보에서 확인해주세요.",
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
                    comment: reply.text, userName: '', userImgTitle: 'user1.png',
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
        stayImgTitle: "motel/motel5.png",
        stayName: "강남 멜리샤호텔",
        stayInfo: "",
        location: "서울 강남구 역삼동 825-29",
        notice:
            "객실 내부 시설\n전객실 넷플릭스를 무료로 이용 가능합니다.\n전객실 욕조, 비데, 55인치 스마트TV, VOD , PC, 공기청정기 등의 시설을 갖추고 있습니다.\n최고급 구스다운 침구류와 새 린넨으로 편안한 잠자리를 경험해보세요.\n유럽 최고의 명품 브랜드 리날디 메모리폼 메트리스가 전객실 비치되어 있습니다.\n 객실내 와이파이 무료 이용 가능합니다.\n전객실 충전기가 비치되어 있습니다.\n전객실 드라이기및 고대기가 설치되어 있습니다.",
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
                    comment: reply.text, userName: '', userImgTitle: 'user1.png',
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
        stayImgTitle: "motel/motel6.png",
        stayName: "신촌 앨리 - ALLEY",
        stayInfo: "새로 오픈 기념 어메니티 4종(샴프, 린스, 바디, 로션) 무료 증정합니다.",
        location: "서울 서대문구 대현동 110-35",
        notice:
            "객실 내부 시설\n* 2020년 4월 15일 오픈한 신규 호텔입니다!!!\n* 당 호텔 정책상 2005년 생은 3월 부터 입실 가능 합니다",
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
                    comment: reply.text,
                    userName: '', userImgTitle: 'user1.png',
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
