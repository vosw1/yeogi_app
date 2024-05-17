import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yogi_project/_core/constants/size.dart';
import 'package:yogi_project/_core/constants/style.dart';
import 'package:yogi_project/data/models/room.dart';
import 'package:yogi_project/data/store/session_store.dart';
import 'package:yogi_project/ui/pages/my/reservation/reservation_page.dart';
import 'package:yogi_project/ui/pages/room/room_detail_view_model.dart';

class RoomDetailPage extends ConsumerStatefulWidget {
  final Room rooms;

  const RoomDetailPage({required this.rooms, Key? key}) : super(key: key);

  @override
  _RoomDetailPageState createState() => _RoomDetailPageState();
}

class _RoomDetailPageState extends ConsumerState<RoomDetailPage> {
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
    RoomDetailModel? model = ref.watch(roomDetailProvider(widget.rooms.roomId));

    if (model == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            '${model.roomOption.tier}',
            style: h4(),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: gap_m, right: gap_m, bottom: gap_m),
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
                              'assets/images/${model.roomOption.imageName}',
                              width: double.infinity,
                              height: 200,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(height: gap_m),
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
                                  Icon(Icons.calendar_today),
                                  SizedBox(width: gap_s),
                                  Text(
                                    ' ${formatDate(_selectedStartDate)}  ~  ${formatDate(_selectedEndDate)} ',
                                    style: h6(),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: gap_m),
                          Text(
                            '숙박기간 : ${_numberOfNights} 박 ${_numberOfNights + 1} 일',
                            style: h5(),
                          ),
                          SizedBox(height: gap_s),
                          Divider(),
                          SizedBox(height: gap_s),
                          Text(
                            '기본정보',
                            style: h5(),
                          ),
                          SizedBox(height: gap_s),
                          Text(
                            '${model.roomOption.information.basicInformation}',
                            style: TextStyle(
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(height: gap_s),
                          Divider(),
                          SizedBox(height: gap_s),
                          Text(
                            '편의시설',
                            style: h5(),
                          ),
                          SizedBox(height: gap_s),
                          Row(
                            children: List<Widget>.generate(
                              model.roomOption.options.length * 2 - 1,
                                  (index) {
                                // 옵션 이름과 콤마를 번갈아가며 배치합니다.
                                if (index.isEven) {
                                  // 옵션 이름을 표시하는 경우
                                  final optionIndex = index ~/ 2;
                                  final option = model.roomOption.options[optionIndex];
                                  return Text(
                                    option.name,
                                    style: TextStyle(
                                      fontFamily: 'Pretendard',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  );
                                } else {
                                  // 콤마를 표시하는 경우
                                  return Text(', ');
                                }
                              },
                            ),
                          ),
                          SizedBox(height: gap_s),
                          Divider(),
                          SizedBox(height: gap_s),
                          Text(
                            '공지',
                            style: h5(),
                          ),
                          SizedBox(height: gap_s),
                          Text(
                            '${model.roomOption.information.announcement}',
                            style: TextStyle(
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
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
                    onPressed: () => _attemptReservation(ref),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.redAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(gap_s),
                      child: Text(
                        '예약하기',
                        style: h5(mColor: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: gap_m),
          ],
        ),
      );
    }
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
        _numberOfNights = _selectedEndDate.difference(_selectedStartDate).inDays;
      });
    }
  }

  String formatDate(DateTime dateTime) {
    return '${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}';
  }

  void _showLoginRequiredDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('로그인 필요'),
          content: Text('로그인을 먼저 해주세요.'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Center(child: Text('확인')),
            ),
          ],
        );
      },
    );
  }

  void _attemptReservation(WidgetRef ref) async {
    final sessionStore = ref.read(sessionProvider);

    if (sessionStore.isLogin) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ReservationPage(
            rooms: widget.rooms,
            numberOfNights: _numberOfNights,
            selectedStartDate: _selectedStartDate,
            selectedEndDate: _selectedEndDate,
          ),
        ),
      );
    } else {
      _showLoginRequiredDialog(context);
    }
  }
}
