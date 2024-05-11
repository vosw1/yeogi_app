import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:yogi_project/_core/constants/size.dart';
import 'package:yogi_project/_core/constants/style.dart';
import 'package:yogi_project/data/models/room.dart';
import 'package:yogi_project/ui/pages/my/pay/payment_page.dart';
import 'package:yogi_project/ui/pages/my/reservation/widgets/argreement_section.dart';
import 'package:yogi_project/ui/pages/my/reservation/widgets/reservaion_info_form.dart';
import 'package:yogi_project/ui/pages/my/reservation/widgets/room_info.dart';
import 'package:yogi_project/ui/pages/my/reservation/widgets/room_notice.dart';

class ReservationPage extends StatefulWidget {
  final Room rooms;
  ReservationPage({required this.rooms});

  @override
  _ReservationPageState createState() => _ReservationPageState();
}

class _ReservationPageState extends State<ReservationPage> {
  bool _isChecked = false;
  List<bool> _subCheckboxValues = [false, false, false, false];
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('예약하기')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(gap_m),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              RoomInfo(rooms: widget.rooms),
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
                  setState(() {
                    _isChecked = value;
                    _subCheckboxValues = List.filled(_subCheckboxValues.length, value);
                  });
                },
                subCheckboxValues: _subCheckboxValues,
                subtitles: [
                  '이용규칙 및 취소/환불 규정 동의(필수)',
                  '개인정보 수집 및 이용 동의(필수)',
                  '개인정보 제3자 제공 동의(필수)',
                  '만 14세 이상 확인(필수)',
                ],
              ),
              SizedBox(height: gap_l),
            ],
          ),
        ),
      ),
      persistentFooterButtons: [
        Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: gap_m),
          child: ElevatedButton(
            onPressed: () {
              _showPopups(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.redAccent,
              padding: EdgeInsets.symmetric(vertical: 15.0),
            ),
            child: Text(
              '${NumberFormat('#,###').format(widget.rooms.price)} 원 결제하기',
              style: h6(mColor: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  void _showPopups(BuildContext context) {
    List<String> messages = [];
    if (!_subCheckboxValues.every((element) => element)) {
      messages.add('모두 동의해주세요');
    }

    if (messages.isNotEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Notice'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: messages.map((message) => Text(message)).toList(),
            ),
            backgroundColor: Colors.white,
            actions: <Widget>[
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('확인'),
                ),
              ),
            ],
          );
        },
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PaymentPage()),
      );
    }
  }
}


