import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:yogi_project/_core/utils/validator_util.dart';
import 'package:yogi_project/ui/pages/auth/join/widget/duplicate_email.check.dart';

import 'widget/join_text_form_field.dart';

class JoinPage extends StatelessWidget {
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
          padding: EdgeInsets.all(16.0),
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
                SizedBox(height: 16.0),
                DuplimentEmailCheck(emailController: _emailController),
                JoinTextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  labelText: '비밀번호',
                  validator: validatePassword,
                  hintText: "패스워드를 입력하세요",
                ),
                SizedBox(height: 16.0),
                JoinTextFormField(
                  controller: _nameController,
                  labelText: '이름',
                  validator: validateName,
                  hintText: "이름을 입력하세요",
                ),
                SizedBox(height: 16.0),
                JoinTextFormField(
                  controller: _addressController,
                  labelText: '주소',
                  validator: validateAddress,
                  hintText: "주소를 입력하세요",
                ),
                SizedBox(height: 16.0),
                JoinTextFormField(
                  controller: _ageController,
                  keyboardType: TextInputType.number,
                  labelText: '생년월일',
                  hintText: 'YYYYMMDD',
                  validator: validateAge,
                ),
                SizedBox(height: 16.0),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
