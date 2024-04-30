import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:yogi_project/_core/constants/size.dart';
import 'package:yogi_project/_core/constants/style.dart';
import 'package:yogi_project/_core/utils/validator_util.dart';
import 'package:yogi_project/ui/pages/auth/join/widget/duplicate_email.check.dart';

import 'widget/join_text_form_field.dart';

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
                Text(
                  _emailController.text.isNotEmpty ? validateEmail(_emailController.text) ?? '' : '',
                  style: TextStyle(color: Colors.redAccent),
                ),
                SizedBox(height: gap_xxx),
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
                ),
                SizedBox(height: gap_m),
                JoinTextFormField(
                  controller: _ageController,
                  keyboardType: TextInputType.number,
                  labelText: '생년월일',
                  hintText: 'YYYYMMDD',
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
                SizedBox(height: 32.0),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // 회원가입 로직 구현
                      print('이메일: ${_emailController.text}');
                      print('비밀번호: ${_passwordController.text}');
                      print('이름: ${_nameController.text}');
                      print('주소: ${_addressController.text}');
                      print('생년월일: ${_ageController.text}');
                      print('전화번호: ${_phoneController.text}');
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
}
