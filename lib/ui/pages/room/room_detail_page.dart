import 'package:flutter/material.dart';
import 'package:yogi_project/_core/constants/size.dart';
import 'package:yogi_project/_core/constants/style.dart';
import 'package:yogi_project/data/models/room.dart';
import 'package:yogi_project/ui/pages/my/book/reservation_detail_page.dart';
import 'package:yogi_project/ui/pages/my/book/reservation_page.dart';

class RoomDetailPage extends StatefulWidget {
  final Room rooms;

  const RoomDetailPage({required this.rooms});

  @override
  _RoomDetailPageState createState() => _RoomDetailPageState();
}

class _RoomDetailPageState extends State<RoomDetailPage> {
  late DateTime _selectedStartDate;
  late DateTime _selectedEndDate;
  int _numberOfNights = 1;

  @override
  void initState() {
    super.initState();
    _selectedStartDate = DateTime.now();
    _selectedEndDate = DateTime.now().add(Duration(days: 1));
    _numberOfNights = _selectedEndDate.difference(_selectedStartDate).inDays;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.rooms.roomName}'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(gap_m),
                  child: Container(
                    padding: EdgeInsets.all(gap_m),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(gap_s),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(gap_s),
                          child: Image.asset(
                            'assets/images/${widget.rooms.roomImgTitle}',
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
                                Text('이용날짜', style: TextStyle(fontSize: gap_m)),
                                SizedBox(height: gap_xs),
                                GestureDetector(
                                  onTap: _selectDateRange,
                                  child: Container(
                                    padding: EdgeInsets.all(gap_s),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(gap_s),
                                      border: Border.all(color: Colors.black, width: 2.0),
                                    ),
                                    child: Row(
                                      children: [
                                        SizedBox(width: gap_xx),
                                        Icon(Icons.calendar_today),
                                        SizedBox(width: gap_s),
                                        Text(
                                          '${formatDate(_selectedStartDate)}  ~  ${formatDate(_selectedEndDate)}',
                                          style: h6(),
                                        ),
                                        SizedBox(width: gap_xs),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: gap_m),
                        Text(
                            '숙박기간 : ${_numberOfNights} 박 ${_numberOfNights + 1} 일',
                            style: TextStyle(fontSize: gap_m)),
                        SizedBox(height: gap_s),
                        Divider(),
                        SizedBox(height: gap_s),
                        Text('기본정보\n\n${widget.rooms.roomInfo}'),
                        SizedBox(height: gap_s),
                        Divider(),
                        SizedBox(height: gap_s),
                        Text('편의시설\n\n${widget.rooms.amenities}'),
                        SizedBox(height: gap_s),
                        Divider(),
                        SizedBox(height: gap_s),
                        Text('공지\n\n${widget.rooms.notice}'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(gap_m),
            child: Center(
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,

                      MaterialPageRoute(builder: (context) => ReservationPage(rooms: widget.rooms)),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.redAccent,
                  ),
                  child: Text(
                    '예약하기',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _selectDateRange() async {
    final DateTimeRange? pickedDateRange = await showDateRangePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
      initialDateRange: DateTimeRange(start: _selectedStartDate, end: _selectedEndDate),
    );

    if (pickedDateRange != null) {
      setState(() {
        _selectedStartDate = pickedDateRange.start;
        _selectedEndDate = pickedDateRange.end;
        // Recalculate number of nights
        _numberOfNights = _selectedEndDate.difference(_selectedStartDate).inDays;
      });
    }
  }
}
