import 'package:flutter/material.dart';
import 'package:yogi_project/data/models/Reply.dart';
import 'package:yogi_project/data/models/event_my_page_banner.dart';
import 'package:yogi_project/data/models/event_title_banner.dart';
import 'package:yogi_project/data/models/payment.dart';
import 'package:yogi_project/data/models/review.dart';
import 'package:yogi_project/data/models/room.dart';
import 'package:yogi_project/data/models/stay.dart';
import 'package:yogi_project/data/models/user.dart';
import 'package:yogi_project/ui/pages/_main_holder.dart';
import 'package:yogi_project/ui/pages/auth/join/join_page.dart';
import 'package:yogi_project/ui/pages/auth/login/login_page.dart';
import 'package:yogi_project/ui/pages/book/reservation_page.dart';
import 'package:yogi_project/ui/pages/book/widgets/reservaion_list.dart';
import 'package:yogi_project/ui/pages/home/home_page.dart';
import 'package:yogi_project/ui/pages/my/my_page.dart';
import 'package:yogi_project/ui/pages/pay/payment_page.dart';
import 'package:yogi_project/ui/pages/room/room_detail_page.dart';
import 'package:yogi_project/ui/pages/scrap/scrap_list_page.dart';
import 'package:yogi_project/ui/pages/search/search_page.dart';
import 'package:yogi_project/ui/pages/stay/stay_detail_page.dart';
import 'package:yogi_project/ui/pages/stay/stay_list_pages/camping_stay_list.dart';
import 'package:yogi_project/ui/pages/stay/stay_list_pages/guest_house_stay_list.dart';
import 'package:yogi_project/ui/pages/stay/stay_list_pages/home_and_billa_stay_list.dart';
import 'package:yogi_project/ui/pages/stay/stay_list_pages/hotel_stay_list.dart';
import 'package:yogi_project/ui/pages/stay/stay_list_pages/motel_stay_list.dart';
import 'package:yogi_project/ui/pages/stay/stay_list_pages/overseas_stay_list.dart';
import 'package:yogi_project/ui/pages/stay/stay_list_pages/pension_stay_list.dart';
import 'package:yogi_project/ui/pages/stay/stay_list_pages/sale_stay_list.dart';

// 이하 내용은 동일

// URL 설정
class Move {
  static String loginPage = "/users/login";
  static String joinPage = "/users/join";
  static String homePage = "/home";
  static String mainHolder = "/main";
  static String searchPage = "/search";
  static String scrapPage = "/scrap";
  static String myPage = "/my";
  static String stayDetailPage = "/stay";
  static String roomDetailPage = "/room";
  static String bookList = "/my-reservations";
  static String overseasBookList = "/book/overseas";
  static String overseasStayList = "/Overseas";
  static String saleStayList = "/sale";
  static String hotelStayList = "/hotel";
  static String motelStayList = "/motel";
  static String pensionStayList = "/spension";
  static String homeAndBillaStayList = "/homeAndBilla";
  static String campingStayList = "/camping";
  static String guestHouseStayList = "/guestHouse";
  static String reservationPage = "/api/my-reservations";
  static String paymetPage = "/pay";
  static String eventPage = "/event";
}

final User users = User(
  id: 1,
  username: '홍길동',
  email: '123@nate.com',
  password: '1234',
  createdAt: null,
  updatedAt: null,
);

// Sample data for stay and room
final Stay stays = Stay(
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
              comment: reply.text,
              userName: '',
              userImgTitle: 'user1.png',
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
);

final Room rooms = Room(
    roomId:1,
    personCount:'2',
    roomName: '슈페리어 더블',
    roomImgTitle: 'hotel/hotelRoom1.png',
    price: 142000,
    specialPrice: 130000,
    checkInDate: '2024-04-30',
    checkOutDate: '2024-05-01',
    checkInTime: '15:00',
    checkOutTime: "11:00",
    roomInfo: '기준2인 · 최대2\n더블베드 1개\n객실+욕실 / 12.74평',
    amenities:
        'TV, 미니냉장고, 미니바(유료), 금고, 전화기, 전기포트, 휴대폰충전기, 무료생수(2병), 커피, 티, 헤어드라이어, 비데, 욕실용품, 머리빗, 면봉, 손톱줄, 슬리퍼',
    notice: '스마트앱 체크인만 가능\n비대면 체크인,대면시 추가요금발생\n여기어때 발송 입퇴실시간 무관:하이원 발송 시간 확인');

final Payment pays = Payment(
  payAt: DateTime.parse('2024-04-20'),
  way: '카드결제',

);

final List<EventTitleBannerData> eventTitleBannerDataList = [
  EventTitleBannerData(
    imageTitle: 'event/event_title/eventTitle1.png',
    bannerTitle: '',
    imagePath: 'assets/images/event/event_title/eventTitle1.png',
  ),
  EventTitleBannerData(
    imageTitle: 'event/event_title/eventTitle2.png',
    bannerTitle: '',
    imagePath: 'assets/images/event/event_title/eventTitle2.png',
  ),
  EventTitleBannerData(
    imageTitle: 'event/event_title/eventTitle3.png',
    bannerTitle: '',
    imagePath: 'assets/images/event/event_title/eventTitle3.png',
  ),
  EventTitleBannerData(
    imageTitle: 'event/event_title/eventTitle4.png',
    bannerTitle: '',
    imagePath: 'assets/images/event/event_title/eventTitle4.png',
  ),
];

final List<EventMyPageBannerData> eventMyPageBannerDataList = [
  EventMyPageBannerData(
    imageTitle: '신규 회원 할인 이벤트',
    bannerTitle: '',
    imagePath: 'assets/images/event/event_title/eventTitle1.png',
    deadLine: ' 신규 회원 가입시',
  ),
  EventMyPageBannerData(
    imageTitle: '여어떻노 GOOD REVIEWER 이벤트',
    bannerTitle: '',
    imagePath: 'assets/images/event/event_title/eventTitle2.png',
    deadLine: ' 24/12/31 까지 ',
  ),
  EventMyPageBannerData(
    imageTitle: '가정의 달 할인 이벤트',
    bannerTitle: '',
    imagePath: 'assets/images/event/event_title/eventTitle3.png',
    deadLine: ' 24/5/31 까지 ',
  ),
  EventMyPageBannerData(
    imageTitle: '슈퍼위크 이벤트',
    bannerTitle: '',
    imagePath: 'assets/images/event/event_title/eventTitle4.png',
    deadLine: ' 24/5/20 부터 ~ 24/5/26 까지 ',
  ),
];

// URL에 해당 페이지 연결
Map<String, Widget Function(BuildContext)> getRouters() {
  return {
    Move.loginPage: (context) => const LoginPage(),
    // 로그인 페이지
    Move.joinPage: (context) => JoinPage(),
    // 회원가입 페이지
    Move.homePage: (context) => HomePage(),
    // 홈 페이지
    Move.mainHolder: (context) => MainHolder(),
    // 홈 페이지
    Move.searchPage: (context) => SearchPage(),
    // 검색 페이지
    Move.scrapPage: (context) => ScrapListPage(),
    // 내 주변 페이지
    Move.myPage: (context) => MyPage(
          users: users,
      stays: stays,
          eventMyPageBannerData: eventMyPageBannerDataList,
        ),
    // 마이 페이지
    Move.stayDetailPage: (context) =>
        StayDetailPage(stays: stays, rooms: rooms),
    // 기업(숙서) 페이지
    Move.roomDetailPage: (context) => RoomDetailPage(rooms: rooms),
    // 룸 상세보기 페이지

    Move.reservationPage: (context) => ReservationPage(rooms: rooms),
    // 예약 페이지
    Move.paymetPage: (context) => const PaymentPage(),
    // 결제 페이지
    Move.bookList: (context) => ReservationList(domesticbookList: []),
    // 국내 숙소 예약확인 페이지
    Move.overseasStayList: (context) => OverseasStayList(),
    // 해외 숙소 페이지
    Move.saleStayList: (context) => SaleStayList(),
    // 특가 숙소 페이지
    Move.hotelStayList: (context) => const HotelStayList(),
    // 호텔 숙소 페이지
    Move.motelStayList: (context) => const MotelStayList(),
    // 모텔 숙소 페이지
    Move.pensionStayList: (context) => const PensionStayList(),
    // 펜션 숙소 페이지
    Move.homeAndBillaStayList: (context) => const HomeAndBillaStayList(),
    // 홈&빌라 숙소 페이지
    Move.campingStayList: (context) => const CampingStayList(),
    // 캠핑 숙소 리스트
    Move.guestHouseStayList: (context) => const GuestHouseStayList(),
    // 게하 숙소 페이지),
  };
}
