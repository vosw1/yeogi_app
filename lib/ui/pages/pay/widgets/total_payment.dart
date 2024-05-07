import 'package:flutter/material.dart';
import 'package:bootpay/bootpay.dart';
import 'package:bootpay/model/extra.dart';
import 'package:bootpay/model/item.dart';
import 'package:bootpay/model/payload.dart';
import 'package:bootpay/model/user.dart';
import 'package:flutter/foundation.dart';
import 'package:yogi_project/_core/constants/size.dart';

class TotalPayment extends StatefulWidget {
  @override
  _TotalPaymentState createState() => _TotalPaymentState();
}

class _TotalPaymentState extends State<TotalPayment> {
  String webApplicationId = '5b8f6a4d396fa665fdc2b5e7';
  String androidApplicationId = '5b8f6a4d396fa665fdc2b5e8';
  String iosApplicationId = '5b8f6a4d396fa665fdc2b5e9';

  @override
  void initState() {
    super.initState();
    bootpayTest(context);
  }

  @override
  Widget build(context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Remove the button to navigate to the payment page
              SizedBox(height: gap_m),
            ],
          ),
        ),
      ),
    );
  }

  void bootpayTest(BuildContext context) {
    Payload payload = getPayload();
    if(kIsWeb) {
      payload.extra?.openType = "iframe";
    }

    Bootpay().requestPayment(
      context: context,
      payload: payload,
      showCloseButton: false,
      onCancel: (String data) {
        print('------- onCancel: $data');
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
      },
    );
  }

  Payload getPayload() {
    Payload payload = Payload();
    Item item1 = Item();
    item1.name = "미키 '마우스";
    item1.qty = 1;
    item1.id = "ITEM_CODE_MOUSE";
    item1.price = 50000;

    Item item2 = Item();
    item2.name = "키보드";
    item2.qty = 1;
    item2.id = "ITEM_CODE_KEYBOARD";
    item2.price = 50000;
    List<Item> itemList = [item1, item2];

    payload.webApplicationId = webApplicationId;
    payload.androidApplicationId = androidApplicationId;
    payload.iosApplicationId = iosApplicationId;

    payload.pg = '나이스페이';
    payload.orderName = "리조트상품";
    payload.price = 100000.0;

    payload.orderId = DateTime.now().millisecondsSinceEpoch.toString();

    payload.metadata = {
      "callbackParam1" : "value12",
      "callbackParam2" : "value34",
      "callbackParam3" : "value56",
      "callbackParam4" : "value78",
    };
    payload.items = itemList;

    User user = User();
    user.username = "사용자 이름";
    user.email = "user1234@gmail.com";
    user.phone = "010-4033-4678";

    Extra extra = Extra();
    extra.appScheme = 'bootpayFlutterExample';
    extra.cardQuota = '3';

    payload.user = user;
    payload.extra = extra;
    return payload;
  }
}
