import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:yogi_project/_core/constants/style.dart';
import 'package:yogi_project/ui/pages/book/widgets/domestic_book_list.dart';
import '../../../_core/constants/size.dart';
import '../../../data/dtos/book_request.dart';
import 'book_list_page.dart';
import 'book_page.dart';

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
        title: Text('예약 상세보기'),
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
                  Text('숙소정보', style: TextStyle(fontSize: gap_m)),
                  SizedBox(height: gap_m),
                  Text('${widget.book.stayName}', style: TextStyle(fontSize: gap_m)),
                  SizedBox(height: gap_xs),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(gap_s),
                    child: Image.asset(
                      'assets/images/${widget.book.roomImgTitle}',
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: gap_m),
                  Text('${widget.book.roomName}',
                      style: TextStyle(fontSize: gap_m)),
                  Text('${widget.book.location}'),
                  SizedBox(height: gap_m),
                  Text('숙박기간 : ${_numberOfNights} 박 ${_numberOfNights + 1} 일', style: TextStyle(fontSize: gap_m)),
                  SizedBox(height: gap_m),
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
                  Text('예약자 : ${widget.book.bookName}', style: subtitle1()),
                  SizedBox(height: gap_xs),
                  Text('전화번호 : ${widget.book.bookTel}', style: subtitle1()),
                  SizedBox(height: gap_m),
                  Text('결제금액 : ${NumberFormat('#,###').format(widget.book.price)} 원', style: subtitle1()),
                  SizedBox(height: gap_xs),
                  Text('결제일자 : ${formatDate(widget.book.payAt)}', style: subtitle1()),
                  SizedBox(height: gap_xs),
                  Text('결제수단 : ${widget.book.way}', style: subtitle1()), // 결제수단 수정
                ],
              ),
            ),
            SizedBox(height: gap_m),
            Center(
              child: ElevatedButton(
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
}

String formatDate(DateTime dateTime) {
  return '${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}';
}
