import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:yogi_project/_core/constants/move.dart';
import 'package:yogi_project/_core/constants/size.dart';
import 'package:yogi_project/data/models/reservation.dart';
import 'package:yogi_project/data/models/pay.dart';
import 'package:yogi_project/data/models/room.dart';
import 'package:yogi_project/data/repositories/pay_repository.dart';
import 'package:yogi_project/ui/pages/my/reservation/widgets/reservation_list_model.dart';
import 'package:yogi_project/ui/pages/my/reservation/widgets/review_writing_dialog.dart';

final payRepositoryProvider = Provider<PayRepository>((ref) {
  final dio = ref.read(dioProvider);
  final logger = ref.read(loggerProvider);
  return PayRepository(dio, logger);
});

final dioProvider = Provider<Dio>((ref) => Dio());
final loggerProvider = Provider<Logger>((ref) => Logger());

class ReservationDetailPage extends StatefulWidget {
  final Reservation reservations;
  final Room rooms;
  final Pay pays;
  final bool isCanceled = false;

  const ReservationDetailPage({
    Key? key,
    required this.reservations,
    required this.rooms,
    required this.pays,
  }) : super(key: key);

  @override
  _ReservationDetailPageState createState() => _ReservationDetailPageState();
}

class _ReservationDetailPageState extends State<ReservationDetailPage> {
  late DateTime _checkInDate;
  late DateTime _checkOutDate;
  int _numberOfNights = 1;
  bool isCanceled = false;

  @override
  void initState() {
    super.initState();
    _checkInDate = DateTime.now();
    _checkOutDate = DateTime.now().add(Duration(days: 5));
    _numberOfNights = _checkOutDate.difference(_checkInDate).inDays;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // 삼항 연산자를 사용하여 조건에 따라 다른 텍스트를 표시
        title: Text(isCanceled ? '취소된 예약' : '예약내역'),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final payRepository = ref.watch(payRepositoryProvider);
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: gap_m),
            child: ListView(
              children: [
                reservationDetailWidget(),
                actionButtons(context, ref),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget reservationDetailWidget() {
    return Container(
      padding: EdgeInsets.all(gap_m),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(gap_s),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(gap_s),
            child: Image.asset(
              'assets/images/room.jpg', // Placeholder image path
              width: double.infinity,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: gap_s),
          Text('Room Name', style: TextStyle(fontSize: gap_m)),
          Text('Address'),
          SizedBox(height: gap_s),
          Text('숙박기간 : ${_numberOfNights + 1} 박 ${_numberOfNights + 2} 일',
              style: TextStyle(fontSize: gap_m)),
          _buildReservationInfo(),
        ],
      ),
    );
  }

  Widget _buildReservationInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('예약자: ${reservations.reservationName}'),
        Text('전화번호: ${reservations.reservationTel}'),
        Text('결제금액: ${NumberFormat('#,###').format(pays.amount)} 원'),
        Text('결제일자: ${formatDate(widget.pays.createdAt)}'),
        Text('결제수단: Credit Card'),
        Text('결제상황: 결제 완료'),
      ],
    );
  }

  Widget actionButtons(BuildContext context, WidgetRef ref) {
    final payRepository = ref.read(payRepositoryProvider);

    return Center(
      child: Column(
        children: [
          if (!isCanceled)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: gap_m),
                ElevatedButton(
                  onPressed: () => _showCancelConfirmationDialog(context, ref),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.redAccent,
                    side: BorderSide.none,
                  ),
                  child: Text('예약 취소'),
                ),
                SizedBox(width: gap_m),
                SizedBox(height: gap_m),
                ElevatedButton(
                  onPressed: () => _showReviewWritingDialog(context),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.redAccent,
                    side: BorderSide.none,
                  ),
                  child: Text('리뷰 작성'),
                ),
              ],
            )
        ],
      ),
    );
  }

  void _showCancelConfirmationDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('예약 취소'),
          content: Text('이 예약을 취소하시겠습니까?'),
          actions: <Widget>[
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop();
                try {
                  await ref
                      .read(reservationListProvider.notifier)
                      .payUpdate(widget.pays.payId);
                  setState(() {
                    isCanceled = true; // 상태를 업데이트합니다.
                  });
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Reservation canceled and refunded successfully.'),
                    backgroundColor: Colors.green,
                  ));
                  Navigator.of(context).pop(); // 현재 페이지를 종료하고 이전 페이지로 돌아갑니다.
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Failed to cancel reservation: ${e.toString()}'),
                    backgroundColor: Colors.red,
                  ));
                }
              },
              child: Text('예'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('아니요'),
            ),
          ],
        );
      },
    );
  }
}

void _showReviewWritingDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return ReviewWritingDialog();
    },
  );
}

String formatDate(DateTime dateTime) {
  return DateFormat('yyyy-MM-dd').format(dateTime);
}
