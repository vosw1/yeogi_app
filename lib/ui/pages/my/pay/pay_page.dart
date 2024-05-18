import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:yogi_project/data/dtos/pay_request.dart';
import 'package:yogi_project/data/repositories/pay_repository.dart';
import 'package:yogi_project/data/store/session_store.dart';
import 'package:yogi_project/ui/pages/my/pay/widgets/total_pay.dart';
import 'package:dio/dio.dart';


final logger = Logger();

class PayPage extends ConsumerWidget {
  const PayPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final payRepository = PayRepository(Dio(), Logger());
    final sessionStore = ref.read(sessionProvider); // 세션 스토어 인스턴스 생성

    Future<void> handlePayment(BuildContext context) async {
      logger.d('handlePayment called');

      // 세션 스토어에서 액세스 토큰 가져오기 시도
      final accessToken = await sessionStore.accessToken;
      logger.d("Access Token: $accessToken");

      // 액세스 토큰이 없으면 예외 처리
      if (accessToken == null) {
        logger.d('토큰이 유효하지 않습니다');
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Access token not available.")));
        return;
      }

      // 임시로 결제 정보 생성, 실제로는 사용자 입력을 받아야 합니다.
      final payInfo = PaySaveReqDTO(
        payId: 1,
        reservationId: 1,
        amount: 10000,
        way: "Credit Card",
        state: "COMPLETE",
        payAt: DateTime.now(),
      );

      try {
        logger.d('Calling fetchPaySave');
        final response = await payRepository.fetchPaySave(payInfo, accessToken!);

        logger.d('Payment response status: ${response.status}');
        if (response.status == 200) {
          logger.d('Payment successful.');
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Payment successful.")));
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TotalPayment()),
          );
        } else {
          logger.d('Failed to process payment: ${response.errorMessage}');
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Failed to process payment: ${response.errorMessage}")));
        }
      } catch (e) {
        logger.e('Error occurred: $e');
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("An error occurred: $e")));
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('결제 페이지'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "결제 방법",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "신용카드/페이코/카카오페이/네이버페이",
                style: TextStyle(fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16.0, left: 16.0, bottom: 16.0),
              child: Container(
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: () {
                    logger.d('Payment button pressed');
                    handlePayment(context); // 컨텍스트 전달
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                  ),
                  child: Text(
                    '결제하기',
                    style: TextStyle(fontSize: 16.0, color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(height: 150),
            Container(
              color: Colors.grey.shade100,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
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
    );
  }
}
