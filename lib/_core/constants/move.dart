import 'package:flutter/material.dart';

import 'package:yogi_project/data/models/payment.dart';
import 'package:yogi_project/data/models/room.dart';
import 'package:yogi_project/data/models/stay.dart';
import 'package:yogi_project/data/models/user.dart';
import 'package:yogi_project/ui/pages/auth/join/join_page.dart';
import 'package:yogi_project/ui/pages/book/widgets/book_list.dart';
import 'package:yogi_project/ui/pages/book/widgets/overseas_book_list.dart';
import 'package:yogi_project/ui/pages/pay/payment_page.dart';
import 'package:yogi_project/ui/pages/room/room_detail_page.dart';
import 'package:yogi_project/ui/pages/book/book_page.dart';
import 'package:yogi_project/ui/pages/home/home_page.dart';
import 'package:yogi_project/ui/pages/auth/login/login_page.dart';
import 'package:yogi_project/ui/pages/my/my_page.dart';
import 'package:yogi_project/ui/pages/scrap/scrap_list_page.dart';
import 'package:yogi_project/ui/pages/search/search_page.dart';
import 'package:yogi_project/ui/pages/stay/stay_list_pages/camping_stay_list.dart';
import 'package:yogi_project/ui/pages/stay/stay_list_pages/guest_house_stay_list.dart';
import 'package:yogi_project/ui/pages/stay/stay_list_pages/home_and_billa_stay_list.dart';
import 'package:yogi_project/ui/pages/stay/stay_list_pages/hotel_stay_list.dart';
import 'package:yogi_project/ui/pages/stay/stay_list_pages/motel_stay_list.dart';
import 'package:yogi_project/ui/pages/stay/stay_list_pages/overseas_stay_list.dart';
import 'package:yogi_project/ui/pages/stay/stay_list_pages/pension_stay_list.dart';
import 'package:yogi_project/ui/pages/stay/stay_list_pages/sale_stay_list.dart';
import 'package:yogi_project/ui/pages/stay/stay_detail_page.dart';

// URL 설정
class Move {
  static String loginPage = "/login";
  static String joinPage = "/join";
  static String homePage = "/home";
  static String searchPage = "/search";
  static String scrapPage = "/scrap";
  static String myPage = "/my";
  static String stayDetailPage = "/stay";
  static String roomDetailPage = "/room";
  static String bookList = "/book/list";
  static String overseasBookList = "/book/overseas";
  static String overseasStayList = "/Overseas";
  static String saleStayList = "/sale";
  static String hotelStayList = "/hotel";
  static String motelStayList = "/motel";
  static String pensionStayList = "/spension";
  static String homeAndBillaStayList = "/homeAndBilla";
  static String campingStayList = "/camping";
  static String guestHouseStayList = "/guestHouse";
  static String bookPage = "/book";
  static String paymetPage = "/pay";
}

final User userData = User(
  username: '홍길동',
  password: '1234',
  phone: '010-1234-5678',
  birth: '1988-11-11',
);

// Sample data for stay and room
final Stay stayData = Stay(
  stayName: '★당일특가★ 하이원리조트 마운틴콘도',
  stayImgTitle: 'hotel/hotel1.png',
  location: '강원 정선군 고한읍 고한리 438',
  stayInfo: 'dsh',
  notice: 'ttfdgjn',
  reviews: [
    {
      'starCount': 5,
      'comment': 'tjgdfsz',
    }
  ],
);

final Room roomData = Room(
  roomName: '마운틴 패밀리 스위트',
  roomImgTitle: 'hotel/hotel1.png',
  price: 100000,
  checkInDate: '2024-04-30',
  checkOutDate: '2024-05-01',
  checkInTime: '18:00',
  checkOutTime: "11:00",
  roomInfo: '',
  amenities: '',
  notice: '',
);

final Payment payData = Payment(
  roomImgTitle: '',
  roomName: '',
  location: '',
  checkInDate: '',
  checkOutDate: '',
  personCount: '',
  price: 10000,
  cancellationAndRefundPolicy: '',
);

// URL에 해당 페이지 연결
Map<String, Widget Function(BuildContext)> getRouters() {
  return {
    Move.loginPage: (context) => const LoginPage(),
    // 로그인 페이지
    Move.joinPage: (context) => JoinPage(),
    // 회원가입 페이지
    Move.homePage: (context) => HomePage(),
    // 홈 페이지
    Move.searchPage: (context) => SearchPage(),
    // 검색 페이지
    Move.scrapPage: (context) => ScrapListPage(),
    // 내 주변 페이지
    Move.myPage: (context) => MyPage(
      userData: userData,
      stayData: stayData,
    ),
    // 마이 페이지
    Move.stayDetailPage: (context) => StayDetailPage(stayData: stayData, roomData: roomData),
    // 기업(숙서) 페이지
    Move.roomDetailPage: (context) => RoomDetailPage(
      roomData: roomData,
    ),
    Move.bookPage: (context) => BookPage(roomData: roomData),
    // 예약 페이지
    Move.paymetPage: (context) => const PaymentPage(),
    Move.bookList: (context) => BookList(domesticbookList: []),
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

