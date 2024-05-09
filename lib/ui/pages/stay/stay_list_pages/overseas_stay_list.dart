import 'package:flutter/cupertino.dart';
import 'package:yogi_project/data/models/reply.dart';
import 'package:yogi_project/data/models/review.dart';
import 'package:yogi_project/data/models/stay.dart';
import 'package:yogi_project/ui/pages/stay/stay_list_pages/stay_list_page.dart';

class OverseasStayList extends StayListPage {
  const OverseasStayList({Key? key}) : super(key: key, appBarTitle: '해외');

  @override
  List<Stay> getStayDataList() {
    return [
      // 해외 숙소 리스트
      Stay(
        stayImgTitle: "overseas/overseas1.png",
        stayName: "두짓타니 괌 리조트",
        stayInfo:
            "본 숙소(두짓타니 괌 리조트)는 괌에 잠시 머물거나 본격 여행을 위해 방문하는 여행객들 사이에서 인기 있는 숙소입니다. 투숙객이 즐거운 시간을 보낼 수 있도록 다양한 시설과 특전을 제공합니다. 24시간 룸서비스, Wi-Fi (무료/전 객실), 24시간 경비 서비스, 일일 청소 서비스, 24시간 프런트 데스크 등 여러 가지를 즐길 수 있습니다. 객실은 최적의 편안함을 제공할 수 있도록 설계되어 있으며, 일부 객실에서 평면 TV, 리넨, 슬리퍼, 타월, 옷장 등을 이용할 수 있습니다. 관광 후 아늑한 객실에서 휴식을 취하거나 온수 욕조, 피트니스센터, 사우나, 실외 수영장, 스파 등을 즐길 수 있습니다. 본 숙소(두짓타니 괌 리조트)를 괌 여행의 근거지로 정해 본격적인 여행을 시작해 보세요.",
        location: "1227 Pale San Vitores Road, Tumon, 투몬 베이, 괌, 괌, 96913",
        notice: "체크인 : 15:00 | 체크아웃 : 12:00\n정확한 체크인/체크아웃 시간은 숙소에 문의해주세요.",
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
        stayImgTitle: "overseas/overseas2.png",
        stayName: "호텔 토리피토 하타카 기온",
        stayInfo: "",
        location: "8-24 Reisenmachi, 하카타, 후쿠오카 / 훗쿠오카, 일본, 812-0039",
        notice: "체크인 : 15:00 | 체크아웃 : 12:00\n정확한 체크인/체크아웃 시간은 숙소에 문의해주세요.",
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
        stayImgTitle: "overseas/overseas3.png",
        stayName: "빌리지 호텔 센토사 바이 퍼 이스트 호스피탈리티 (SG 클린 인증)",
        stayInfo: "",
        location: "10 Artillery Avenue, 센토사, 싱가포르 / 싱가폴, 싱가포르, 099951",
        notice: "체크인 : 15:00 | 체크아웃 : 12:00\n정확한 체크인/체크아웃 시간은 숙소에 문의해주세요.",
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
        stayImgTitle: "overseas/overseas4.png",
        stayName: "샹그릴라 탄중아루 코타키나발루",
        stayInfo:
            "본 숙소(샹그릴라스 탄중 아루 리조트 앤드 스파)는 코타키나발루에 잠시 머물거나 본격 여행을 위해 방문하는 여행객들 사이에서 인기 있는 숙소입니다. 투숙객이 즐거운 시간을 보낼 수 있도록 다양한 시설과 특전을 제공합니다. 일일 청소 서비스, 기념품 가게, 프라이빗 체크인/체크아웃, 티켓 서비스, 24시간 프런트 데스크 등을 포함해 필요한 모든 시설이 준비되어 있습니다. 각 객실은 아름답게 꾸며져 있으며 편리한 시설을 갖추고 있습니다. 긴 하루를 보낸 후 카누, 미니골프코스, 워터파크, 윈드서핑, 스노클링 등을 통해 휴식을 취해보시기 바랍니다. 본 숙소(샹그릴라스 탄중 아루 리조트 앤드 스파)를 코타키나발루 여행의 근거지로 정해 본격적인 여행을 시작해 보세요.",
        location: "No 20, Jalan Aru, Tanjung Aru, 탄중 아루, 코타키나발루, 말레이시아, 88100",
        notice: "체크인 : 15:00 | 체크아웃 : 12:00\n정확한 체크인/체크아웃 시간은 숙소에 문의해주세요.",
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
        stayImgTitle: "overseas/overseas5.png",
        stayName: "The Landmark London",
        stayInfo:
            "본 숙소(랜드마크 런던)는 런던에 잠시 머물거나 본격 여행을 위해 방문하는 여행객들 사이에서 인기 있는 숙소입니다. 투숙객이 편안함과 편리함을 느낄 수 있도록 다양한 서비스 및 편의 시설을 제공하고 있습니다. 서비스 마인드를 지닌 랜드마크 런던 직원들이 투숙객을 따뜻하게 환영하고 안내합니다. 아늑한 객실에서 편안한 시간을 보낼 수 있으며, 일부 객실에서는 슬리퍼, 평면 TV, 에어컨, 난방, 모닝콜 서비스 등을 이용할 수 있습니다. 본 숙소에서 다양한 여가 시설을 이용할 수 있습니다. 런던 방문 이유와 상관없이 랜드마크 런던에서는 집과 같은 편안함을 느낄 수 있습니다.",
        location: "222 Marylebone Road, 하이드 파크, 런던, 영국, NW1 6JQ",
        notice: "체크인 : 15:00 | 체크아웃 : 12:00\n정확한 체크인/체크아웃 시간은 숙소에 문의해주세요.",
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
        stayImgTitle: "overseas/overseas6.png",
        stayName: "더 풀러턴 호텔 시드니",
        stayInfo: "",
        location:
            "1 Martin Place, Sydney, New South Wales, 시드니 CBD, 시드니, 호주, 2000",
        notice: "체크인 : 15:00 | 체크아웃 : 12:00\n정확한 체크인/체크아웃 시간은 숙소에 문의해주세요.",
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
