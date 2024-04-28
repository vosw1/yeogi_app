import 'package:flutter/material.dart';
import 'package:yogi_project/ui/pages/stay/domestic_stay_page/domestic_stay_page.dart';
import 'package:yogi_project/ui/pages/stay/overseas_stay_page/overseas_stay_page.dart';

import '../../../../data/dtos/book_request.dart';
import '../../../../data/models/stay.dart';
// 마이페이지의 예약메뉴
class MyPageBookMenuHolder extends StatelessWidget {
  final Stay stayData;

  MyPageBookMenuHolder({required this.stayData});


  @override
  Widget build(BuildContext context) {
    // 샘플 국내예약 데이터 목록
    final List<Book> bookInKoreaList = [
      Book(
        stayImgTitle: "stay1.png",
        stayName: "소래포구 3S",
        roomName: "오픈특가룸",
        location: "인천 남동구 논현동",
        checkInDate: "2024.4.30",
        checkOutDate: "2024.5.2",
        personCount: "2명",
        price: 50000,
      ),
    ];

    // 샘플 해외예약 데이터 목록
    final List<Book> bookInAbroardList = [
      Book(
        stayImgTitle: "stayaboard1.png",
        stayName: "샹그릴라 탄중아루",
        roomName: "최저가보장룸",
        location: "Shangri-La Tanjung Aru, Kota Kinabalu",
        checkInDate: "2024.4.30",
        checkOutDate: "2024.5.2",
        personCount: "2명",
        price: 100000,
      ),
    ];

    return Column(
      children: <Widget>[
        ListTile( // 예약내역 타이틀
          title: Text('예약내역', style: TextStyle(fontWeight: FontWeight.bold)),
          onTap: () {

          },
        ),
        ListTile( // 국내숙소 리스트
          title: Text('국내숙소'),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {
            // 국내 숙소 탭 시 BookInKoreaPage로 모든 예약 데이터 목록을 전달
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DomesticStayPage(bookInKoreaList: bookInKoreaList), // 수정된 생성자에 전체 목록 전달
              ),
            );
          },
        ),
        ListTile( // 해외숙소 리스트
          title: Text('해외숙소'),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {
            // 해외숙소 탭 시 BookInAbroadPage로 이동
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OverseasStayPage(bookInAbroardList: bookInAbroardList, stayData: stayData,), // 수정된 생성자에 전체 목록 전달
              ),
            );
          },
        ),
      ],
    );
  }
}
