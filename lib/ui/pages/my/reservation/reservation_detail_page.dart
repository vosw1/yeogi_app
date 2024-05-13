import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:yogi_project/_core/constants/size.dart';
import 'package:yogi_project/_core/constants/style.dart';
import 'package:yogi_project/data/models/pay.dart';
import 'package:yogi_project/data/models/reservation.dart';

class ReservationDetailPage extends StatefulWidget {
  final Reservation reservations;
  final bool isCanceled = false;

  const ReservationDetailPage({
    Key? key,
    required this.reservations,
  }) : super(key: key);

  @override
  _ReservationDetailPageState createState() => _ReservationDetailPageState();
}

class _ReservationDetailPageState extends State<ReservationDetailPage> {
  late DateTime _checkInDate;
  late DateTime _checkOutDate;
  int _numberOfNights = 1;

  @override
  void initState() {
    super.initState();
    _checkInDate = widget.reservations.checkInDate;
    _checkOutDate = widget.reservations.checkOutDate;
    _numberOfNights = _checkOutDate.difference(_checkInDate).inDays;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.isCanceled ? '${widget.reservations.stayName} (취소완료)' : '${widget.reservations.stayName} (예약완료)'),
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
                  Text('${widget.reservations.roomName}',
                      style: TextStyle(fontSize: gap_m)),
                  Text(widget.reservations.stayAddress),
                  SizedBox(height: gap_s),
                  Text(
                      '숙박기간 : ${_numberOfNights + 1} 박 ${_numberOfNights + 2} 일',
                      style: TextStyle(fontSize: gap_m)),
                  SizedBox(height: gap_s),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('체크인', style: TextStyle(fontSize: gap_m)),
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
                                  Text(formatDate(_checkInDate)),
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
                          Text('체크아웃', style: TextStyle(fontSize: gap_m)),
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
                                  Text(formatDate(_checkOutDate)),
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
                  Text('예약 정보', style: TextStyle(fontSize: gap_m)),
                  SizedBox(height: gap_m),
                  Text('예약자 : ${widget.reservations.reservationName}'),
                  SizedBox(height: gap_xs),
                  Text('전화번호 : ${formatPhoneNumber(widget.reservations.reservationTel)}'),
                  SizedBox(height: 8),
                  Text(
                      '결제금액 : ${NumberFormat('#,###').format(widget.reservations.amount)} 원',
                      style: subtitle1()),
                  SizedBox(height: gap_xs),
                  Text('결제일자 : ${formatDate(widget.reservations.createdAt)}',
                      style: subtitle1()),
                  SizedBox(height: gap_xs),
                  Text('결제수단 : ${widget.reservations.way}', style: subtitle1()),
                  // 결제수단 수정
                ],
              ),
            ),
            SizedBox(height: gap_m),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _showCancelConfirmationDialog(context);
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.redAccent,
                      side: BorderSide.none, // 테두리 없음
                    ),
                    child: Text('예약 취소'),
                  ),
                  SizedBox(width: gap_m),
                  ElevatedButton(
                    onPressed: () {
                      // Show review writing dialog
                      _showReviewWritingDialog(context);
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.redAccent,
                      side: BorderSide.none, // 테두리 없음
                    ),
                    child: Text('리뷰 작성'),
                  ),
                ],
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

  void _showCancelConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('예약 취소'),
          content: Text('이 예약을 취소하시겠습니까?'),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    // todo : 추후 서버랑 통신해서 해결하기
                    // Navigator.of(context).push(
                    //   MaterialPageRoute(
                    //     builder: (context) => 이동할 페이지,
                    //   ),
                    // );
                  },
                  child: Text('예'),
                ),
                SizedBox(width: gap_s),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('아니요'),
                ),
              ],
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
                  // Add logic to handle submitting the review
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
  // 전화번호에서 숫자만 추출
  String cleaned = phoneNumber.replaceAll(RegExp(r'\D'), '');

  // 'XXX-XXXX-XXXX' 형식으로 포맷 변경
  return cleaned.replaceFirstMapped(RegExp(r'^(\d{3})(\d{4})(\d{4})$'), (match) {
    return '${match[1]}-${match[2]}-${match[3]}';
  });
}

void main() {
  String phoneNumber = '01012344321';
  String formattedPhoneNumber = formatPhoneNumber(phoneNumber);
  print(formattedPhoneNumber); // 출력: 010-1234-4321
}
