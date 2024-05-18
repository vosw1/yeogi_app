import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:yogi_project/_core/constants/http.dart';
import 'package:yogi_project/data/dtos/pay_request.dart';
import 'package:yogi_project/data/dtos/reservation_request.dart';
import 'package:yogi_project/data/repositories/pay_repository.dart';
import 'package:yogi_project/data/store/session_store.dart';
import 'package:bootpay/bootpay.dart';
import 'package:bootpay/model/extra.dart';
import 'package:bootpay/model/item.dart';
import 'package:bootpay/model/payload.dart';
import 'package:bootpay/model/user.dart';

class PayPage extends ConsumerWidget {
  final ReservationSaveReqDTO reservations;

  const PayPage({
    Key? key,
    required this.reservations,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sessionStore = ref.read(sessionProvider);
    final payRepositoryProvider = Provider((ref) => PayRepository(dio, Logger()));
    final payRepository = ref.read(payRepositoryProvider);

    void handlePayment() async {
      // 결제 금액이 최소 100원 이상이 되도록 설정
      int amount = reservations.price < 100 ? 100 : reservations.price;

      PaySaveReqDTO payInfo = PaySaveReqDTO(
        payId: reservations.roomId,
        reservationId: reservations.roomId, // 적절한 예약 ID로 수정 필요
        amount: amount,
        way: "Credit Card",
        state: "COMPLETE",
        payAt: DateTime.now(),
      );

      bootpayTest(context, payInfo);
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
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "신용카드/페이코/카카오페이/네이버페이",
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity, // 가로로 전체를 채우도록 설정
                child: ElevatedButton(
                  onPressed: handlePayment,
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(12),
                    backgroundColor: Colors.redAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text('결제하기',
                      style: TextStyle(fontSize: 16.0, color: Colors.white)),
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

  void bootpayTest(BuildContext context, PaySaveReqDTO payInfo) {
    Payload payload = getPayload(payInfo);
    Bootpay().requestPayment(
      context: context,
      payload: payload,
      showCloseButton: true,
      onCancel: (String data) {
        print('------- onCancel: $data');
        Bootpay().dismiss(context); // 명시적으로 부트페이 뷰 종료 호출
      },
      onError: (String data) {
        print('------- onError: $data');
      },
      onClose: () {
        print('------- onClose');
        Bootpay().dismiss(context); // 명시적으로 부트페이 뷰 종료 호출
      },
      onIssued: (String data) {
        print('------- onIssued: $data');
      },
      onConfirm: (String data) {
        print('------- onConfirm: $data');
        return true;
      },
      onDone: (String data) {
        print('------- onDone: $data');
        // 결제가 완료되었을 때 추가 작업
      },
    );
  }

  Payload getPayload(PaySaveReqDTO payInfo) {
    Payload payload = Payload();
    Item item = Item();
    item.name = reservations.reservationName; // 주문정보에 담길 상품명
    item.qty = 1; // 해당 상품의 주문 수량
    item.id = reservations.roomId.toString(); // 해당 상품의 고유 키
    item.price = payInfo.amount.toDouble(); // 상품의 가격

    payload.webApplicationId = 'your-web-5b8f6a4d396fa665fdc2b5e7-id';
    payload.androidApplicationId = '5b8f6a4d396fa665fdc2b5e8';
    payload.iosApplicationId = '5b8f6a4d396fa665fdc2b5e9';

    payload.pg = '나이스페이';
    payload.orderName = reservations.reservationName; // 결제할 상품명
    payload.price = payInfo.amount.toDouble(); // 결제 금액

    payload.orderId = DateTime.now().millisecondsSinceEpoch.toString(); // 주문번호

    payload.items = [item]; // 상품정보 배열

    User user = User(); // 구매자 정보
    user.username = reservations.reservationName;
    user.phone = reservations.reservationTel;

    Extra extra = Extra(); // 결제 옵션
    extra.appScheme = 'bootpayFlutterExample';
    extra.cardQuota = '3';

    payload.user = user;
    payload.extra = extra;
    return payload;
  }
}
