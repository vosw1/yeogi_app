import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:yogi_project/_core/constants/size.dart';
import 'package:yogi_project/_core/constants/style.dart';
import 'package:yogi_project/_core/utils/validator_util.dart';
import 'package:yogi_project/data/models/stay.dart';
import 'package:yogi_project/ui/pages/auth/join/widget/join_text_form_field.dart'; // JoinTextFormField 임포트 추가
import 'package:yogi_project/data/models/user.dart';
import 'package:yogi_project/ui/pages/my/my_page.dart'; // User 모델 임포트 추가

class MyPageUpdate extends StatefulWidget {
  final User users; // User 데이터 전달을 위한 필드 추가

  MyPageUpdate({required this.users}); // 생성자 추가

  @override
  _MyPageUpdateState createState() => _MyPageUpdateState();
}

class _MyPageUpdateState extends State<MyPageUpdate> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  final _ageController = MaskedTextController(mask: '0000-00-00');
  final _phoneController = MaskedTextController(mask: '000-0000-0000');

  @override
  void initState() {
    super.initState();
    // User 데이터를 사용하여 필드 초기화
    _nameController.text = widget.users.name!;
    // 다른 필드들도 위와 같이 초기화
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('회원정보 수정'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(gap_m),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: gap_m),
                JoinTextFormField(
                  controller: _nameController,
                  labelText: '이름',
                  validator: validateName,
                  hintText: "이름을 입력하세요",
                ),
                SizedBox(height: gap_m),
                JoinTextFormField(
                  controller: _passwordController,
                  labelText: '비밀번호',
                  validator: validatePassword,
                  hintText: "패스워드를 입력하세요",
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
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // 회원정보 수정 로직 구현
                      print('이름: ${_nameController.text}');
                      print('비밀번호: ${_passwordController.text}');
                      print('생년월일: ${_ageController.text}');
                      print('전화번호: ${_phoneController.text}');
                    }
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyPage(
                          users: User(
                            name: _nameController.text,
                            password: _passwordController.text, id: 1, email: '', createdAt: null, updatedAt: null,
                          ),
                          stays: Stay(
                            stayName: '★당일특가★ 하이원리조트 마운틴콘도',
                            stayImgTitle: 'hotel/hotel1.png',
                            location: '강원 정선군 고한읍 고한리 438',
                            stayInfo: 'dsh',
                            notice: 'ttfdgjn',
                            reviews: [
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.redAccent),
                  ),
                  child: Text('수정', style: TextStyle(color: Colors.white),),

                ),
                SizedBox(height: gap_l),
              ],
            ),
          ),
        ),
      ),
    );
  }
}