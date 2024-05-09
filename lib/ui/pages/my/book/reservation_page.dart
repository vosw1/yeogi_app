import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:yogi_project/_core/constants/move.dart';
import 'package:yogi_project/_core/constants/size.dart';
import 'package:yogi_project/_core/constants/style.dart';
import 'package:yogi_project/_core/utils/validator_util.dart';
import 'package:yogi_project/data/models/room.dart';
import 'package:yogi_project/ui/pages/my/book/widgets/age_confirmation_dialog.dart';
import 'package:yogi_project/ui/pages/my/book/widgets/privacy_polocy_dialog.dart';
import 'package:yogi_project/ui/pages/my/book/widgets/reservation_text_form_field.dart';
import 'package:yogi_project/ui/pages/my/book/widgets/third_party_providing_dialog.dart';
import 'package:yogi_project/ui/pages/my/book/widgets/usage_rules_dialog.dart';
import 'package:yogi_project/ui/pages/pay/payment_page.dart';

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

  get itemData => null;

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
                        image:
                            AssetImage("assets/images/${rooms.roomImgTitle}"),
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
                            '${rooms.roomName}',
                            style: h5(),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text('체크인: ${rooms.checkInDate}'),
                        Text('입실: ${rooms.checkInTime}'),
                        Text('체크아웃: ${rooms.checkOutDate}'),
                        Text('퇴실: ${rooms.checkOutTime}'),
                        SizedBox(height: gap_s),
                        Text(
                            '결제금액 : ${NumberFormat('#,###').format(rooms.price)} 원'),
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
              Text(
                "예약자 정보",
                style: h5(),
              ),
              SizedBox(height: gap_m),
              ReservationTextFormField(
                controller: _nameController,
                labelText: '이름',
                hintText: "이름을 입력하세요",
                validator: validateName,
              ),
              SizedBox(height: gap_s),
              ReservationTextFormField(
                controller: _phoneNumberController,
                labelText: '전화번호',
                hintText: '000-0000-0000',
                keyboardType: TextInputType.phone,
                validator: validatePhoneNumber,
              ),
              SizedBox(height: gap_xs),
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
      persistentFooterButtons: [
        Container(
          // 수정된 부분
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
              '${NumberFormat('#,###').format(rooms.price)} 원 결제하기',
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
    required void Function(bool) onChecked,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Checkbox(
              value: _isChecked,
              onChanged: (bool? value) {
                onChecked(value ?? false);
              },
            ),
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
            ),
          ],
        ),
        SizedBox(height: gap_s),
        Column(
          children: subtitle.map((text) {
            return GestureDetector(
              onTap: () {
                _showPopup(text); // 팝업을 표시하는 메소드를 호출
              },
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Checkbox(
                          value: _subCheckboxValues[subtitle.indexOf(text)],
                          onChanged: (bool? value) {
                            setState(() {
                              _subCheckboxValues[subtitle.indexOf(text)] =
                                  value ?? false;
                            });
                          },
                        ),
                        Text(text),
                      ],
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios),
                ],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  void _showPopup(String text) {
    AlertDialog alertDialog;

    switch (text) {
      case '이용규칙 및 취소/환불 규정 동의(필수)':
        alertDialog = _buildUsageRulesDialog() as AlertDialog;
        break;
      case '개인정보 수집 및 이용 동의(필수)':
        alertDialog = _buildPrivacyPolicyDialog() as AlertDialog;
        break;
      case '개인정보 제3자 제공 동의(필수)':
        alertDialog = _buildThirdPartyProvidingDialog() as AlertDialog;
        break;
      case '만 14세 이상 확인(필수)':
        alertDialog = _buildAgeConfirmationDialog() as AlertDialog;
        break;
      default:
        alertDialog = _buildDefaultDialog();
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alertDialog;
      },
    );
  }

  UsageRulesDialog _buildUsageRulesDialog() {
    return UsageRulesDialog();
  }

  PrivacyPolicyDialog _buildPrivacyPolicyDialog() {
    return PrivacyPolicyDialog();
  }

  ThirdPartyProvidingDialog _buildThirdPartyProvidingDialog() {
    return ThirdPartyProvidingDialog(rooms);
  }

  AgeConfirmationDialog _buildAgeConfirmationDialog() {
    return AgeConfirmationDialog();
  }

  AlertDialog _buildDefaultDialog() {
    return AlertDialog(
      title: Text('Notice'),
      content: Text('일치하는 팝업이 없습니다.'),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('확인'),
        ),
      ],
    );
  }

  _showPopups(BuildContext context) {
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
      // 예약 결제 페이지로 이동
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PaymentPage()),
      );
    }
  }
}