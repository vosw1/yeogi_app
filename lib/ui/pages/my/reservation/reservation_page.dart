import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:yogi_project/_core/constants/size.dart';
import 'package:yogi_project/_core/constants/style.dart';
import 'package:yogi_project/data/dtos/reservation_request.dart';
import 'package:yogi_project/data/models/room.dart';
import 'package:yogi_project/ui/pages/my/pay/pay_page.dart';
import 'package:yogi_project/ui/pages/my/reservation/widgets/argreement_section.dart';
import 'package:yogi_project/ui/pages/my/reservation/widgets/reservaion_info_form.dart';
import 'package:yogi_project/ui/pages/my/reservation/widgets/reservation_list_model.dart';
import 'package:yogi_project/ui/pages/my/reservation/widgets/room_info.dart';
import 'package:yogi_project/ui/pages/my/reservation/widgets/room_notice.dart';

class ReservationPage extends ConsumerStatefulWidget {
  final Room rooms;
  final int numberOfNights;
  late final DateTime selectedStartDate;
  late final DateTime selectedEndDate;

  ReservationPage({
    required this.rooms,
    required this.numberOfNights,
    required this.selectedStartDate,
    required this.selectedEndDate,
  });

  @override
  _ReservationPageState createState() => _ReservationPageState();
}

class _ReservationPageState extends ConsumerState<ReservationPage> {
  late TextEditingController _nameController;
  late TextEditingController _phoneNumberController;
  List<DateTime> reservedDates = [];

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _phoneNumberController = TextEditingController();
    _fetchReservedDates();
  }

  void _fetchReservedDates() async {
    final dates = await ref.read(reservationListProvider.notifier).fetchReservedDates(widget.rooms.roomId);
    setState(() {
      reservedDates = dates;
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.numberOfNights);
    print(widget.rooms.price * widget.numberOfNights);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '예약하기',
          style: h4(),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: gap_m, right: gap_m, bottom: gap_m),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              RoomInfo(
                rooms: widget.rooms,
                numberOfNights: widget.numberOfNights,
                selectedStartDate: widget.selectedStartDate,
                selectedEndDate: widget.selectedEndDate,
              ),
              SizedBox(height: gap_m),
              RoomNotice(),
              Divider(),
              SizedBox(height: gap_s),
              TableCalendar(
                focusedDay: widget.selectedStartDate,
                firstDay: DateTime.utc(2000, 1, 1),
                lastDay: DateTime.utc(2100, 12, 31),
                selectedDayPredicate: (day) {
                  return isSameDay(widget.selectedStartDate, day);
                },
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    widget.selectedStartDate = selectedDay;
                    widget.selectedEndDate = selectedDay.add(Duration(days: widget.numberOfNights - 1));
                  });
                },
                calendarBuilders: CalendarBuilders(
                  defaultBuilder: (context, day, focusedDay) {
                    if (reservedDates.contains(day)) {
                      return Center(
                        child: Text(
                          '${day.day}',
                          style: TextStyle(color: Colors.red),
                        ),
                      );
                    }
                    return null;
                  },
                  selectedBuilder: (context, date, events) => Container(
                    margin: const EdgeInsets.all(4.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Text(
                      '${date.day}',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(height: gap_s),
              ReservationInfoForm(
                nameController: _nameController,
                phoneNumberController: _phoneNumberController,
              ),
              SizedBox(height: gap_xs),
              Divider(),
              SizedBox(height: gap_s),
              AgreementSection(
                onAllChecked: (bool value) {
                  // 이 부분은 예제에 따라 상태 관리 로직이 필요합니다.
                },
                subCheckboxValues: [false, false, false, false],
                subtitles: [
                  '이용규칙 및 취소/환불 규정 동의(필수)',
                  '개인정보 수집 및 이용 동의(필수)',
                  '개인정보 제3자 제공 동의(필수)',
                  '만 14세 이상 확인(필수)',
                ],
              ),
              SizedBox(height: gap_l),
              Container(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: () => _attemptReservation(context, _nameController, _phoneNumberController, widget.rooms),
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
                      '${NumberFormat('#,###').format(widget.rooms.roomPrice * widget.numberOfNights)} 원 결제하기',
                      style: h5(mColor: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _attemptReservation(
      BuildContext context,
      TextEditingController nameController,
      TextEditingController phoneController,
      Room room) {
    try {
      DateTime checkInDate = widget.selectedStartDate;
      DateTime checkOutDate = widget.selectedEndDate;

      if (checkInDate == checkOutDate) {
        checkOutDate = checkOutDate.add(const Duration(days: 1));
      } else {
        checkInDate = checkInDate.add(const Duration(days: 1));
        checkOutDate = checkOutDate.add(const Duration(days: 1));
      }

      ReservationSaveReqDTO dto = ReservationSaveReqDTO(
        roomId: room.roomId,
        roomName: room.roomName ?? 'defaultRoomName',
        roomImgTitle: room.roomImgTitle ?? 'defaultImgTitle',
        price: (room.price ?? 0).toInt(),
        checkInDate: checkInDate,
        checkOutDate: checkOutDate,
        reservationName: nameController.text.isNotEmpty ? nameController.text : 'Default Name',
        reservationTel: phoneController.text.isNotEmpty ? phoneController.text : 'Default Tel',
        stayAdress: '',
      );

      ref.read(reservationListProvider.notifier).reservationSave(dto);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PayPage(),
        ),
      );
    } catch (e) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Notice'),
            content: Text('날짜 형식이 올바르지 않습니다.'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text('확인'),
              ),
            ],
          );
        },
      );
    }
  }
}
