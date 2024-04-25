import 'package:flutter/material.dart';
import 'package:yogi_project/payment/easy_pay_service.dart'; // 이지페이 서비스를 불러옵니다.
import '../components/data/home_item_data.dart';
import '../size.dart';
import '../style.dart';

class PaymentPage extends StatelessWidget {
  final ItemData itemData;

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
          Text(
            "결제 수단",
            style: h5(),
          ),
          SizedBox(height: gap_m),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    // 신용/체크카드 결제 로직 추가
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(gap_s), // 네모 모양으로 설정
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: gap_s / 2, // 버튼의 세로 패딩 설정
                      horizontal: gap_m * 2, // 버튼의 가로 패딩 설정
                    ),
                  ),
                  child: Text(
                    '신용/체크카드',
                    style: TextStyle(color: Colors.black),
                    textAlign: TextAlign.center, // 텍스트를 가운데 정렬합니다.
                  ),
                ),
              ),
              SizedBox(width: gap_m),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    // 휴대폰 결제 로직 추가
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(gap_s), // 네모 모양으로 설정
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: gap_s / 2, // 버튼의 세로 패딩 설정
                      horizontal: gap_m * 2, // 버튼의 가로 패딩 설정
                    ),
                  ),
                  child: Text(
                    '휴대폰 결제',
                    style: TextStyle(color: Colors.black),
                    textAlign: TextAlign.center, // 텍스트를 가운데 정렬합니다.
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: gap_xs),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    // Easy Pay 결제 로직 추가
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(gap_s), // 네모 모양으로 설정
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: gap_s / 2, // 버튼의 세로 패딩 설정
                      horizontal: gap_m * 2, // 버튼의 가로 패딩 설정
                    ),
                  ),
                  child: Text(
                    'Easy Pay',
                    style: TextStyle(color: Colors.black),
                    textAlign: TextAlign.center, // 텍스트를 가운데 정렬합니다.
                  ),
                ),
              ),
              SizedBox(width: gap_m),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    // Toss Pay 결제 로직 추가
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(gap_s), // 네모 모양으로 설정
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: gap_s / 2, // 버튼의 세로 패딩 설정
                      horizontal: gap_m * 2, // 버튼의 가로 패딩 설정
                    ),
                  ),
                  child: Text(
                    'Toss Pay',
                    style: TextStyle(color: Colors.black),
                    textAlign: TextAlign.center, // 텍스트를 가운데 정렬합니다.
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: gap_s),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: ElevatedButton(
              onPressed: () {
                // 전체 가격 결제 로직 추가
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                padding: EdgeInsets.symmetric(
                  vertical: gap_s / 2, // 버튼의 세로 패딩 설정
                  horizontal: gap_m * 2, // 버튼의 가로 패딩 설정
                ),
              ),
              child: Text(
                '예약 완료', // itemData를 사용하여 가격 표시
                style: subtitle1(mColor: Colors.white),
              ),
            ),
          ),
          Container(
            color: Colors.grey.shade100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text(
                    '''(주)여어떻노\n\n주소 : 부산광역시 중앙대로 749, 범향빌딩 3층\n대표이사 : 최주호 \n사업자등록번호: 122-83-00279 사업자정보확인\n
전자우편주소 : help@ssar.kr\n통신판매번호 : 2024-부산여기-12345 \n관광사업자 등록번호: 제123-12호 \n전화번호 : 1234-5678 \n호스팅서비스제공자의 상호 표시: (주)여어떻노
\n(주)여어떻노는 통신판매중개자로서 통신판매의 당사자가 아니며, 상품의 예약, 이용 및 환불 등과 관련한 의무와 책임은 각 판매자에게 있습니다.''',
                    style: TextStyle(color: Colors.grey.shade900),
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
