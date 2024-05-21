import 'package:flutter/material.dart';
import 'package:bootpay/bootpay.dart';
import 'package:bootpay/model/extra.dart';
import 'package:bootpay/model/item.dart';
import 'package:bootpay/model/payload.dart';
import 'package:bootpay/model/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yogi_project/data/dtos/pay_request.dart';
import 'package:yogi_project/data/dtos/reservation_request.dart';
import 'package:yogi_project/ui/pages/my/reservation/my_reservation_page.dart';
import 'package:yogi_project/ui/pages/my/reservation/widgets/reservation_list_model.dart';
import 'dart:convert';

class PayButton extends ConsumerStatefulWidget {
  final ReservationSaveReqDTO reservations;
  final Function onPaymentDone;
  final int id; // 결제 아이디로 사용할 변수

  const PayButton({
    Key? key,
    required this.reservations,
    required this.id, // 결제 아이디로 사용할 변수
    required this.onPaymentDone,
  }) : super(key: key);

  @override
  _PaymentButtonState createState() => _PaymentButtonState();
}

class _PaymentButtonState extends ConsumerState<PayButton> {
  bool isPaymentComplete = false;
  int? payId; // payId 저장 변수

  @override
  void initState() {
    super.initState();
  }

  void handlePayment(BuildContext context) async {
    print("amount 확인: ${widget.reservations.amountToPay}");

    PaySaveReqDTO payInfo = PaySaveReqDTO(
      payId: widget.id,
      reservationId: widget.id,
      amount: widget.reservations.amountToPay,
      way: "나이스페이",
      state: "COMPLETION",
      payAt: DateTime.now(),
    );

    print('PaySaveReqDTO 확인: ${payInfo.toJson()}');

    bootpayTest(context, payInfo);
  }

  void bootpayTest(BuildContext context, PaySaveReqDTO payInfo) {
    Payload payload = getPayload(payInfo);
    Bootpay().requestPayment(
      context: context,
      payload: payload,
      showCloseButton: false,
      onCancel: (String data) {
        print('------- onCancel: $data');
        setState(() {
          isPaymentComplete = false;
        });
        Bootpay().dismiss(context);
      },
      onError: (String data) {
        print('------- onError: $data');
        setState(() {
          isPaymentComplete = false;
        });
      },
      onClose: () {
        print('------- onClose');
        Bootpay().dismiss(context);
      },
      onIssued: (String data) async {
        print('------- onIssued: $data');
        await savePaymentData(data); // 결제 정보 저장
      },
      onConfirm: (String data) {
        print('------- onConfirm: $data');
        return true;
      },
      onDone: (String data) async {
        print('------- onDone: $data');
        // 결제 완료 후 payId를 서버로부터 받아옴
        widget.onPaymentDone();
      },
    );
  }

  Future<void> savePaymentData(String data) async {
    final Map<String, dynamic> jsonData = jsonDecode(data);
    final receiptId = jsonData['data']['receipt_id'];
    final orderId = jsonData['data']['order_id'];
    final amount = jsonData['data']['price'];
    final paymentMethod = jsonData['data']['method'];
    print('아이디 확인 : ${widget.id}--------------------------------');

    // PaySaveReqDTO를 생성하기 전에 로그를 추가하여 데이터를 확인합니다.
    print('결제 금액 확인: $amount');

    PaySaveReqDTO payInfo = PaySaveReqDTO(
      payId: widget.id,
      reservationId: widget.id,
      amount: amount, // 여기에 전달되는 amount 값이 올바른지 확인합니다.
      way: paymentMethod,
      state: "COMPLETION",
      payAt: DateTime.now(),
    );

    try {
      print('결제 정보 저장 시작');
      print('저장할 데이터: ${payInfo.toJson()}');

      final responseDTO =
      await ref.read(reservationListProvider.notifier).paySave(payInfo);

      // 서버 응답을 로그로 출력하여 확인합니다.
      print('결제 정보 저장 완료');
      print('서버 응답: ${responseDTO}');

      // 서버 응답 데이터를 로그로 출력합니다.
      print('Response Data: ${responseDTO.body}');

      // '내 예약 페이지'로 이동
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => MyReservationPage(),
        ),
      );

      // 서버 응답에서 payId를 추출하여 확인합니다.
      if (responseDTO.body is Map<String, dynamic> &&
          responseDTO.body['id'] is int) {
        payId = responseDTO.body['id'];
        // 응답 데이터의 amount 값을 확인합니다.
        print('응답 데이터의 금액: ${responseDTO.body['amount']}');
      } else {
        throw Exception('Invalid response format');
      }
    } catch (e) {
      print('결제 정보 저장 중 오류 발생: $e');
    }
  }

  Payload getPayload(PaySaveReqDTO payInfo) {
    Payload payload = Payload();
    Item item = Item();
    item.name = widget.reservations.reservationName ?? 'Unknown';
    item.qty = 1;
    item.id = widget.reservations.roomId.toString();
    item.price = widget.reservations.amountToPay.toDouble();

    payload.webApplicationId = 'your-web-5b8f6a4d396fa665fdc2b5e7-id';
    payload.androidApplicationId = '5b8f6a4d396fa665fdc2b5e8';
    payload.iosApplicationId = '5b8f6a4d396fa665fdc2b5e9';

    payload.pg = '나이스페이';
    payload.orderName = widget.reservations.reservationName ?? 'Unknown';
    payload.price = widget.reservations.amountToPay.toDouble();
    payload.orderId = DateTime.now().millisecondsSinceEpoch.toString();

    payload.items = [item];

    User user = User();
    user.username = widget.reservations.reservationName ?? 'Unknown';
    user.phone = widget.reservations.reservationTel ?? 'Unknown';

    Extra extra = Extra();
    extra.appScheme = 'bootpayFlutterExample';
    extra.cardQuota = '3';

    payload.user = user;
    payload.extra = extra;
    return payload;
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isPaymentComplete ? null : () => handlePayment(context),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(12),
        backgroundColor: Colors.redAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Text(
        '결제하기',
        style: TextStyle(fontSize: 16.0, color: Colors.white),
      ),
    );
  }
}