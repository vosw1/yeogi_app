import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
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
  final DateTime selectedStartDate;
  final DateTime selectedEndDate;

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
  List<bool> _subCheckboxValues = [false, false, false, false];
  bool _isAllChecked = false;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _phoneNumberController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }

  void _onAllChecked(bool value) {
    setState(() {
      _isAllChecked = value;
      _subCheckboxValues = List<bool>.filled(_subCheckboxValues.length, value);
    });
  }

  void _onSubCheckboxChanged(int index, bool value) {
    setState(() {
      _subCheckboxValues[index] = value;
      _isAllChecked = _subCheckboxValues.every((element) => element);
    });
  }

  bool get _canProceed => _subCheckboxValues.every((element) => element);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '예약하기',
          style: h4(),
        ),
      ),
      body: SingleChildScrollView(
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
            ReservationInfoForm(
              nameController: _nameController,
              phoneNumberController: _phoneNumberController,
            ),
            SizedBox(height: gap_xs),
            Divider(),
            SizedBox(height: gap_s),
            AgreementSection(
              onAllChecked: _onAllChecked,
              subCheckboxValues: _subCheckboxValues,
              onSubCheckboxChanged: _onSubCheckboxChanged,
              subtitles: [
                '이용규칙 및 취소/환불 규정 동의(필수)',
                '개인정보 수집 및 이용 동의(필수)',
                '개인정보 제3자 제공 동의(필수)',
                '만 14세 이상 확인(필수)',
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(gap_m),
        child: ElevatedButton(
          onPressed: _canProceed
              ? () => _attemptReservation(
            context,
            _nameController,
            _phoneNumberController,
            widget.rooms,
          )
              : null,
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
              '${NumberFormat('#,###').format((widget.rooms.roomSpecialPrice ?? widget.rooms.roomPrice) * widget.numberOfNights)} 원 결제하기',
              style: h5(mColor: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  void _attemptReservation(
      BuildContext context,
      TextEditingController nameController,
      TextEditingController phoneController,
      Room room,
      ) async {
    DateTime checkInDate = widget.selectedStartDate;
    DateTime checkOutDate = widget.selectedEndDate;

    int totalAmount = (room.roomSpecialPrice ?? room.roomPrice) * widget.numberOfNights;

    ReservationSaveReqDTO dto = ReservationSaveReqDTO(
      roomId: room.roomId,
      roomName: room.roomName ?? 'defaultRoomName',
      roomImgTitle: room.roomImgTitle ?? 'defaultImgTitle',
      price: totalAmount,
      amountToPay: totalAmount,
      checkInDate: checkInDate,
      checkOutDate: checkOutDate,
      reservationName: nameController.text.isNotEmpty ? nameController.text : 'Default Name',
      reservationTel: phoneController.text.isNotEmpty ? phoneController.text : 'Default Tel',
      reservedDates: '',
      amount: totalAmount,
      stayAddress: '',
    );

    print('ReservationSaveReqDTO 확인: ${dto.toJson()}'); // 디버깅 코드 추가

    int reservationId = await ref.watch(reservationListProvider.notifier).reservationSave(dto);
    print('reservationSave 확인: $dto');
    print('Received reservationId: $reservationId'); // Debug statement

    if (reservationId != -1) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PayPage(
            reservations: dto,
            reservationId: reservationId,
              numberOfNights: widget.numberOfNights// 예약 아이디 전달
          ),
        ),
      );
    } else {
      _showErrorDialog(context, '예약에 실패했습니다. 다시 시도해주세요.');
    }
  }

  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Notice'),
          content: Text(message),
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
