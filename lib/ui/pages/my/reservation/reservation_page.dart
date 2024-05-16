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

  @override
  Widget build(BuildContext context) {
    print(widget.numberOfNights);
    print(widget.rooms.price * widget.numberOfNights);
    return Scaffold(
      appBar: AppBar(
          title: Text(
            '예약하기',
            style: h4(),
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(gap_m),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              RoomInfo(
                  rooms: widget.rooms,
                  numberOfNights: widget.numberOfNights,
                  selectedStartDate: widget.selectedStartDate,
                  selectedEndDate: widget.selectedEndDate),
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
                padding: EdgeInsets.symmetric(horizontal: gap_m),
                child: ElevatedButton(
                  onPressed: () => _attemptReservation(context, _nameController,
                      _phoneNumberController, widget.rooms),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    padding: EdgeInsets.symmetric(vertical: 15.0),
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

  Future<String?> _getToken() async {
    // This is a placeholder. Implement your token retrieval logic here.
    // For example, using SharedPreferences or any other storage mechanism.
    // return await SharedPreferences.getInstance().getString('token');
    return Future.value(null); // Replace this with actual token retrieval logic.
  }

  void _attemptReservation(
      BuildContext context,
      TextEditingController nameController,
      TextEditingController phoneController,
      Room room) async {
    String? token = await _getToken();
    if (token == null) {
      _showLoginRequiredDialog(context);
      return;
    }

    try {
      // Use the selected dates from the widget properties
      DateTime checkInDate = widget.selectedStartDate;
      DateTime checkOutDate = widget.selectedEndDate;

      ReservationSaveReqDTO dto = ReservationSaveReqDTO(
        roomId: room.roomId,
        roomName: room.roomName ?? 'defaultRoomName',
        roomImgTitle: room.roomImgTitle ?? 'defaultImgTitle',
        price: (room.price ?? 0).toInt(),
        checkInDate: checkInDate,
        checkOutDate: checkOutDate,
        reservationName: nameController.text.isNotEmpty
            ? nameController.text
            : 'Default Name',
        reservationTel: phoneController.text.isNotEmpty
            ? phoneController.text
            : 'Default Tel',
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

  void _showLoginRequiredDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('로그인 필요'),
          content: Text('로그인이 필요합니다.'),
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

  DateTime _parseDate(String date) {
    try {
      return DateTime.parse(date);
    } catch (e) {
      return DateTime.now();
    }
  }
}
