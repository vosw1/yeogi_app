import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:yogi_project/_core/constants/size.dart';
import 'package:yogi_project/_core/utils/validator_util.dart';
import 'package:yogi_project/ui/pages/auth/join/widget/address/library_daum_post_code_screen.dart';
import 'package:yogi_project/ui/pages/auth/join/widget/duplicate_email.check.dart';
import 'package:yogi_project/ui/pages/auth/join/widget/join_text_form_field.dart';
import 'package:yogi_project/ui/pages/home/home_page.dart';
import 'package:yogi_project/ui/pages/my/my_page.dart';

class JoinPage extends StatefulWidget {
  @override
  _JoinPageState createState() => _JoinPageState();
}

class _JoinPageState extends State<JoinPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  final _addressController = TextEditingController();
  final _ageController = MaskedTextController(mask: '0000-00-00');
  final _phoneController = MaskedTextController(mask: '000-0000-0000');
  bool _serviceAgreementChecked = false;
  bool _ageCheck = false;
  bool _privacyCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('회원가입'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(gap_m),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                JoinTextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  labelText: '이메일',
                  hintText: 'example@email.com',
                  validator: validateEmail,
                ),
                SizedBox(height: gap_s),
                DuplimentEmailCheck(emailController: _emailController),
                SizedBox(height: gap_s),
                JoinTextFormField(
                  controller: _passwordController,
                  labelText: '비밀번호',
                  validator: validatePassword,
                  hintText: "패스워드를 입력하세요",
                ),
                SizedBox(height: gap_m),
                JoinTextFormField(
                  controller: _nameController,
                  labelText: '이름',
                  validator: validateName,
                  hintText: "이름을 입력하세요",
                ),
                SizedBox(height: gap_m),
                JoinTextFormField(
                  controller: _addressController,
                  labelText: '주소',
                  validator: validateAddress,
                  hintText: "주소를 입력하세요",
                  onAddressSearch: () {
                    _navigateToAddressSearch(context);
                  },
                ),
                SizedBox(height: gap_m),
                JoinTextFormField(
                  controller: _ageController,
                  keyboardType: TextInputType.number,
                  labelText: '생년월일',
                  hintText: 'YYYY-MM-DD',
                  validator: validateAge,
                ),
                SizedBox(height: gap_m),
                JoinTextFormField(
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  labelText: '전화번호',
                  hintText: '000-0000-0000',
                  validator: validatePhoneNumber,
                ),
                SizedBox(height: gap_m),
                Row(
                  children: [
                    Checkbox(
                      value: _serviceAgreementChecked,
                      onChanged: (value) {
                        setState(() {
                          _serviceAgreementChecked = value ?? false;
                          _ageCheck = _serviceAgreementChecked; // 이 부분이 추가됨
                          _privacyCheck = _serviceAgreementChecked; // 이 부분이 추가됨
                        });
                      },
                    ),
                    GestureDetector(
                      onTap: () async {
                        _showPopup(context, 0);
                      },
                      child: Row(
                        children: [
                          Text(
                            '서비스 약관에 동의합니다',
                            style: TextStyle(
                              color: Colors.redAccent,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Checkbox(
                      value: _ageCheck,
                      onChanged: (value) {
                        setState(() {
                          _ageCheck = value ?? false;
                        });
                      },
                    ),
                    GestureDetector(
                      onTap: () async {
                        _showPopup(context, 1);
                      },
                      child: Row(
                        children: [
                          Text(
                            '만 14세 이상 확인',
                          ),
                          SizedBox(width: 150),
                          Icon(Icons.arrow_forward_ios, size: gap_m),
                          // ">" 아이콘 추가
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Checkbox(
                      value: _privacyCheck,
                      onChanged: (value) {
                        setState(() {
                          _privacyCheck = value ?? false;
                        });
                      },
                    ),
                    GestureDetector(
                      onTap: () async {
                        _showPopup(context, 2);
                      },
                      child: Row(
                        children: [
                          Text(
                            '개인정보 수집 및 이용 동의',
                          ),
                          SizedBox(width: 90),
                          Icon(Icons.arrow_forward_ios, size: gap_m),
                          // ">" 아이콘 추가
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 32.0),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate() &&
                        _serviceAgreementChecked &&
                        _ageCheck &&
                        _privacyCheck) {
                      // 회원가입 성공 시 홈 페이지로 이동
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                  ),
                  child: Text('회원가입', style: TextStyle(color: Colors.white)),
                ),
                SizedBox(height: gap_l),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _navigateToAddressSearch(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LibraryDaumPostcodeScreen()),
    ).then((selectedAddress) {
      if (selectedAddress != null) {
        setState(() {
          _addressController.text = selectedAddress.toString();
        });
      }
    });
  }

  void _showPopup(BuildContext context, int index) {
    AlertDialog? alertDialog;

    switch (index) {
      case 1:
        alertDialog = _buildDialog(
          title: '만 14세 이상 확인',
          content: [
            _buildDialogContent(
              '만 14세 이상 이용 확인 동의',
              '여어떻노는 만 14세 미만 아동의 서비스 이용을 제한하고 있습니다.\n\n'
                  '개인정보 보호법에는 만 14세 미만 아동의 개인정보 수집 시 법정대리인 동의를 받도록 규정하고 있으며,\n'
                  '만 14세 미만 아동이 법정대리인 동의없이 서비스 이용이 확인된 경우 서비스 이용이 제한될 수 있음을 알려드립니다',
            ),
          ],
        );
        break;
      case 2:
        alertDialog = _buildDialog(
          title: '개인정보 수집 및 이용 동의',
          content: [
            _buildDialogContent(
              '개인정보 수집 및 이용 확인 동의',
              '필수\t예약/구매 서비스 제공 상담 및 부정거래 기록 확인\t\n'
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
                  '※ 개인정보 처리와 관련된 상세 내용은 \'개인정보처리방침\'을 참고',
            ),
          ],
        );
        break;
      default:
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

  AlertDialog _buildDialog(
      {required String title, required List<Widget> content}) {
    return AlertDialog(
      title: Text(title),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: content,
      ),
      actions: [
        Center(
          // 가운데 정렬을 위해 Center 위젯 추가
          child: TextButton(
            onPressed: () {
              Navigator.pop(context, true);
            },
            child: Text('확인'),
          ),
        ),
      ],
    );
  }

  Widget _buildDialogContent(String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Text(content),
        SizedBox(height: 16),
      ],
    );
  }
}
