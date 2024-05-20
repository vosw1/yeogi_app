import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yogi_project/data/dtos/reservation_request.dart';
import 'package:yogi_project/data/store/session_store.dart';
import 'package:yogi_project/ui/pages/my/pay/widgets/pay_button.dart';
import 'package:yogi_project/ui/pages/my/reservation/my_reservation_page.dart';

class PayPage extends ConsumerWidget {
  final ReservationSaveReqDTO reservations;
  final int reservationId; // 예약 아이디 추가

  const PayPage({
    Key? key,
    required this.reservations,
    required this.reservationId, // 예약 아이디 추가
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sessionStore = ref.read(sessionProvider);

    void onPaymentDone() {
      Future.delayed(Duration(seconds: 2), () {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => MyReservationPage(
              users: sessionStore.user!,
              eventMyPageBanners: [],
            ),
          ),
              (Route<dynamic> route) => false,
        );
      });
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
                width: double.infinity,
                child: PayButton(
                  id: reservationId, // 예약 아이디를 결제 페이지로 전달
                  reservations: reservations,
                  onPaymentDone: onPaymentDone,
                ),
              ),
            ),
            SizedBox(height: 150),
            Container(
              color: Colors.grey.shade100,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "결제 진행 시 예상 소요 시간은 약 3~5분 입니다.",
                  style: TextStyle(fontSize: 14.0, color: Colors.grey),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
