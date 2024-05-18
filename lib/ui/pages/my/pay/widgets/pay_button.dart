import 'package:flutter/material.dart';
import 'package:bootpay/bootpay.dart';
import 'package:bootpay/model/extra.dart';
import 'package:bootpay/model/item.dart';
import 'package:bootpay/model/payload.dart';
import 'package:bootpay/model/user.dart';
import 'package:yogi_project/data/dtos/pay_request.dart';
import 'package:yogi_project/data/dtos/reservation_request.dart';

class PayButton extends StatefulWidget {
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

class _PaymentButtonState extends State<PayButton> {
  bool isPaymentComplete = false;

  void handlePayment(BuildContext context) async {
    int amount = widget.reservations.price < 100 ? 100 : widget.reservations.price;

    PaySaveReqDTO payInfo = PaySaveReqDTO(
      payId: widget.reservations.roomId,
      reservationId: widget.reservations.roomId,
      amount: amount,
      way: "Credit Card",
      state: "COMPLETE",
      payAt: DateTime.now(),
    );

    bootpayTest(context, payInfo);
  }

  void bootpayTest(BuildContext context, PaySaveReqDTO payInfo) {
    Payload payload = getPayload(payInfo);
    Bootpay().requestPayment(
      context: context,
      payload: payload,
      showCloseButton: true,
      onCancel: (String data) {
        print('------- onCancel: $data');
        Bootpay().dismiss(context);
      },
      onError: (String data) {
        print('------- onError: $data');
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
      onDone: (String data) {
        print('------- onDone: $data');
        setState(() {
          isPaymentComplete = true;
        });
        widget.onPaymentDone();
      },
    );
  }

  Payload getPayload(PaySaveReqDTO payInfo) {
    Payload payload = Payload();
    Item item = Item();
    item.name = widget.reservations.reservationName;
    item.qty = 1;
    item.id = widget.reservations.roomId.toString();
    item.price = payInfo.amount.toDouble();

    payload.webApplicationId = 'your-web-5b8f6a4d396fa665fdc2b5e7-id';
    payload.androidApplicationId = '5b8f6a4d396fa665fdc2b5e8';
    payload.iosApplicationId = '5b8f6a4d396fa665fdc2b5e9';

    payload.pg = '나이스페이';
    payload.orderName = widget.reservations.reservationName;
    payload.price = payInfo.amount.toDouble();
    payload.orderId = DateTime.now().millisecondsSinceEpoch.toString();

    payload.items = [item];

    User user = User();
    user.username = widget.reservations.reservationName;
    user.phone = widget.reservations.reservationTel;

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
        isPaymentComplete ? '결제 완료' : '결제하기',
        style: TextStyle(fontSize: 16.0, color: Colors.white),
      ),
    );
  }
}
