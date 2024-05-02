import 'package:flutter/material.dart';
import 'package:yogi_project/_core/constants/scroll_fab.dart';
import 'package:yogi_project/_core/constants/size.dart';
import 'package:yogi_project/data/models/home_banner.dart';
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
          {
            'starCount': 4,
            'comment':
                "스노우월드 가기위해서 객실 예약을 했는데 늦은시간 입실했지만 조용하고 24시간 편의점도 꽤 커서 잘 놀다가요! 객실도 따뜻하고 깨끗해서 너무 좋았고 화장실도 두개나 있어서 여유있게 사용했습니다 :) 스노우월드는 너무 너무 강추해요!!! 다음엔 스키타러 또 올게요~",
          },
          {
            'starCount': 3,
            'comment': "별루였어요. 다음에는 다른 곳을 이용해볼 생각입니다.",
          },
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
          {
            'starCount': 4,
            'comment':
                "스노우월드 가기위해서 객실 예약을 했는데 늦은시간 입실했지만 조용하고 24시간 편의점도 꽤 커서 잘 놀다가요! 객실도 따뜻하고 깨끗해서 너무 좋았고 화장실도 두개나 있어서 여유있게 사용했습니다 :) 스노우월드는 너무 너무 강추해요!!! 다음엔 스키타러 또 올게요~",
          },
          {
            'starCount': 3,
            'comment': "별루였어요. 다음에는 다른 곳을 이용해볼 생각입니다.",
          },
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
          {
            'starCount': 4,
            'comment':
                "스노우월드 가기위해서 객실 예약을 했는데 늦은시간 입실했지만 조용하고 24시간 편의점도 꽤 커서 잘 놀다가요! 객실도 따뜻하고 깨끗해서 너무 좋았고 화장실도 두개나 있어서 여유있게 사용했습니다 :) 스노우월드는 너무 너무 강추해요!!! 다음엔 스키타러 또 올게요~",
          },
          {
            'starCount': 3,
            'comment': "별루였어요. 다음에는 다른 곳을 이용해볼 생각입니다.",
          },
        ],
      ),
    ];
    // 국내 숙소 리스트
    List<Stay> dometicesStayItemList = [
      Stay(
        stayImgTitle: "hotel/hotel1.png",
        stayName: "제주의 아침",
        stayInfo: "ㅇ",
        location: "제주도",
        notice: "여기요는..",
        reviews: [
          {
            'starCount': 4,
            'comment': "역시 제주도~ 귤 나무들도 너무 예뻤고 산책로도 있어서 너무 좋았어요!!",
          },
          {
            'starCount': 5,
            'comment': "너무 좋았어요.",
          },
        ],
      ),
      Stay(
        stayImgTitle: "hotel/hotel1.png",
        stayName: "제주의 아침",
        stayInfo: "ㅇ",
        location: "제주도",
        notice: "여기요는..",
        reviews: [
          {
            'starCount': 4,
            'comment': "역시 제주도~ 귤 나무들도 너무 예뻤고 산책로도 있어서 너무 좋았어요!!",
          },
          {
            'starCount': 5,
            'comment': "너무 좋았어요.",
          },
        ],
      ),
      Stay(
        stayImgTitle: "hotel/hotel1.png",
        stayName: "제주의 아침",
        stayInfo: "ㅇ",
        location: "제주도",
        notice: "여기요는..",
        reviews: [
          {
            'starCount': 4,
            'comment': "역시 제주도~ 귤 나무들도 너무 예뻤고 산책로도 있어서 너무 좋았어요!!",
          },
          {
            'starCount': 5,
            'comment': "너무 좋았어요.",
          },
        ],
      ),
    ];
    // 해외 숙소 리스트
    List<Stay> overseasStayItemList = [
      Stay(
        stayImgTitle: "overseas/overseas1.png",
        stayName: "두짓타니 괌 리조트",
        stayInfo:
            "본 숙소(두짓타니 괌 리조트)는 괌에 잠시 머물거나 본격 여행을 위해 방문하는 여행객들 사이에서 인기 있는 숙소입니다. 투숙객이 즐거운 시간을 보낼 수 있도록 다양한 시설과 특전을 제공합니다. 24시간 룸서비스, Wi-Fi (무료/전 객실), 24시간 경비 서비스, 일일 청소 서비스, 24시간 프런트 데스크 등 여러 가지를 즐길 수 있습니다. 객실은 최적의 편안함을 제공할 수 있도록 설계되어 있으며, 일부 객실에서 평면 TV, 리넨, 슬리퍼, 타월, 옷장 등을 이용할 수 있습니다. 관광 후 아늑한 객실에서 휴식을 취하거나 온수 욕조, 피트니스센터, 사우나, 실외 수영장, 스파 등을 즐길 수 있습니다. 본 숙소(두짓타니 괌 리조트)를 괌 여행의 근거지로 정해 본격적인 여행을 시작해 보세요.",
        location: "1227 Pale San Vitores Road, Tumon, 투몬 베이, 괌, 괌, 96913",
        notice: "체크인 : 15:00 | 체크아웃 : 12:00\n정확한 체크인/체크아웃 시간은 숙소에 문의해주세요.",
        reviews: [
          {
            'starCount': 4.0,
            'comment':
                "가격이 비싼감이 없지않지만 환율과 괌 물가 대비 적당하다는 생각이 들었어요 일단 깨끗한건 말할것도 없고요 부족함이 없었던 숙소였어요",
          },
          {
            'starCount': 4.5,
            'comment': "너무 좋아서 다음에 또 찾을 예정이에요",
          },
        ],
      ),
    ];

    List<BannerData> bannerDataList = [
      BannerData(
        imageTitle: "hotel/hotel1.png", // 이미지 제목
        bannerTitle: "여어떻노?", // 배너 제목
        bannerText: "퍼뜩 예약하꾸마", // 배너 내용
      ),
      BannerData(
        imageTitle: "hotel/hotel1.png", // 이미지 제목
        bannerTitle: "여어떻노?", // 배너 제목
        bannerText: "퍼뜩 예약하꾸마", // 배너 내용
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
              child: HomeBodyBanner(bannerDataList: bannerDataList),
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
