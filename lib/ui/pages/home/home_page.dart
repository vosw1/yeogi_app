import 'package:flutter/material.dart';
import 'package:yogi_project/_core/constants/size.dart';
import 'package:yogi_project/ui/pages/home/widgets/home_body.dart';
import 'package:yogi_project/ui/pages/home/widgets/home_body_banner.dart';
import 'package:yogi_project/ui/pages/home/widgets/home_header.dart';

import '../../../data/models/home_banner.dart';
import '../../../data/models/stay.dart';

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
        stayName: "하이원리조트 마운틴콘도",
        stayInfo: "복층 구조의 넓고 여유로운 공간, 고급 대리석과 원목 마루로 마감한 격조높은 인테리어가 차원이 다른 편안함을 드립니다\n최고의 부대시설을 갖춘 마운틴 콘도에서 내 집처럼 편안한 휴식을 취해 보세요",
        location: "강원 정선군 고한읍 고한리 438",
        notice: "공지사항\n리조트 시설 확인 및 운영여부, 운영시간, 기타문의 등 하이원리조트 대표번호 (1588-7789) 문의 부탁 드립니다\n객실 이미지는 대표 객실이며, 체크인 시 배정받는 동에 따라 객실 이미지와 상이할 수 있습니다",
        starCount: 4.5,
        comment: "스노우월드 가기위해서 객실 예약을 했는데 늦은시간 입실했지만 조용하고 24시간 편의점도 꽤 커서 잘 놀다가요! 객실도 따뜻하고 깨끗해서 너무 좋았고 화장실도 두개나 있어서 여유있게 사용했습니다 :) 스노우월드는 너무 너무 강추해요!!! 다음엔 스키타러 또 올게요~",
      ),
      Stay(
        stayImgTitle: "hotel/hotel2.png",
        stayName: "하이원 그랜드 호텔 컨벤션타워",
        stayInfo: "고객 편의를 위해 호텔 관련 모든 정보의 시스템 구축과 ONE STOP SERVICE 제공에 중점을 둔 호텔입니다\n고객의 니즈를 충족시키기 위해 다양한 유형의 객실을 갖추고 있습니다",
        location: "경기 가평군 북면 목동리 344-1",
        notice: "리조트 시설 확인 및 운영 여부, 운영시간, 할인 적용, 기타 문의 등 하이원리조트 대표번호(1588-7789) 문의 부탁드립니다",
        starCount: 5,
        comment: "삼척촛대바위를 여행하고 오늘 숙박할 하이원그랜드호텔로 향합니다 ",
      ),
      Stay(
        stayImgTitle: "hotel/hotel3.png",
        stayName: "하이원리조트 힐콘도",
        stayInfo: "정선하이원 리조트에 처음으로 가봤는데\n정말 크고 건물도 여러개있더라구요\n왜 셀프체크인 하는지 알것같았어요",
        location: "강원 정선군 고한읍 고한리 1-239",
        notice: "리조트 시설 확인 및 운영여부, 운영시간, 기타문의 등 하이원리조트 대표번호 (1588-7789) 문의 부탁 드립니다",
        starCount: 5,
        comment: "정선하이원 리조트에 처음으로 가봤는데\n정말 크고 건물도 여러개있더라구요\n왜 셀프체크인 하는지 알것같았어요",
      ),
    ];
    // 국내 숙소 리스트
    List<Stay> dometicesStayItemList = [
      Stay(
        stayImgTitle: "guest_house/guestHouse1.png",
        stayName: "전주 소소한 한옥",
        stayInfo: "소소하게 행복이 머무는 공간입니다\n #새로 오픈했어요",
        location: "전북특별자치도 전주시 완산구 풍남동2가 11-2",
        notice: "현장 요금 추가 정보\n인원 추가 시 1인 20000원(영유아 포함)",
        starCount: 4.5,
        comment: "시댁이 전주라 한옥마을 자주 이용하는편인데 지금까지 이용했던 숙소중에 제일 좋았어요~",
      ),
      Stay(
        stayImgTitle: "guest_house/guestHouse2.png",
        stayName: "전주 한옥마을 한옥고택 고을",
        stayInfo: "안녕하세요! 한옥고택고을입니다\n천년의숨결 그대로, 그리고 전주한옥마을이 함께하는 곳\n휴식에 휴식을 더하는 힐링공간으로 초대합니다",
        location: "전라북도 전주시 완산구 풍남동3가 76-63",
        notice: "인원 추가 시 10,000원 (12개월 이상~성인), 12개월 미만 1인까지 무료 (단, 2명부터 요금 발생)",
        starCount: 5,
        comment: "오랫만에 전주한옥마을에서 잤는데 공영주차장2 와 거리가 5~7분정도여서 빠르게 숙소에 들어갈 수 있었어요",
      ),
      Stay(
        stayImgTitle: "guest_house/guestHouse3.png",
        stayName: "군산 여미랑",
        stayInfo: "여미랑(잊을 여, 못할 미, 사랑채 랑)은 아픈 역사를 잊지 말고 하룻밤 묵으면서 만든 추억도 잊지 말자는 의미로,\n일제시대의 아픔을 되새기고자 만들어진 근대역사의 체험공간이자 숙박시설입니다",
        location: "전북 군산시 월명동 16-8",
        notice: "체크인 15~23시까지 (늦은 체크인 미리 연락 필수)\n애완동물 동반 입실 불가",
        starCount: 5,
        comment: "설 연휴에 아이와 함께 가족 여행 다녀왔습니다^^사진에서 봤던것 보다 더 아기자기 하고 예쁘고 관리가 잘된 캠핑장이었구요^^",
      ),
    ];
    // 해외 숙소 리스트
    List<Stay> overseasStayItemList = [
      Stay(
        stayImgTitle: "overseas/overseas1.png",
        stayName: "두짓타니 괌 리조트",
        stayInfo: "본 숙소(두짓타니 괌 리조트)는 괌에 잠시 머물거나 본격 여행을 위해 방문하는 여행객들 사이에서 인기 있는 숙소입니다. 투숙객이 즐거운 시간을 보낼 수 있도록 다양한 시설과 특전을 제공합니다. 24시간 룸서비스, Wi-Fi (무료/전 객실), 24시간 경비 서비스, 일일 청소 서비스, 24시간 프런트 데스크 등 여러 가지를 즐길 수 있습니다. 객실은 최적의 편안함을 제공할 수 있도록 설계되어 있으며, 일부 객실에서 평면 TV, 리넨, 슬리퍼, 타월, 옷장 등을 이용할 수 있습니다. 관광 후 아늑한 객실에서 휴식을 취하거나 온수 욕조, 피트니스센터, 사우나, 실외 수영장, 스파 등을 즐길 수 있습니다. 본 숙소(두짓타니 괌 리조트)를 괌 여행의 근거지로 정해 본격적인 여행을 시작해 보세요.",
        location: "1227 Pale San Vitores Road, Tumon, 투몬 베이, 괌, 괌, 96913",
        notice: "체크인 : 15:00 | 체크아웃 : 12:00\n정확한 체크인/체크아웃 시간은 숙소에 문의해주세요.",
        starCount: 4.0,
        comment: "가격이 비싼감이 없지않지만 환율과 괌 물가 대비 적당하다는 생각이 들었어요 일단 깨끗한건 말할것도 없고요 부족함이 없었던 숙소였어요",),
      Stay(
        stayImgTitle: "overseas/overseas2.png",
        stayName: "호텔 토리피토 하타카 기온",
        stayInfo: "",
        location: "8-24 Reisenmachi, 하카타, 후쿠오카 / 훗쿠오카, 일본, 812-0039",
        notice: "체크인 : 15:00 | 체크아웃 : 12:00\n정확한 체크인/체크아웃 시간은 숙소에 문의해주세요.",
        starCount: 5.0,
        comment: "맘에 들어요 일본숙소치고 룸도 넓고  1인 베드도 넓어서 좋아요 트윈베드에 쇼파베드가 있어 3명이 와도 사용할수있어요",),
      Stay(
        stayImgTitle: "overseas/overseas3.png",
        stayName: "빌리지 호텔 센토사 바이 퍼 이스트 호스피탈리티 (SG 클린 인증)",
        stayInfo: "",
        location: "10 Artillery Avenue, 센토사, 싱가포르 / 싱가폴, 싱가포르, 099951",
        notice: "체크인 : 15:00 | 체크아웃 : 12:00\n정확한 체크인/체크아웃 시간은 숙소에 문의해주세요.",
        starCount: 5.0,
        comment: "다양한 호텔 중에 넓은 수영장과 아주 특별한 외관에 한눈에 반해서 예약한 호텔! 위치도 Imbiah station 모노레일역 바로 앞에 있어서 이동하기도 너무 편했답니다.",),
    ];

    // List<BannerData> bannerDataList = [
    //   BannerData(
    //     imageTitle: "hotel/hotel1.png", // 이미지 제목
    //     bannerTitle: "여어떻노?", // 배너 제목
    //     bannerText: "퍼뜩 예약하꾸마", // 배너 내용
    //   ),
    //   BannerData(
    //     imageTitle: "hotel/hotel1.png", // 이미지 제목
    //     bannerTitle: "여어떻노?", // 배너 제목
    //     bannerText: "퍼뜩 예약하꾸마", // 배너 내용
    //   ),
    // ];

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
              height: 130,
              color: Colors.blue, // 파란색 배경
              child: Center(
                child: Text(
                  '여기는 나중에 이벤트 배너 들어올 자리',
                  style: TextStyle(color: Colors.white),
                ),
              ),
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
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'up_button',
            onPressed: () {
              // 맨 위로 스크롤
              _scrollController.animateTo(
                0,
                duration: Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );
            },
            mini: true, // 버튼 크기 최소화
            backgroundColor: Colors.white,
            child: Icon(Icons.keyboard_arrow_up, color: Colors.black),
          ),
          SizedBox(height: 1), // 버튼 사이의 간격
          FloatingActionButton(
            heroTag: 'down_button',
            onPressed: () {
              // 맨 아래로 스크롤
              _scrollController.animateTo(
                _scrollController.position.maxScrollExtent,
                duration: Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );
            },
            mini: true, // 버튼 크기 최소화
            backgroundColor: Colors.white,
            child: Icon(Icons.keyboard_arrow_down, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
