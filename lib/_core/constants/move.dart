import 'package:flutter/material.dart';

import '../../data/models/payment.dart';
import '../../data/models/room.dart';
import '../../data/models/stay.dart';
import '../../ui/pages/auth/join/join_page.dart';
import '../../ui/pages/pay/payment_page.dart';
import '../../ui/pages/room/room_page.dart';
import '../../ui/pages/stay/camping_stay_page/camping_stay_page.dart';
import '../../ui/pages/stay/domestic_stay_page/domestic_stay_page.dart';
import '../../ui/pages/stay/guest_house_page/guest_house_stay_page.dart';
import '../../ui/pages/stay/home_and_billa_dtay_page/home_and_billa_stay_page.dart';
import '../../ui/pages/stay/hotel_stay_page/hotel_stay_page.dart';
import '../../ui/pages/stay/motel_stay_page/motel_stay_page.dart';
import '../../ui/pages/stay/overseas_stay_page/overseas_stay_page.dart';
import '../../ui/pages/stay/pansion_stay_page/pension_stay_page.dart';
import '../../ui/pages/stay/sale_stay_page/sale_stay_page.dart';
import '../../ui/pages/book/book_page.dart';
import '../../ui/pages/home/home_page.dart';
import '../../ui/pages/auth/login/login_page.dart';
import '../../ui/pages/my/my_page.dart';
import '../../ui/pages/scrap/scarp_page.dart';
import '../../ui/pages/search/search_page.dart';
import '../../ui/pages/stay/stay_page.dart';
import '../../ui/pages/stay/stay_page.dart';

// URL 설정
class Move {
  static String loginPage = "/login";
  static String joinPage = "/join";
  static String homePage = "/home";
  static String searchPage = "/search";
  static String scrapPage = "/scrap";
  static String myPage = "/my";
  static String stayPage = "/stay";
  static String domesticStayPage = "/stay/domestic";
  static String overseasStayPage = "/stay/Overseas";
  static String saleStayPage = "/stay/sale";
  static String hotelStayPage = "/stay/hotel";
  static String motelStayPage = "/stay/motel";
  static String pansionStayPage = "/stay/pansion";
  static String homeAndBillaStayPage = "/stay/homeAndBilla";
  static String campingStayPage = "/stay/camping";
  static String guestHouseStayPage = "/stay/guestHouse";
  static String roomPage = "/room";
  static String bookPage = "/book";
  static String paymetPage = "/pay";
}

// Sample data for stay and room
final Stay stayData = Stay(
  stayName: 'Sample Stay',
  stayImgTitle: 'sample_stay.jpg',
  location: 'Sample Location',
  stayInfo: '',
  notice: '',
  starCount: 1,
  comment: '',
  // Add more properties as needed
);

final Room roomData = Room(
  roomName: 'Sample Room',
  roomImgTitle: 'sample_room.jpg',
  personCount: "2",
  price: 100,
  checkInDate: '2024-04-30',
  checkOutDate: '2024-05-01',
  cancellationAndRefundPolicy: 'Sample Policy',
  roomInfo: '',
  amenities: '',
  notice: '',
  // Add more properties as needed
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
    Move.loginPage: (context) => const LoginPage(), // 로그인 페이지
    Move.joinPage: (context) => const JoinPage(), // 회원가입 페이지
    Move.homePage: (context) => HomePage(), // 홈 페이지
    Move.searchPage: (context) => SearchPage(), // 검색 페이지
    Move.scrapPage: (context) => ScrapPage(), // 내 주변 페이지 TODO : 없어질 수 있음
    Move.myPage: (context) => MyPage(), // 마이 페이지
    Move.stayPage: (context) => StayPage(stayData: stayData), // 기업(숙서) 페이지
    Move.domesticStayPage: (context) => DomesticStayPage(bookInKoreaList: []), // 국내 숙소 페이지
    Move.overseasStayPage: (context) => OverseasStayPage(bookInAbroardList: []), // 해외 숙소 페이지
    Move.saleStayPage: (context) => SaleStayPage(stayData: stayData), // 특가 숙소 페이지
    Move.myPage: (context) => MyPage(), // 마이 페이지
    Move.stayPage: (context) => StayPage(stayData: stayData), // 기업(숙서) 페이지
    Move.domesticStayPage: (context) => DomesticStayPage(bookInKoreaList: []), // 국내 숙소 페이지
    Move.overseasStayPage: (context) => OverseasStayPage(bookInAbroardList: []), // 해외 숙소 페이지
    Move.saleStayPage: (context) => SaleStayPage(stayData: stayData), // 특가 숙소 페이지
    Move.hotelStayPage: (context) => const HotelStayPage(), // 호텔 숙소 페이지
    Move.motelStayPage: (context) => const ModelStayPage(), // 모텔 숙소 페이지
    Move.pansionStayPage: (context) => const PansionStayPage(), // 펜션 숙소 페이지
    Move.homeAndBillaStayPage: (context) => const HomeAndBillaStayPage(), // 홈&빌라 숙소 페이지
    Move.campingStayPage: (context) => const CampingStayPage(), // 캠핑 숙소 페이지
    Move.guestHouseStayPage: (context) => const GuestHouseStayPage(), // 게하 숙소 페이지
    Move.bookPage: (context) => BookPage(roomData: roomData,), // 예약 페이지
    Move.paymetPage: (context) => PaymentPage(),
    Move.roomPage: (context) => RoomPage(stayData: stayData),
    Move.bookPage: (context) => BookPage(roomData: roomData,), // 예약 페이지
    Move.paymetPage: (context) => PaymentPage(),
  };
}