import 'package:flutter/material.dart';
import 'package:yogi_project/_core/constants/size.dart';
import 'package:yogi_project/data/dtos/book_request.dart';
import 'package:yogi_project/data/models/room.dart';
import 'package:yogi_project/data/models/stay.dart';
import 'package:yogi_project/ui/pages/book/book_detail_page.dart';

class RoomDetailPage extends StatefulWidget {
  final Room roomData;
  final Stay stayData;

  const RoomDetailPage({required this.roomData, required this.stayData});

  @override
  _RoomDetailPageState createState() => _RoomDetailPageState();
}

class _RoomDetailPageState extends State<RoomDetailPage> {
  late DateTime _checkInDate;
  late DateTime _checkOutDate;
  int _numberOfNights = 1;
  int _totalPrice = 0; // 초기 가격

  @override
  void initState() {
    super.initState();
    _checkInDate = DateTime.now(); // 현재 날짜로 초기화
    _checkOutDate = DateTime.now().add(Duration(days: 1)); // 다음 날짜로 초기화
    _numberOfNights = _checkOutDate.difference(_checkInDate).inDays;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.roomData.roomName}'),
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
                      'assets/images/${widget.roomData.roomImgTitle}',
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: gap_m),
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
                          SizedBox(height: gap_m),
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
                  Text('숙박기간 : ${_numberOfNights} 박 ${_numberOfNights + 1} 일',
                      style: TextStyle(fontSize: gap_m)),
                  SizedBox(height: gap_s),
                  Divider(),
                  SizedBox(height: gap_m),
                  Text('총 가격 : $_totalPrice 원', style: TextStyle(fontSize: gap_m)),
                  SizedBox(height: gap_s),
                  ElevatedButton(
                    onPressed: () {
                      // 예약 정보를 생성하여 BookDetailPage로 이동
                      Book bookData = Book(
                        stayName: widget.stayData.stayName,
                        roomImgTitle: widget.roomData.roomImgTitle,
                        roomName: widget.roomData.roomName,
                        location: widget.stayData.location,
                        checkInDate: _checkInDate,
                        checkOutDate: _checkOutDate,
                        price: _totalPrice,
                        bookName: '예약자 이름', // 예약자 이름을 여기에 추가
                        bookTel: '예약자 전화번호', // 예약자 전화번호를 여기에 추가
                        way: '결제 방법', // 결제 방법을 여기에 추가
                        payAt: DateTime.now(), // 현재 시간을 사용하거나 다른 결제 일자를 설정할 수 있습니다.
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => BookDetailPage(book: bookData)),
                      );
                    },
                    child: Text('예약하기'),
                  ),
                  SizedBox(height: gap_xs),
                  Divider(),
                  SizedBox(height: gap_s),
                  Text('기본정보\n\n${widget.roomData.roomInfo}'),
                  SizedBox(height: gap_s),
                  Divider(),
                  SizedBox(height: gap_s),
                  Text('편의시설\n\n${widget.roomData.amenities}'),
                  SizedBox(height: gap_s),
                  Divider(),
                  SizedBox(height: gap_s),
                  Text('공지\n\n${widget.roomData.notice}'),
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
}
