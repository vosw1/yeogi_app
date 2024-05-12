import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:yogi_project/_core/constants/size.dart';
import 'package:yogi_project/_core/constants/style.dart';
import 'package:yogi_project/data/dtos/pay_request.dart';
import 'package:yogi_project/data/repositories/pay_repository.dart';
import 'package:yogi_project/data/store/session_store.dart';
import 'package:yogi_project/ui/pages/my/pay/widgets/total_pay.dart';
import 'package:yogi_project/ui/pages/my/reservation/widgets/reservation_list_model.dart';

class PayPage extends ConsumerWidget {
  const PayPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sessionStore = ref.read(sessionProvider);
    final payRepositoryProvider = Provider((ref) => PayRepository(Dio(), Logger()));
    final payRepository = ref.read(payRepositoryProvider);

    void handlePayment() async {
      // 임시로 결제 정보 생성, 실제로는 사용자 입력을 받아야 합니다.
      PaySaveReqDTO payInfo = PaySaveReqDTO(
        payId: 1,
        reservationId: 1,
        amount: 10000,
        way: "Credit Card",
        state: "COMPLETE",
        payAt: DateTime.now(),
      );

      try {
        var response = await payRepository.fetchPaySave(payInfo, sessionStore.accessToken!);
        if (response.status == 200) {
          Get.snackbar("Success", "Payment successful.");
          Get.to(() => TotalPayment());
        } else {
          Get.snackbar("Error", "Failed to process payment: ${response.errorMessage}");
        }
      } catch (e) {
        Get.snackbar("Error", "An error occurred: $e");
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
              padding: const EdgeInsets.all(gap_m),
              child: Text(
                "결제 방법",
                style: h5(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(gap_m),
              child: Text(
                "신용카드/페이코/카카오페이/네이버페이",
                style: subtitle1(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: gap_m, left: gap_m, bottom: gap_s),
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(gap_s),
                ),
                child: ElevatedButton(
                  onPressed: handlePayment,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    padding: EdgeInsets.symmetric(
                      vertical: gap_s / 2,
                      horizontal: gap_xxl,
                    ),
                  ),
                  child: Text(
                    '결제하기',
                    style: TextStyle(fontSize: 16.0, color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(height: 150),
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
      ),
    );
  }
}
