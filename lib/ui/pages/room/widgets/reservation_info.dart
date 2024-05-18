import 'package:flutter/material.dart';
import 'package:yogi_project/_core/constants/size.dart';
import 'package:yogi_project/_core/constants/style.dart';
import 'package:yogi_project/ui/pages/room/room_detail_view_model.dart';
import 'package:yogi_project/ui/pages/room/widgets/reservation_calendar.dart';

class ReservationInfo extends StatelessWidget {
  final int numberOfNights;
  final RoomDetailModel model;
  final DateTime selectedStartDate;
  final DateTime selectedEndDate;
  final Function(DateTime, DateTime) onRangeSelected;
  final List<DateTime> reservedDates;

  ReservationInfo({
    required this.numberOfNights,
    required this.model,
    required this.selectedStartDate,
    required this.selectedEndDate,
    required this.onRangeSelected,
    required this.reservedDates,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
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
            ReservationCalendar(
              selectedStartDate: selectedStartDate,
              selectedEndDate: selectedEndDate,
              onRangeSelected: onRangeSelected,
              roomId: model.roomOption.id,
              reservedDates: reservedDates,
            ),
            SizedBox(height: gap_m),
            Text(
              '숙박기간 : ${numberOfNights} 박 ${numberOfNights + 1} 일',
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
                  if (index.isEven) {
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
              '${model.roomOption.information}',
              style: TextStyle(
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
