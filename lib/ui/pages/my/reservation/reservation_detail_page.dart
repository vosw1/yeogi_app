import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:yogi_project/_core/constants/size.dart';
import 'package:yogi_project/_core/constants/style.dart';
import 'package:yogi_project/data/models/reservation.dart';
import 'package:yogi_project/ui/pages/my/reservation/widgets/reservation_list_model.dart';

class ReservationDetailPage extends ConsumerStatefulWidget {
  final Reservation reservations;

  const ReservationDetailPage({
    Key? key,
    required this.reservations,
  }) : super(key: key);

  @override
  _ReservationDetailPageState createState() => _ReservationDetailPageState();
}

class _ReservationDetailPageState extends ConsumerState<ReservationDetailPage> {
  late DateTime _checkInDate;
  late DateTime _checkOutDate;
  int _numberOfNights = 1;
  bool isCanceled = false;

  @override
  void initState() {
    super.initState();
    _checkInDate = widget.reservations.checkInDate.toUtc();
    _checkOutDate = widget.reservations.checkOutDate.toUtc();
    _numberOfNights = _checkOutDate.difference(_checkInDate).inDays;
    isCanceled = widget.reservations.state == 'REFUND';
  }

  @override
  Widget build(BuildContext context) {
    bool showCancelButton =
        DateTime.now().isBefore(_checkInDate) && !isCanceled;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${widget.reservations.stayName}',
          style: h4(),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: gap_m),
        child: ListView(
          children: [
            Container(
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
                      'assets/images/${widget.reservations.roomImgTitle}',
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: gap_m),
                  Text(
                    '${widget.reservations.roomName}',
                    style: h4(),
                  ),
                  Text(
                    '${widget.reservations.stayAddress}',
                    style: TextStyle(
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.bold,
                      fontSize: 19,
                    ),
                  ),
                  SizedBox(height: gap_m),
                  Text(
                      '숙박기간 : ${_numberOfNights + 1} 박 ${_numberOfNights + 2} 일',
                      style: h4()),
                  SizedBox(height: gap_m),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('체크인', style: h5()),
                          SizedBox(height: gap_xs),
                          GestureDetector(
                            onTap: () => _selectDate(context, isCheckIn: true),
                            child: Container(
                              padding: EdgeInsets.all(gap_s),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(gap_s),
                                border: Border.all(color: Colors.grey.shade300),
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    '${formatDate(_checkInDate)}',
                                    style: TextStyle(
                                      fontFamily: 'Pretendard',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                  SizedBox(width: gap_xs),
                                  Icon(Icons.calendar_today),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('체크아웃', style: h5()),
                          SizedBox(height: gap_xs),
                          GestureDetector(
                            onTap: () => _selectDate(context, isCheckIn: false),
                            child: Container(
                              padding: EdgeInsets.all(gap_s),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(gap_s),
                                border: Border.all(color: Colors.grey.shade300),
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    '${formatDate(_checkOutDate)}',
                                    style: TextStyle(
                                      fontFamily: 'Pretendard',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                  SizedBox(width: gap_xs),
                                  Icon(Icons.calendar_today),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: gap_m),
                  Divider(),
                  SizedBox(height: gap_m),
                  Text('예약 정보', style: h4()),
                  SizedBox(height: gap_m),
                  Text(
                    '예약자 : ${widget.reservations.reservationName}',
                    style: TextStyle(
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.bold,
                      fontSize: 19,
                    ),
                  ),
                  SizedBox(height: gap_xs),
                  Text(
                    '전화번호 : ${formatPhoneNumber(widget.reservations.reservationTel)}',
                    style: TextStyle(
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.bold,
                        fontSize: 19,
                    ),
                  ),
                  SizedBox(height: gap_xs),
                  Text(
                    '결제금액 : ${NumberFormat('#,###').format(widget.reservations.amount)} 원',
                    style: TextStyle(
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.bold,
                      fontSize: 19,
                    ),
                  ),
                  SizedBox(height: gap_xs),
                  Text(
                    '결제일자 : ${formatDate(widget.reservations.createdAt)}',
                    style: TextStyle(
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.bold,
                      fontSize: 19,
                    ),
                  ),
                  SizedBox(height: gap_xs),
                  Text(
                    '결제수단 : ${widget.reservations.way}',
                    style: TextStyle(
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.bold,
                      fontSize: 19,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: gap_l),
            Center(
              child: isCanceled
                  ? Text(
                      '취소된 예약입니다',
                      style: h4(mColor: Colors.redAccent),
                    )
                  : showCancelButton
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                _showCancelConfirmationDialog(context, ref);
                              },
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: Colors.redAccent,
                                side: BorderSide.none,
                              ),
                              child: Text('예약 취소'),
                            ),
                            SizedBox(width: gap_m),
                            ElevatedButton(
                              onPressed: () {
                                _showReviewWritingDialog(context);
                              },
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: Colors.redAccent,
                                side: BorderSide.none,
                              ),
                              child: Text('리뷰 작성'),
                            ),
                          ],
                        )
                      : ElevatedButton(
                          onPressed: () {
                            _showReviewWritingDialog(context);
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.redAccent,
                            side: BorderSide.none,
                          ),
                          child: Text('리뷰 작성'),
                        ),
            ),
            SizedBox(height: gap_m),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context,
      {required bool isCheckIn}) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: isCheckIn ? _checkInDate : _checkOutDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null) {
      setState(() {
        if (isCheckIn) {
          _checkInDate = pickedDate;
        } else {
          _checkOutDate = pickedDate;
        }
        _numberOfNights = _checkOutDate.difference(_checkInDate).inDays;
      });
    }
  }

  void _showCancelConfirmationDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('예약 취소'),
          content: Text('이 예약을 취소하시겠습니까?'),
          actionsAlignment: MainAxisAlignment.center,
          actions: <Widget>[
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop();
                await ref
                    .read(reservationListProvider.notifier)
                    .payUpdate(widget.reservations.payId);
                setState(() {
                  isCanceled = true;
                });
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

  void _showReviewWritingDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('리뷰 작성'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(labelText: '리뷰 내용'),
                maxLines: 3,
              ),
              SizedBox(height: gap_m),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('작성 완료'),
              ),
            ],
          ),
        );
      },
    );
  }
}

String formatDate(DateTime dateTime) {
  return '${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}';
}

String formatPhoneNumber(String phoneNumber) {
  String cleaned = phoneNumber.replaceAll(RegExp(r'\D'), '');
  return cleaned.replaceFirstMapped(RegExp(r'^(\d{3})(\d{4})(\d{4})$'),
      (match) {
    return '${match[1]}-${match[2]}-${match[3]}';
  });
}
