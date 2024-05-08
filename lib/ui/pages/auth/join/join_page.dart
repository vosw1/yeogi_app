import 'package:flutter/material.dart';
import 'package:yogi_project/_core/constants/size.dart';
import 'package:yogi_project/ui/pages/auth/join/widget/address/JoinForm.dart';

class JoinPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('회원가입'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(gap_m),
          child: JoinForm(), // JoinForm 위젯 사용
        ),
      ),
    );
  }
}
