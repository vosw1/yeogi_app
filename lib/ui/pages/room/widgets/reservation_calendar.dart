import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yogi_project/ui/pages/my/reservation/widgets/reservation_list_model.dart';

class ReservationCalendar extends ConsumerStatefulWidget {
  final DateTime selectedStartDate;
  final DateTime selectedEndDate;
  final Function(DateTime, DateTime) onRangeSelected;
  final int roomId;
  final List<DateTime> reservedDates;

  ReservationCalendar({
    required this.selectedStartDate,
    required this.selectedEndDate,
    required this.onRangeSelected,
    required this.roomId,
    required this.reservedDates,
  });

  @override
  _ReservationCalendarState createState() => _ReservationCalendarState();
}

class _ReservationCalendarState extends ConsumerState<ReservationCalendar> {
  late final ReservationListViewModel _viewModel;
  DateTime? _tempStart;
  DateTime? _tempEnd;

  @override
  void initState() {
    super.initState();
    _viewModel = ref.read(reservationListProvider.notifier);
  }

  bool _isReserved(DateTime day) {
    return widget.reservedDates.any((reservedDate) => isSameDay(reservedDate, day));
  }

  bool _isPast(DateTime day) {
    return day.isBefore(DateTime.now().subtract(Duration(days: 1)));
  }

  bool _containsReservedDates(DateTime start, DateTime end) {
    for (DateTime date = start;
    date.isBefore(end.add(Duration(days: 1)));
    date = date.add(Duration(days: 1))) {
      if (_isReserved(date)) {
        return true;
      }
    }
    return false;
  }

  void _showReservationError(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('예약 불가'),
        content: Text('예약 불가 날짜가 포함되어 있습니다.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Center(child: Text('확인')),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TableCalendar(
        locale: 'ko_KR',
        focusedDay: _tempStart ?? DateTime.now(),
        firstDay: DateTime.utc(2000, 1, 1),
        lastDay: DateTime.utc(2100, 12, 31),
        rangeSelectionMode: RangeSelectionMode.toggledOff,
        selectedDayPredicate: (day) {
          return isSameDay(widget.selectedStartDate, day) ||
              isSameDay(widget.selectedEndDate, day);
        },
        onDaySelected: (selectedDay, focusedDay) {
          setState(() {
            if (_tempStart == null && _tempEnd == null) {
              _tempStart = selectedDay;
            } else if (_tempStart != null && _tempEnd == null) {
              if (selectedDay.isBefore(_tempStart!)) {
                _tempEnd = _tempStart;
                _tempStart = selectedDay;
              } else {
                _tempEnd = selectedDay;
              }
              if (_containsReservedDates(_tempStart!, _tempEnd!)) {
                _showReservationError(context);
                _tempStart = null;
                _tempEnd = null;
              } else {
                widget.onRangeSelected(_tempStart!, _tempEnd!);
              }
            } else if (_tempStart != null && _tempEnd != null) {
              _tempStart = selectedDay;
              _tempEnd = null;
            }
            widget.onRangeSelected(_tempStart!, _tempEnd ?? _tempStart!);
          });
        },
        enabledDayPredicate: (day) {
          return !_isReserved(day) && !_isPast(day);
        },
        headerStyle: HeaderStyle(
          formatButtonVisible: false,
          titleCentered: true,
          titleTextFormatter: (date, locale) {
            return DateFormat.yMMMM(locale).format(date);
          },
        ),
        calendarBuilders: CalendarBuilders(
          headerTitleBuilder: (context, date) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  DateFormat.yMMMM('ko_KR').format(date),
                  style: TextStyle(fontSize: 20.0),
                ),
              ],
            );
          },
          defaultBuilder: (context, day, focusedDay) {
            if (_isReserved(day) || _isPast(day)) {
              return Center(
                child: Text(
                  '${day.day}',
                  style: TextStyle(color: Colors.grey.withOpacity(0.5)),
                ),
              );
            }
            return Center(
              child: Text(
                '${day.day}',
              ),
            );
          },
          disabledBuilder: (context, day, focusedDay) {
            if (_isReserved(day) || _isPast(day)) {
              return Center(
                child: Text(
                  '${day.day}',
                  style: TextStyle(color: Colors.grey.withOpacity(0.5)),
                ),
              );
            }
            return null;
          },
          selectedBuilder: (context, date, _) => Container(
            margin: const EdgeInsets.all(4.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.redAccent,
              shape: BoxShape.circle,
            ),
            child: Text(
              '${date.day}',
              style: TextStyle(color: Colors.white),
            ),
          ),
          todayBuilder: (context, date, _) => Container(
            margin: const EdgeInsets.all(4.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.redAccent.shade100,
              shape: BoxShape.circle,
            ),
            child: Text(
              '${date.day}',
              style: TextStyle(color: Colors.white),
            ),
          ),
          rangeStartBuilder: (context, date, _) => Container(
            margin: const EdgeInsets.all(4.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.redAccent,
              shape: BoxShape.circle,
            ),
            child: Text(
              '${date.day}',
              style: TextStyle(color: Colors.white),
            ),
          ),
          rangeEndBuilder: (context, date, _) => Container(
            margin: const EdgeInsets.all(4.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.redAccent,
              shape: BoxShape.circle,
            ),
            child: Text(
              '${date.day}',
              style: TextStyle(color: Colors.white),
            ),
          ),
          withinRangeBuilder: (context, date, _) => Container(
            margin: const EdgeInsets.all(4.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.redAccent.shade100,
              shape: BoxShape.circle,
            ),
            child: Text(
              '${date.day}',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
