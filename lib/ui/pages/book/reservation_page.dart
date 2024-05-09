import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:yogi_project/_core/constants/move.dart';
import 'package:yogi_project/_core/constants/size.dart';
import 'package:yogi_project/_core/constants/style.dart';
import 'package:yogi_project/_core/utils/validator_util.dart';
import 'package:yogi_project/data/models/room.dart';
import 'package:yogi_project/ui/pages/book/widgets/reservation_text_form_field.dart';
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
                        image: AssetImage(
                            "assets/images/${rooms.roomImgTitle}"),
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
              SizedBox(height: gap_s),
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
        alertDialog = _buildUsageRulesDialog();
        break;
      case '개인정보 수집 및 이용 동의(필수)':
        alertDialog = _buildPrivacyPolicyDialog();
        break;
      case '개인정보 제3자 제공 동의(필수)':
        alertDialog = _buildThirdPartyProvidingDialog();
        break;
      case '만 14세 이상 확인(필수)':
        alertDialog = _buildAgeConfirmationDialog();
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

  AlertDialog _buildUsageRulesDialog() {
    return AlertDialog(
      title: Text('이용규칙 및 취소/환불 규정 동의'),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text('19세 미만 청소년의 혼숙은 법적으로 불가하며, 이에 대한 숙소의 입실 거부 시 취소/환불이 불가합니다.'),
            Text('업체 현장에서 객실 컨디션 및 서비스로 인해 발생된 분쟁은 여기어때에서 책임지지 않습니다.'),
            Text('취소/환불 가능 여부는 숙소의 정책을 따릅니다.'),
            Text('취소/환불 규정에 따라 취소 수수료가 발생하는 경우, 취소 수수료는 판매가(상품가격) 기준으로 계산됩니다.')
          ],
        ),
      ),
      actionsAlignment: MainAxisAlignment.center, // 버튼들을 중앙에 배치
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

  AlertDialog _buildPrivacyPolicyDialog() {
    return AlertDialog(
      title: Text('개인정보 수집 및 이용 동의'),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text('구분\t수집 목적\t수집 항목\t보유 및 이용기간'),
            Text('필수\t예약/구매 서비스 제공 상담 및 부정거래 기록 확인\t'),
            Text('[예약·구매]\n예약자 정보(이름, 휴대전화번호)\n[결제]\n거래내역\n*결제 시 개인정보는 PG사(결제대행업체)에서 수집 및 저장하고 있으며, 회사는 PG사에서 제공하는 거래 내역만 제공받음\n[거래명세서 발급]\n이메일주소\n[현금영수증 발급]\n휴대전화번호, 이메일주소\n[취소·환불]\n은행명, 계좌번호, 예금주명\n- 회원 탈퇴 시 까지\n* 관계 법령에 따라 보존할 필요가 있는 경우 해당 법령에서 요구하는 기한까지 보유'),
            Text('※ 위 동의 내용을 거부하실 수 있으나, 동의를 거부하실 경우 서비스를 이용하실 수 없습니다.'),
            Text('※ 개인정보 처리와 관련된 상세 내용은 \'개인정보처리방침\'을 참고')
          ],
        ),
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context). pop();
          },
          child: Text('확인'),
        ),
      ],
    );
  }

  AlertDialog _buildThirdPartyProvidingDialog() {
    return AlertDialog(
      title: Text('개인정보 제3자 제공 동의'),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text('제공받는 자\t${rooms.roomName}'),
            Text('제공 목적\t숙박예약서비스 이용계약 이행\n(서비스 제공, 확인, 이용자 정보 확인)'),
            Text('제공하는 항목\t예약한 숙박서비스의 이용자 정보(예약자 이름, 휴대폰번호, 예약번호, 예약 업체명, 예약한 객실명, 결제금액)'),
            Text('보유 및 이용기간\t예약서비스 제공 완료 후 6개월'),
            Text('※ 위 동의 내용을 거부하실 수 있으나, 동의를 거부하실 경우 서비스를 이용하실 수 없습니다.'),
            Text('※ 개인정보 처리와 관련된 상세 내용은 \'개인정보처리방침\'을 참고')
          ],
        ),
      ),
      actionsAlignment: MainAxisAlignment.center,
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

  AlertDialog _buildAgeConfirmationDialog() {
    return AlertDialog(
      title: Text('만 14세 이상 확인'),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text('여어떻노는 만 14세 미만 아동의 서비스 이용을 제한하고 있습니다.'),
            Text('개인정보 보호법에는 만 14세 미만 아동의 개인정보 수집 시 법정대리인 동의를 받도록 규정하고 있으며,'),
            Text('만 14세 미만 아동이 법정대리인 동의없이 서비스 이용이 확인된 경우 서비스 이용이 제한될 수 있음을 알려드립니다.')
          ],
        ),
      ),
      actionsAlignment: MainAxisAlignment.center,
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