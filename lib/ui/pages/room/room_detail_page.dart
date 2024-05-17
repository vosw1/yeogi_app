import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:yogi_project/_core/constants/size.dart';
import 'package:yogi_project/_core/constants/style.dart';
import 'package:yogi_project/data/models/room.dart';
import 'package:yogi_project/data/store/session_store.dart';
import 'package:yogi_project/ui/pages/my/reservation/reservation_page.dart';
import 'package:yogi_project/ui/pages/room/room_detail_view_model.dart';
import 'package:yogi_project/ui/pages/room/widgets/room_detail_view_model.dart';
import 'package:yogi_project/ui/pages/room/widgets/reservation_calendar.dart';
import 'package:yogi_project/ui/pages/room/widgets/reservation_info.dart';

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
    _fetchReservedDates();
  }

  void _fetchReservedDates() async {
    await ref.read(reservedDatesProvider(widget.rooms.roomId).notifier).fetchReservedDates(widget.rooms.roomId);
  }

  void _onRangeSelected(DateTime start, DateTime end) {
    setState(() {
      _selectedStartDate = start;
      _selectedEndDate = end;
      _numberOfNights = end.difference(start).inDays;
    });
  }

  @override
  Widget build(BuildContext context) {
    final reservedDates = ref.watch(reservedDatesProvider(widget.rooms.roomId));
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
                  ReservationInfo(
                    numberOfNights: _numberOfNights,
                    model: model,
                    selectedStartDate: _selectedStartDate,
                    selectedEndDate: _selectedEndDate,
                    onRangeSelected: _onRangeSelected,
                    reservedDates: reservedDates,
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
      final reservedDates = ref.read(reservedDatesProvider(widget.rooms.roomId));
      bool isOverlapping = false;

      for (DateTime day = _selectedStartDate; day.isBefore(_selectedEndDate) || isSameDay(day, _selectedEndDate); day = day.add(Duration(days: 1))) {
        if (reservedDates.contains(day)) {
          isOverlapping = true;
          break;
        }
      }

      if (isOverlapping) {
        _showOverlapDialog(context);
      } else {
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
      }
    } else {
      _showLoginRequiredDialog(context);
    }
  }

  void _showOverlapDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('예약 불가'),
          content: Text('이미 예약되어있어 예약이 불가합니다.'),
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
}
