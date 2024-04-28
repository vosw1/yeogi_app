import 'package:flutter/material.dart';
import '../../../_core/constants/size.dart';
import '../../../_core/constants/style.dart';

class PaymentPage extends StatelessWidget {
  final Tab itemData;

  const PaymentPage({Key? key, required this.itemData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('결제 페이지'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(gap_m),
            child: Text(
              "결제 수단",
              style: h5(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: gap_m, left: gap_m),
            child: Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 60, // Adjust the height as needed
                    child: ElevatedButton(
                      onPressed: () {
                        // 신용/체크카드 결제 로직 추가
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(gap_s),
                          side: BorderSide(color: Colors.grey), // 테두리 색 설정
                        ),
                        backgroundColor: Colors.white, // 배경색 설정
                      ),
                      child: Text(
                        '신용/체크카드',
                        style: TextStyle(color: Colors.black),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: gap_m),
                Expanded(
                  child: SizedBox(
                    height: 60, // Adjust the height as needed
                    child: ElevatedButton(
                      onPressed: () {
                        // 휴대폰 결제 로직 추가
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(gap_s),
                          side: BorderSide(color: Colors.grey), // 테두리 색 설정
                        ),
                        backgroundColor: Colors.white, // 배경색 설정
                      ),
                      child: Text(
                        '휴대폰 결제',
                        style: TextStyle(color: Colors.black),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: gap_s),
          Padding(
            padding: const EdgeInsets.only(right: gap_m, left: gap_m),
            child: Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 60, // Adjust the height as needed
                    child: ElevatedButton(
                      onPressed: () {
                        // Easy Pay 결제 로직 추가
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(gap_s),
                          side: BorderSide(color: Colors.grey), // 테두리 색 설정
                        ),
                        backgroundColor: Colors.white, // 배경색 설정
                      ),
                      child: Text(
                        'Easy Pay',
                        style: TextStyle(color: Colors.black),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: gap_m),
                Expanded(
                  child: SizedBox(
                    height: 60, // Adjust the height as needed
                    child: ElevatedButton(
                      onPressed: () {
                        // Toss Pay 결제 로직 추가
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(gap_s),
                          side: BorderSide(color: Colors.grey), // 테두리 색 설정
                        ),
                        backgroundColor: Colors.white, // 배경색 설정
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(width: 8), // Adjust the spacing between image and text
                          Text(
                            'Toss Pay',
                            style: TextStyle(color: Colors.black),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
          SizedBox(height: gap_xm),
          Padding(
            padding: const EdgeInsets.only(right: gap_m, left: gap_m, bottom: gap_s),
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(gap_s),
              ),
              child: ElevatedButton(
                onPressed: () {
                  // 전체 가격 결제 로직 추가
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  padding: EdgeInsets.symmetric(
                    vertical: gap_s / 2,
                    horizontal: gap_m * 2,
                  ),
                ),
                child: Text(
                  '예약 완료',
                  style: subtitle1(mColor: Colors.white),
                ),
              ),
            ),
          ),
          SizedBox(height: gap_m),
          SizedBox(height: gap_xs),
          Container(
            color: Colors.grey.shade100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(gap_m),
                  child: Container(
                    child: Text(
                      '''(주)여어떻노\n\n주소 : 부산광역시 중앙대로 749, 범향빌딩 3층\n대표이사 : 최주호 \n사업자등록번호: 122-83-00279 사업자정보확인\n
전자우편주소 : help@ssar.kr\n통신판매번호 : 2024-부산여기-12345 \n관광사업자 등록번호: 제123-12호 \n전화번호 : 1234-5678 \n호스팅서비스제공자의 상호 표시: (주)여어떻노
\n(주)여어떻노는 통신판매중개자로서 통신판매의 당사자가 아니며, 상품의 예약, 이용 및 환불 등과 관련한 의무와 책임은 각 판매자에게 있습니다.''',
                      style: TextStyle(color: Colors.grey.shade900),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
