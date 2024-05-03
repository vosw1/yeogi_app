import 'package:flutter/material.dart';
import 'package:yogi_project/_core/constants/move.dart';
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
        stayImgTitle: "camping/camping1.png",
        stayName: "영흥도 코코로망스 카라반",
        stayInfo:
        "도심에서 가깝고, 바다가 보이는 코코로망스입니다\n다양한 부대시설을 구비하였으며 카라반 및 캠핑이 가능합니다",
        location: "인천 옹진군 영흥면 내리 1651-4",
        notice:
        "20시 이후 체크인 시 사전 문의 필수\n객실 내 취사 불가, 공용개수대 및 주방 시설 이용가능\n카라반 전 객실 요금은 2인 기준이며, 최대 3인까지 투숙가능\n(성인 3명은 비좁을 수 있으니 가급적 가족단위 3인까지 이용 요망)\n[당일이용-숙박불가]피크닉 상품 이용안내\n\n(7세 미만 추가금 없음 -> 고기 미제공)",
        reviews: [
          {
            'starCount': 4,
            'comment':
            "설 연휴에 아이와 함께 가족 여행 다녀왔습니다^^\n사진에서 봤던 것 보다 더 아기자기 하고 예쁘고 관리가 잘된 캠핑장이었구요^^",
          },
          {
            'starCount': 4,
            'comment':
            "좋았어요 ",
          }
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
          {
            'starCount': 5,
            'comment':
            "가평에 4시간달려서 온 조이글램핑장.사진이랑 비슷한 캠핑장에 시설도 주방장비들도 구비되어있어서 좋았어요.",
          },
          {
            'starCount': 4,
            'comment':
            "좋았어요 ",
          }
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
          {
            'starCount': 5,
            'comment':
            "설 연휴에 아이와 함께 가족 여행 다녀왔습니다^^사진에서 봤던것 보다 더 아기자기 하고 예쁘고 관리가 잘된 캠핑장이었구요^^",
          },
          {
            'starCount': 4,
            'comment':
            "좋았어요 ",
          }
        ],
      ),
    ];
    // 국내 숙소 리스트
    List<Stay> dometicesStayItemList = [
      Stay(
        stayImgTitle: "home_and_billa/homeAndBilla4.png",
        stayName: "한 팀만 독채로 머물 수 있는 | 군산 찰리하우스 안채",
        stayInfo:
        "이성당, 초원사진관, 히로스가옥,근대역사박물관,동국사등 주요 관광지를 도보 5분 안에 갈 수 있는 최적의 위치",
        location: "전북특별자치도 군산시 신창동 49-20",
        notice: "입실 : 15시 / 퇴실 11시\n오후 10시 이후에는 사전 문의 필수\n객실 구성 : 객실 2개+거실+욕실",
        reviews: [
          {
            'starCount': 5,
            'comment': "깨끗하고 좋았습니다!",
          },
          {
            'starCount': 4,
            'comment':
            "좋았어요 ",
          }
        ],
      ),
      Stay(
        stayImgTitle: "home_and_billa/homeAndBilla5.png",
        stayName: "넓은 공간으로 여러명이 머물기 적합한 숙소 | 하우스오브갤러리 301",
        stayInfo:
        "넓은 공간으로 여러 명이 함께 머물기 적합하고 중심부에 위치한 숙소입니다.\n관광숙박업등록업체, 현금영수증,신용카드가능",
        location: "대구 남구 대명동 139-12",
        notice:
        "숙소 이용규칙\n인원 추가 비용 : 기준인원 초과시 추가요금 발생 / 영유아 인원수 포함 / 최대인원 초과불가 / 현장 결제\n조식서비스 : 문의",
        reviews: [
        ],
      ),
      Stay(
        stayImgTitle: "home_and_billa/homeAndBilla6.png",
        stayName: "군산 관광중심지에 위치한 | 군산 찰리하우스 바깥채",
        stayInfo:
        "청결을 가장 중요하게 여기는 5성급 호텔 못지 않은 쾌적한 공간\n골목 안쪽에 자리하여 소음으로 부터 차단된 아늑하고 조용한 숙소다",
        location: "전북특별자치도 군산시 신창동 49-20",
        notice: "입실 : 15시 / 퇴실 11시\n오후 10시 이후에는 사전 문의 필수\n객실 구성 : 객실 2개+거실+욕실",
        reviews: [
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
      Stay(
        stayImgTitle: "overseas/overseas4.png",
        stayName: "샹그릴라 탄중아루 코타키나발루",
        stayInfo:
        "본 숙소(샹그릴라스 탄중 아루 리조트 앤드 스파)는 코타키나발루에 잠시 머물거나 본격 여행을 위해 방문하는 여행객들 사이에서 인기 있는 숙소입니다. 투숙객이 즐거운 시간을 보낼 수 있도록 다양한 시설과 특전을 제공합니다. 일일 청소 서비스, 기념품 가게, 프라이빗 체크인/체크아웃, 티켓 서비스, 24시간 프런트 데스크 등을 포함해 필요한 모든 시설이 준비되어 있습니다. 각 객실은 아름답게 꾸며져 있으며 편리한 시설을 갖추고 있습니다. 긴 하루를 보낸 후 카누, 미니골프코스, 워터파크, 윈드서핑, 스노클링 등을 통해 휴식을 취해보시기 바랍니다. 본 숙소(샹그릴라스 탄중 아루 리조트 앤드 스파)를 코타키나발루 여행의 근거지로 정해 본격적인 여행을 시작해 보세요.",
        location: "No 20, Jalan Aru, Tanjung Aru, 탄중 아루, 코타키나발루, 말레이시아, 88100",
        notice: "체크인 : 15:00 | 체크아웃 : 12:00\n정확한 체크인/체크아웃 시간은 숙소에 문의해주세요.",
        reviews: [
          {
            'starCount': 5,
            'comment':
            "명성만큼 선셋타임 맞춰 선셋바는 정말 멋져요. 선셋바 음식은 비싸니 맥주 한 병 시켜 놓고 자연 감상하며 1시간 정도 쉬었다 왔는데 좋았어요 ~ 사진도 많이 남기고요 ! 룸 내부 컨디션은 넓직하나 세월의 흔적이 조금씩 느껴지는 부분이 있었어요 그래도 1층 묵어보니 룸테라스로 나가면 바로 정원과 연결되어 아침에 테라스에서 커피 한 잔 여유 좋았구요 .. 리조트 내 유료 사용 결제는 오로지 카드만 가능합니다 .",
          }
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
          {
            'starCount': 4,
            'comment':
            "They tried to offer everything already, but the building is still too old",
          }
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
              child: HomeBodyBanner(eventTitleBannerDataList: eventTitleBannerDataList),
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
