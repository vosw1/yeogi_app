import 'package:flutter/material.dart';
import 'package:yogi_project/login_page/login_form.dart';
import 'package:yogi_project/size.dart';

// 로그인 페이지
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(height: gap_xl),
          LoginForm(),
        ],
      ),
    );
  }
}