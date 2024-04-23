import 'package:flutter/material.dart';
import 'package:yogi_project/login_page/components/login_form.dart';
import 'package:yogi_project/size.dart';

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