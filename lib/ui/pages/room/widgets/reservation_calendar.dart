import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class ReservationCalendar extends StatefulWidget {
  final DateTime selectedStartDate;
  final DateTime selectedEndDate;
  final Function(DateTime, DateTime) onRangeSelected;
  final List<DateTime> reservedDates;

  ReservationCalendar({
    required this.selectedStartDate,
    required this.selectedEndDate,
    required this.onRangeSelected,
    required this.reservedDates,
  });

  @override
  _ReservationCalendarState createState() => _ReservationCalendarState();
}

class _ReservationCalendarState extends State<ReservationCalendar> {
  DateTime? _tempStart;
  DateTime? _tempEnd;

  bool _isReserved(DateTime day) {
    return widget.reservedDates.contains(day);
  }

  bool _isPast(DateTime day) {
    return day.isBefore(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      locale: 'ko_KR', // 한글 설정
      focusedDay: _tempStart ?? DateTime.now(),
      firstDay: DateTime.utc(2000, 1, 1),
      lastDay: DateTime.utc(2100, 12, 31),
      rangeSelectionMode: RangeSelectionMode.toggledOff,
      selectedDayPredicate: (day) {
        return isSameDay(widget.selectedStartDate, day) || isSameDay(widget.selectedEndDate, day);
      },
      onDaySelected: (selectedDay, focusedDay) {
        setState(() {
          if (_tempStart == null || (_tempStart != null && _tempEnd != null)) {
            _tempStart = selectedDay;
            _tempEnd = null;
          } else if (_tempStart != null && _tempEnd == null) {
            if (selectedDay.isBefore(_tempStart!)) {
              _tempEnd = _tempStart;
              _tempStart = selectedDay;
            } else {
              _tempEnd = selectedDay;
            }
            widget.onRangeSelected(_tempStart!, _tempEnd!);
          } else if (_tempStart != null && _tempEnd != null) {
            _tempStart = selectedDay;
            _tempEnd = null;
          }
        });
      },
      enabledDayPredicate: (day) {
        return !_isReserved(day) && !_isPast(day);
      },
      calendarBuilders: CalendarBuilders(
        defaultBuilder: (context, day, focusedDay) {
          if (_isReserved(day)) {
            return Center(
              child: Text(
                '${day.day}',
                style: TextStyle(color: Colors.grey.withOpacity(0.5)), // 회색으로 설정
              ),
            );
          } else if (_isPast(day)) {
            return Center(
              child: Text(
                '${day.day}',
                style: TextStyle(color: Colors.grey.withOpacity(0.5)), // 회색으로 설정
              ),
            );
          }
          return null;
        },
        rangeStartBuilder: (context, date, _) => Container(
          margin: const EdgeInsets.all(4.0),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.redAccent,
            borderRadius: BorderRadius.circular(10.0),
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
            borderRadius: BorderRadius.circular(10.0),
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
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Text(
            '${date.day}',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
