import 'package:flutter/material.dart';
import 'package:yogi_project/_core/constants/move.dart';
import 'package:yogi_project/_core/constants/scroll_fab.dart';
import 'package:yogi_project/_core/constants/size.dart';
import 'package:yogi_project/data/models/Reply.dart';
import 'package:yogi_project/data/models/review.dart';
import 'package:yogi_project/data/models/stay.dart';
import 'package:yogi_project/ui/pages/home/widgets/home_body.dart';
import 'package:yogi_project/ui/pages/home/widgets/home_body_banner.dart';
import 'package:yogi_project/ui/pages/home/widgets/home_header.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    // 특가 숙소 리스트
    List<Stay> saleStayList = [
      Stay(
        stayImgTitle: "hotel/hotel1.png",
        stayName: "★당일특가★ 하이원리조트 마운틴콘도",
        stayInfo:
        "복층 구조의 넓고 여유로운 공간, 고급 대리석과 원목 마루로 마감한 격조높은 인테리어가 차원이 다른 편안함을 드립니다\n최고의 부대시설을 갖춘 마운틴 콘도에서 내 집처럼 편안한 휴식을 취해 보세요",
        location: "강원 정선군 고한읍 고한리 438",
        notice:
        "리조트 시설 확인 및 운영여부, 운영시간, 기타문의 등 하이원리조트 대표번호 (1588-7789) 문의 부탁 드립니다\n객실 이미지는 대표 객실이며, 체크인 시 배정받는 동에 따라 객실 이미지와 상이할 수 있습니다",
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
                .toList(), userName: '', userImgTitle: '',
          ),
          Review(
            rating: 3,
            comment: "별루였어요. 다음에는 다른 곳을 이용해볼 생각입니다.", userName: '', userImgTitle: '',
          ),
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
                .toList(), userName: '', userImgTitle: '',
          ),
          Review(
            rating: 3,
            comment: "별루였어요. 다음에는 다른 곳을 이용해볼 생각입니다.", userName: '', userImgTitle: '',
          ),
        ],
      ),
      Stay(
        stayImgTitle: "hotel/hotel1.png",
        stayName: "★당일특가★ 하이원리조트 마운틴콘도",
        stayInfo:
        "복층 구조의 넓고 여유로운 공간, 고급 대리석과 원목 마루로 마감한 격조높은 인테리어가 차원이 다른 편안함을 드립니다\n최고의 부대시설을 갖춘 마운틴 콘도에서 내 집처럼 편안한 휴식을 취해 보세요",
        location: "강원 정선군 고한읍 고한리 438",
        notice:
        "리조트 시설 확인 및 운영여부, 운영시간, 기타문의 등 하이원리조트 대표번호 (1588-7789) 문의 부탁 드립니다\n객실 이미지는 대표 객실이며, 체크인 시 배정받는 동에 따라 객실 이미지와 상이할 수 있습니다",
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
                .toList(), userName: '', userImgTitle: '',
          ),
          Review(
            rating: 3,
            comment: "별루였어요. 다음에는 다른 곳을 이용해볼 생각입니다.", userName: '', userImgTitle: '',
          ),
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
                .toList(), userName: '', userImgTitle: '',
          ),
          Review(
            rating: 3,
            comment: "별루였어요. 다음에는 다른 곳을 이용해볼 생각입니다.", userName: '', userImgTitle: '',
          ),
        ],
      ),
      Stay(
        stayImgTitle: "hotel/hotel1.png",
        stayName: "★당일특가★ 하이원리조트 마운틴콘도",
        stayInfo:
            "복층 구조의 넓고 여유로운 공간, 고급 대리석과 원목 마루로 마감한 격조높은 인테리어가 차원이 다른 편안함을 드립니다\n최고의 부대시설을 갖춘 마운틴 콘도에서 내 집처럼 편안한 휴식을 취해 보세요",
        location: "강원 정선군 고한읍 고한리 438",
        notice:
            "리조트 시설 확인 및 운영여부, 운영시간, 기타문의 등 하이원리조트 대표번호 (1588-7789) 문의 부탁 드립니다\n객실 이미지는 대표 객실이며, 체크인 시 배정받는 동에 따라 객실 이미지와 상이할 수 있습니다",
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
                .toList(), userName: '', userImgTitle: '',
          ),
          Review(
            rating: 3,
            comment: "별루였어요. 다음에는 다른 곳을 이용해볼 생각입니다.", userName: '', userImgTitle: '',
          ),
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
                .toList(), userName: '', userImgTitle: '',
          ),
          Review(
            rating: 3,
            comment: "별루였어요. 다음에는 다른 곳을 이용해볼 생각입니다.", userName: '', userImgTitle: '',
          ),
        ],
      ),
    ];

    // 국내 숙소 리스트
    List<Stay> dometicesStayItemList = [
      Stay(
        stayImgTitle: "hotel/hotel2.png",
        stayName: "★당일특가★ 하이원리조트 마운틴콘도",
        stayInfo:
            "복층 구조의 넓고 여유로운 공간, 고급 대리석과 원목 마루로 마감한 격조높은 인테리어가 차원이 다른 편안함을 드립니다\n최고의 부대시설을 갖춘 마운틴 콘도에서 내 집처럼 편안한 휴식을 취해 보세요",
        location: "강원 정선군 고한읍 고한리 438",
        notice:
            "리조트 시설 확인 및 운영여부, 운영시간, 기타문의 등 하이원리조트 대표번호 (1588-7789) 문의 부탁 드립니다\n객실 이미지는 대표 객실이며, 체크인 시 배정받는 동에 따라 객실 이미지와 상이할 수 있습니다",
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
                .toList(), userName: '', userImgTitle: '',
          ),
          Review(
            rating: 3,
            comment: "별루였어요. 다음에는 다른 곳을 이용해볼 생각입니다.", userName: '', userImgTitle: '',
          ),
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
                .toList(), userName: '', userImgTitle: '',
          ),
          Review(
            rating: 3,
            comment: "별루였어요. 다음에는 다른 곳을 이용해볼 생각입니다.", userName: '', userImgTitle: '',
          ),
        ],
      ),
      Stay(
        stayImgTitle: "hotel/hotel2.png",
        stayName: "★당일특가★ 하이원리조트 마운틴콘도",
        stayInfo:
        "복층 구조의 넓고 여유로운 공간, 고급 대리석과 원목 마루로 마감한 격조높은 인테리어가 차원이 다른 편안함을 드립니다\n최고의 부대시설을 갖춘 마운틴 콘도에서 내 집처럼 편안한 휴식을 취해 보세요",
        location: "강원 정선군 고한읍 고한리 438",
        notice:
        "리조트 시설 확인 및 운영여부, 운영시간, 기타문의 등 하이원리조트 대표번호 (1588-7789) 문의 부탁 드립니다\n객실 이미지는 대표 객실이며, 체크인 시 배정받는 동에 따라 객실 이미지와 상이할 수 있습니다",
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
                .toList(), userName: '', userImgTitle: '',
          ),
          Review(
            rating: 3,
            comment: "별루였어요. 다음에는 다른 곳을 이용해볼 생각입니다.", userName: '', userImgTitle: '',
          ),
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
                .toList(), userName: '', userImgTitle: '',
          ),
          Review(
            rating: 3,
            comment: "별루였어요. 다음에는 다른 곳을 이용해볼 생각입니다.", userName: '', userImgTitle: '',
          ),
        ],
      ),
      Stay(
        stayImgTitle: "hotel/hotel2.png",
        stayName: "★당일특가★ 하이원리조트 마운틴콘도",
        stayInfo:
        "복층 구조의 넓고 여유로운 공간, 고급 대리석과 원목 마루로 마감한 격조높은 인테리어가 차원이 다른 편안함을 드립니다\n최고의 부대시설을 갖춘 마운틴 콘도에서 내 집처럼 편안한 휴식을 취해 보세요",
        location: "강원 정선군 고한읍 고한리 438",
        notice:
        "리조트 시설 확인 및 운영여부, 운영시간, 기타문의 등 하이원리조트 대표번호 (1588-7789) 문의 부탁 드립니다\n객실 이미지는 대표 객실이며, 체크인 시 배정받는 동에 따라 객실 이미지와 상이할 수 있습니다",
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
                .toList(), userName: '', userImgTitle: '',
          ),
          Review(
            rating: 3,
            comment: "별루였어요. 다음에는 다른 곳을 이용해볼 생각입니다.", userName: '', userImgTitle: '',
          ),
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
                .toList(), userName: '', userImgTitle: '',
          ),
          Review(
            rating: 3,
            comment: "별루였어요. 다음에는 다른 곳을 이용해볼 생각입니다.", userName: '', userImgTitle: '',
          ),
        ],
      ),
    ];
    // 해외 숙소 리스트
    List<Stay> overseasStayItemList = [
    Stay(
      stayImgTitle: "camping/camping1.png",
      stayName: "영흥도 코코로망스 카라반",
      stayInfo: "도심에서 가깝고, 바다가 보이는 코코로망스입니다\n다양한 부대시설을 구비하였으며 카라반 및 캠핑이 가능합니다",
      location: "인천 옹진군 영흥면 내리 1651-4",
      notice: "...",
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
              .toList(), userName: '', userImgTitle: '',
        ),
        Review(
          rating: 3,
          comment: "별루였어요. 다음에는 다른 곳을 이용해볼 생각입니다.", userName: '', userImgTitle: '',
        ),
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
              .toList(), userName: '', userImgTitle: '',
        ),
        Review(
          rating: 3,
          comment: "별루였어요. 다음에는 다른 곳을 이용해볼 생각입니다.", userName: '', userImgTitle: '',
        ),
      ],
    ),
      Stay(
        stayImgTitle: "camping/camping1.png",
        stayName: "영흥도 코코로망스 카라반",
        stayInfo: "도심에서 가깝고, 바다가 보이는 코코로망스입니다\n다양한 부대시설을 구비하였으며 카라반 및 캠핑이 가능합니다",
        location: "인천 옹진군 영흥면 내리 1651-4",
        notice: "...",
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
                .toList(), userName: '', userImgTitle: '',
          ),
          Review(
            rating: 3,
            comment: "별루였어요. 다음에는 다른 곳을 이용해볼 생각입니다.", userName: '', userImgTitle: '',
          ),
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
                .toList(), userName: '', userImgTitle: '',
          ),
          Review(
            rating: 3,
            comment: "별루였어요. 다음에는 다른 곳을 이용해볼 생각입니다.", userName: '', userImgTitle: '',
          ),
        ],
      ),
      Stay(
        stayImgTitle: "camping/camping1.png",
        stayName: "영흥도 코코로망스 카라반",
        stayInfo: "도심에서 가깝고, 바다가 보이는 코코로망스입니다\n다양한 부대시설을 구비하였으며 카라반 및 캠핑이 가능합니다",
        location: "인천 옹진군 영흥면 내리 1651-4",
        notice: "...",
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
                .toList(), userName: '', userImgTitle: '',
          ),
          Review(
            rating: 3,
            comment: "별루였어요. 다음에는 다른 곳을 이용해볼 생각입니다.", userName: '', userImgTitle: '',
          ),
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
                .toList(), userName: '', userImgTitle: '',
          ),
          Review(
            rating: 3,
            comment: "별루였어요. 다음에는 다른 곳을 이용해볼 생각입니다.", userName: '', userImgTitle: '',
          ),
        ],
      ),
    ];

    return Scaffold(
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            SizedBox(height: gap_xm),
            // 상단 로고, 벨 아이콘 + 상단 아이콘
            HomeHeader(),
            SizedBox(height: gap_m),
            Container(
              width: double.infinity,
              height: 180,
              child: HomeBodyBanner(
                  eventTitleBannerDataList: eventTitleBannerDataList),
            ),
            // 이미지와 텍스트를 가로 스크롤로 구성
            SizedBox(height: gap_m),
            HomeBody(
              title: "특가 숙소",
              stayData: saleStayList, // 특가 숙소 리스트 전달
            ),
            HomeBody(
              title: "국내 숙소",
              stayData: dometicesStayItemList, // 국내 숙소 리스트 전달
            ),
            HomeBody(
              title: "해외 숙소",
              stayData: overseasStayItemList, // 해외 숙소 리스트 전달
            ),
          ],
        ),
      ),
      // 맨 위, 맨 아래로 이동하는 버튼
      floatingActionButton: ScrollFAB(controller: _scrollController),
    );
  }
}
