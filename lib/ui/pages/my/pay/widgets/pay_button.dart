import 'package:flutter/material.dart';
import 'package:bootpay/bootpay.dart';
import 'package:bootpay/model/extra.dart';
import 'package:bootpay/model/item.dart';
import 'package:bootpay/model/payload.dart';
import 'package:bootpay/model/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yogi_project/data/dtos/pay_request.dart';
import 'package:yogi_project/data/dtos/reservation_request.dart';
import 'package:yogi_project/data/dtos/response_dto.dart';
import 'package:yogi_project/data/models/pay.dart';
import 'package:yogi_project/ui/pages/my/reservation/widgets/reservation_list_model.dart';

class PayButton extends ConsumerStatefulWidget {
  final ReservationSaveReqDTO reservations;
  final Function onPaymentDone;

  const PayButton({
    Key? key,
    required this.reservations,
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
    isPaymentComplete = Payload().price == null;
  }

  void handlePayment(BuildContext context) async {
    int amount = widget.reservations.amountToPay < 1000
        ? 1000
        : widget.reservations.amountToPay; // 결제 금액
    print('reservations 확인: ${widget.reservations}');
    print("amount 확인: ${widget.reservations.amountToPay}");
    PaySaveReqDTO payInfo = PaySaveReqDTO(
      payId: payId ?? 0, // null일 경우 기본값 설정
      reservationId: widget.reservations.reservationId,
      amount: amount,
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
      onIssued: (String data) {
        print('------- onIssued: $data');
      },
      onConfirm: (String data) {
        print('------- onConfirm: $data');
        return true;
      },
      onDone: (String data) async {
        print('------- onDone: $data');
        // 결제 완료 후 payId를 서버로부터 받아옴
        payId = await fetchPaySave(payInfo);
        if (payId != null) {
          setState(() {
            isPaymentComplete = true;
          });
          widget.onPaymentDone();
          // '내 예약 페이지'로 이동
          Navigator.pushReplacementNamed(context, '/myReservations');
        }
      },
    );
  }

  Future<int?> fetchPaySave(PaySaveReqDTO reqDTO) async {
    try {
      print('결제 정보 전송 시작');
      print('전송할 데이터: ${reqDTO.toJson()}');

      final ResponseDTO responseDTO = await ref.read(reservationListProvider.notifier).paySave(reqDTO);

      print('결제 정보 전송 완료');
      print('서버 응답: ${responseDTO}');

      // 서버 응답에서 payId를 추출
      if (responseDTO.status == 200) {
        return responseDTO.body['payId']; // payId를 반환
      } else {
        print('결제 실패: ${responseDTO.errorMessage}');
        return null;
      }
    } catch (e) {
      print('결제 정보 전송 중 오류 발생: $e');
      return null;
    }
  }

  Payload getPayload(PaySaveReqDTO payInfo) {
    Payload payload = Payload();
    Item item = Item();
    item.name = widget.reservations.reservationName ?? 'Unknown';
    item.qty = 1;
    item.id = widget.reservations.roomId.toString();
    item.price = payInfo.amount.toDouble();

    payload.webApplicationId = 'your-web-5b8f6a4d396fa665fdc2b5e7-id';
    payload.androidApplicationId = '5b8f6a4d396fa665fdc2b5e8';
    payload.iosApplicationId = '5b8f6a4d396fa665fdc2b5e9';

    payload.pg = '나이스페이';
    payload.orderName = widget.reservations.reservationName ?? 'Unknown';
    payload.price = payInfo.amount.toDouble();
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
        backgroundColor: isPaymentComplete ? Colors.grey : Colors.redAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Text(
        isPaymentComplete ? '결제 완료' : '결제하기',
        style: TextStyle(fontSize: 16.0, color: Colors.white),
      ),
    );
  }
}
