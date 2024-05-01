import 'package:flutter/material.dart';
import 'package:yogi_project/_core/constants/style.dart';
import 'package:yogi_project/ui/pages/auth/join/join_page.dart';

class ServiceAgreement extends StatefulWidget {
  @override
  _ServiceAgreementState createState() => _ServiceAgreementState();
}

class _ServiceAgreementState extends State<ServiceAgreement> {
  List<bool> _subCheckboxValues = [false, false];
  bool _allAgreementsChecked = false;

  List<String> _agreementTitles = [
    '만 14세 이상 확인',
    '개인정보 수집 및 이용 동의',
  ];

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: Text('서비스 약관 내용'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Row(
                  children: [
                    Checkbox(
                      value: _allAgreementsChecked,
                      onChanged: (value) {
                        setState(() {
                          _allAgreementsChecked = value ?? false;
                          _subCheckboxValues = List.filled(
                            _subCheckboxValues.length,
                            _allAgreementsChecked,
                          );
                        });
                      },
                    ),
                    Text(
                      '전체 동의',
                      style: h4(),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: _subCheckboxValues.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
                      child: _buildSubCheckbox(index, _agreementTitles[index]),
                    );
                  },
                ),
              ),
              SizedBox(height: 16.0),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_allAgreementsChecked && _subCheckboxValues.every((value) => value)) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => JoinPage()),
                      );
                    } else {
                      _showPopups(context);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    padding: EdgeInsets.symmetric(vertical: 20),
                  ),
                  child: Text(
                    '동의 완료',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
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

  Widget _buildSubCheckbox(int index, String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Checkbox(
              value: _subCheckboxValues[index],
              onChanged: (value) {
                setState(() {
                  _subCheckboxValues[index] = value ?? false;
                  _checkAllAgreements();
                });
              },
            ),
            Text
              (title,
              style: h5(),
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                _showPopup(context, index);
              },
              child: Icon(
                Icons.arrow_forward_ios, // 변경된 부분
                color: Colors.grey, // 변경된 부분
              ),
            ),
          ],
        ),
        SizedBox(height: 8.0),
      ],
    );
  }


  void _showPopup(BuildContext context, int index) {
    AlertDialog? alertDialog;

    switch (index) {
      case 0:
        alertDialog = _buildDialog(
          title: '만 14세 이상 확인',
          content: [
            _buildDialogContent('만 14세 이상 이용 확인 동의','여어떻노는 만 14세 미만 아동의 서비스 이용을 제한하고 있습니다.\n\n'
                '개인정보 보호법에는 만 14세 미만 아동의 개인정보 수집 시 법정대리인 동의를 받도록 규정하고 있으며,\n'
                '만 14세 미만 아동이 법정대리인 동의없이 서비스 이용이 확인된 경우 서비스 이용이 제한될 수 있음을 알려드립니다.'),
          ],
        );
        break;
      case 1:
        alertDialog = _buildDialog(
          title: '개인정보 수집 및 이용 동의',
          content: [
            _buildDialogContent('개인정보 수집 및 이용 확인 동의','필수\t예약/구매 서비스 제공 상담 및 부정거래 기록 확인\t\n'
                '[예약·구매]\n'
                '예약자 정보(이름, 휴대전화번호)\n'
                '[결제]\n'
                '거래내역\n'
                '*결제 시 개인정보는 PG사(결제대행업체)에서 수집 및 저장하고 있으며, 회사는 PG사에서 제공하는 거래 내역만 제공받음\n'
                '[거래명세서 발급]\n'
                '이메일주소\n'
                '[현금영수증 발급]\n'
                '휴대전화번호, 이메일주소\n'
                '[취소·환불]\n'
                '은행명, 계좌번호, 예금주명\n'
                '- 회원 탈퇴 시 까지\n'
                '* 관계 법령에 따라 보존할 필요가 있는 경우 해당 법령에서 요구하는 기한까지 보유\n'
                '※ 위 동의 내용을 거부하실 수 있으나, 동의를 거부하실 경우 서비스를 이용하실 수 없습니다.\n'
                '※ 개인정보 처리와 관련된 상세 내용은 \'개인정보처리방침\'을 참고',),
          ],
        );
        break;
      default:
      // 다른 경우에 대한 처리 (아무 작업도 수행하지 않음)
        break;
    }

    if (alertDialog != null) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog!;
        },
      );
    }
  }


  Widget _buildDialogContent(String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(content),
        SizedBox(height: 10),
      ],
    );
  }

  AlertDialog _buildDialog({required String title, required List<Widget> content}) {
    return AlertDialog(
      title: Text(title, style: h6()),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: content,
        ),
      ),
      backgroundColor: Colors.white,
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

  void _showPopups(BuildContext context) {
    List<String> uncheckedAgreements = [];

    for (int index = 0; index < _subCheckboxValues.length; index++) {
      if (!_subCheckboxValues[index]) {
        uncheckedAgreements.add(_agreementTitles[index]);
      }
    }

    if (uncheckedAgreements.isNotEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('알림'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: uncheckedAgreements
                  .map((agreement) => Text(agreement))
                  .toList(),
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
    }
  }

  void _checkAllAgreements() {
    _allAgreementsChecked = _subCheckboxValues.every((value) => value);
  }
}
