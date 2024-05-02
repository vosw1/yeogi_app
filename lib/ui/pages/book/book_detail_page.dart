import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:yogi_project/_core/constants/size.dart';
import 'package:yogi_project/_core/constants/style.dart';
import 'package:yogi_project/data/dtos/book_request.dart';
import 'package:yogi_project/data/models/book.dart';
import 'package:yogi_project/data/models/room.dart';
import 'package:yogi_project/ui/pages/book/widgets/review_writing_dialog.dart';

class BookDetailPage extends StatefulWidget {
  final Book book;

  const BookDetailPage({Key? key, required this.book}) : super(key: key);

  @override
  _BookDetailPageState createState() => _BookDetailPageState();
}

class _BookDetailPageState extends State<BookDetailPage> {
  late DateTime _checkInDate;
  late DateTime _checkOutDate;
  int _numberOfNights = 1;

  @override
  void initState() {
    super.initState();
    _checkInDate = widget.book.checkInDate;
    _checkOutDate = widget.book.checkOutDate ?? DateTime.now();
    _numberOfNights = _checkOutDate.difference(_checkInDate).inDays;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.book.stayName}'),
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
                      'assets/images/${widget.book.roomImgTitle}',
                      width: double.infinity,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: gap_s),
                  Text('${widget.book.roomName}',
                      style: TextStyle(fontSize: gap_m)),
                  Text('${widget.book.location}'),
                  SizedBox(height: gap_s),
                  Text('숙박기간 : ${_numberOfNights} 박 ${_numberOfNights + 1} 일', style: TextStyle(fontSize: gap_m)),
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
                  SizedBox(height: gap_s),
                  Divider(),
                  SizedBox(height: gap_s),
                  Text('예약 정보', style: TextStyle(fontSize: gap_m)),
                  SizedBox(height: gap_m),
                  _buildReservationInfo(),
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
                      _showReviewWritingDialog(context); // 리뷰 작성 다이얼로그 표시
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

  Widget _buildReservationInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text('예약자 : ', style: subtitle1()),
            Text('${widget.book.bookName}', style: subtitle1()),
          ],
        ),
        SizedBox(height: gap_xs),
        Row(
          children: [
            Text('전화번호 : ', style: subtitle1()),
            Text('${widget.book.bookTel}', style: subtitle1()),
          ],
        ),
        SizedBox(height: gap_s),
        Row(
          children: [
            Text('결제금액 : ', style: subtitle1()),
            Text('${NumberFormat('#,###').format(widget.book.price)} 원'),
          ],
        ),
        SizedBox(height: gap_xs),
        Row(
          children: [
            Text('결제일자 : ', style: subtitle1()),
            Text('${formatDate(widget.book.payAt)}', style: subtitle1()),
          ],
        ),
        SizedBox(height: gap_xs),
        Row(
          children: [
            Text('결제수단 : ', style: subtitle1()),
            Text('${widget.book.way}', style: subtitle1()),
          ],
        ),
      ],
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
        return ReviewWritingDialog(); // ReviewWritingDialog를 호출하여 표시
      },
    );
  }
}

String formatDate(DateTime dateTime) {
  return '${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}';
}
