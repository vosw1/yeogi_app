import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:yogi_project/_core/constants/size.dart';
import 'package:yogi_project/_core/constants/style.dart';
import 'package:yogi_project/_core/utils/validator_util.dart';
import 'package:yogi_project/data/models/room.dart';
import 'package:yogi_project/data/models/stay.dart';
import 'package:yogi_project/ui/pages/book/widgets/reservaion_text_form_field.dart';
import 'package:yogi_project/ui/pages/pay/payment_page.dart';
import 'package:yogi_project/data/dtos/reservaion_request.dart';
import 'package:yogi_project/data/repositories/reservation_repository.dart';

class ReservationPage extends StatefulWidget {
  final Room rooms;
  final Stay stays;

  ReservationPage({required this.rooms, required this.stays});

  @override
  _BookPageState createState() => _BookPageState();
}

class _BookPageState extends State<ReservationPage> {
  bool _isChecked = false;
  List<bool> _subCheckboxValues = [false, false, false, false];
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _nameController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('예약하기'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(gap_m),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                              "assets/images/${widget.rooms.roomImgTitle}"),
                        ),
                      ),
                    ),
                    SizedBox(width: gap_m),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: gap_s),
                          Container(
                            constraints: BoxConstraints(minHeight: 40),
                            child: Text(
                              '${widget.rooms.roomName}',
                              style: h5(),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Text('체크인: ${widget.rooms.checkInDate}'),
                          Text('입실: ${widget.rooms.checkInTime}'),
                          Text('체크아웃: ${widget.rooms.checkOutDate}'),
                          Text('퇴실: ${widget.rooms.checkOutTime}'),
                          SizedBox(height: gap_s),
                          Text(
                              '결제금액 : ${NumberFormat('#,###').format(widget.rooms.price)} 원'),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: gap_s),
                Container(
                  height: gap_xm,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(gap_xs),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: gap_xx),
                  child: Center(
                    child: Text(
                      "당일 취소 불가능",
                      style: h5(mColor: Colors.redAccent),
                    ),
                  ),
                ),
                SizedBox(height: gap_s),
                Divider(),
                SizedBox(height: gap_m),
                SizedBox(height: gap_m),
                Text(
                  "예약자 정보",
                  style: h5(),
                ),
                SizedBox(height: gap_s),
                ReservaionTextFormField(
                  controller: _nameController,
                  labelText: '이름',
                  hintText: "이름을 입력하세요",
                  validator: validateName,
                ),
                SizedBox(height: gap_s),
                ReservaionTextFormField(
                  controller: _phoneNumberController,
                  labelText: '전화번호',
                  hintText: '000-0000-0000',
                  keyboardType: TextInputType.phone,
                  validator: validatePhoneNumber,
                ),
                SizedBox(height: gap_s),
                Divider(),
                SizedBox(height: gap_s),
                _buildExpandableCheckbox(
                  context: context,
                  title: '전체 동의',
                  subtitle: [
                    '이용규칙 및 취소/환불 규정 동의(필수)',
                    '개인정보 수집 및 이용 동의(필수)',
                    '개인정보 제3자 제공 동의(필수)',
                    '만 14세 이상 확인(필수)',
                  ],
                  onChecked: (value) {
                    setState(() {
                      _isChecked = value;
                      _subCheckboxValues =
                          List.filled(_subCheckboxValues.length, value);
                    });
                  },
                ),
                SizedBox(height: gap_l), // 추가된 여백
              ],
            ),
          ),
        ),
      ),
      persistentFooterButtons: [
        Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: gap_m),
          child: ElevatedButton(
            onPressed: () {
              _handleBooking();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.redAccent,
              padding: EdgeInsets.symmetric(vertical: 15.0),
            ),
            child: Text(
              '결제하기',
              style: h6(mColor: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildExpandableCheckbox({
    required BuildContext context,
    required String title,
    required List<String> subtitle,
    required ValueChanged<bool> onChecked,
  }) {
    return ExpansionTile(
      title: Text(title),
      children: [
        for (var i = 0; i < subtitle.length; i++)
          CheckboxListTile(
            value: _subCheckboxValues[i],
            onChanged: (value) {
              setState(() {
                _subCheckboxValues[i] = value!;
                if (!_subCheckboxValues.contains(false)) {
                  _isChecked = true;
                } else {
                  _isChecked = false;
                }
                onChecked(_isChecked);
              });
            },
            title: Text(subtitle[i]),
            controlAffinity: ListTileControlAffinity.leading,
          ),
      ],
    );
  }

  void _handleBooking() {
    if (_formKey.currentState!.validate()) {
      // 사용자 입력값 받기 + 요청 DTO 만들기
      ReservationSaveReqDTO reqDTO = ReservationSaveReqDTO(
        roomId: widget.rooms.roomId,
        roomImgTitle: widget.rooms.roomImgTitle,
        roomName: widget.rooms.roomName,
        location: widget.stays.location,
        checkInDate: DateTime.parse(widget.rooms.checkInDate),
        checkOutDate: DateTime.parse(widget.rooms.checkOutDate),
        price: widget.rooms.price,
        reservationName: _nameController.text.trim(),
        reservationTel: _phoneNumberController.text.trim(),
      );

      // 예약 요청 보내기
      _bookRoom(reqDTO);
    }
  }

  Future<void> _bookRoom(ReservationSaveReqDTO reqDTO) async {
    // 예약 요청 보내기
    final responseDTO = await ReservationRepository()
        .fetchReservationSave(reqDTO, 'your_access_token_here');

    // 예약 성공 여부 확인
    if (responseDTO.success) {
      // 예약 성공 시 처리
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PaymentPage()),
      );
    } else {
      // 예약 실패 시 처리
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('예약을 처리하는 중 오류가 발생했습니다.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('확인'),
              ),
            ],
          );
        },
      );
    }
  }
}
