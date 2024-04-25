import 'dart:convert';
import 'package:http/http.dart' as http;

class PortOnePaymentService {
  static const String _baseUrl = 'https://api.portone.io/v1/payments';

  // 포트원 API 키
  final String apiKey;

  PortOnePaymentService(this.apiKey);

  Future<void> requestPayment({
    required String itemName,
    required int amount,
    required String buyerEmail,
    required String buyerName,
    required String buyerTel,
    required String buyerAddr,
    required String buyerPostcode,
  }) async {
    // 결제 요청 데이터 구성
    final Map<String, dynamic> requestData = {
      'item_name': itemName,
      'amount': amount,
      'buyer_email': buyerEmail,
      'buyer_name': buyerName,
      'buyer_tel': buyerTel,
      'buyer_addr': buyerAddr,
      'buyer_postcode': buyerPostcode,
      // 기타 필요한 데이터 추가
    };

    // API 호출
    final response = await http.post(
      Uri.parse(_baseUrl),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $apiKey',
        // 포트원 API 인증에 필요한 헤더
      },
      body: jsonEncode(requestData),
    );

    // API 응답 처리
    if (response.statusCode == 200) {
      // 성공적인 응답 처리
      final jsonResponse = jsonDecode(response.body);
      print('결제 성공: $jsonResponse');
      // 여기서 결제 성공 메시지를 표시하거나 다른 작업 수행
    } else {
      // 실패한 경우 오류 처리
      print('결제 실패: ${response.statusCode}');
      // 여기서 오류 메시지를 표시하거나 다른 작업 수행
    }
  }
}

// 사용 예시
void main() async {
  final portOnePaymentService = PortOnePaymentService('0147546517200426');
  await portOnePaymentService.requestPayment(
    itemName: 'Example Item',
    amount: 10000,
    buyerEmail: 'buyer@example.com',
    buyerName: 'Buyer Name',
    buyerTel: '010-1234-5678',
    buyerAddr: 'Buyer Address',
    buyerPostcode: '12345',
  );
}
