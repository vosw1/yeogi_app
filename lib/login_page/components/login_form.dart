import 'package:flutter/material.dart';
import 'package:yogi_project/login_page/components/login_text_form_field.dart';
import 'package:yogi_project/size.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>(); // 글로벌 키
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: gap_xx, bottom: gap_m),
            child: Text(
              "여어떻노.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 43,
                fontWeight: FontWeight.w900,
                color: Colors.redAccent,
                fontFamily: 'Jalnan2TTF',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: gap_s, vertical: gap_m),
            child: LoginTextFormField(
              controller: _emailController,
              text: "이메일",
              hintText: "이메일을 입력하세요", // 힌트 텍스트 추가
              validator: (value) {
                if (value!.isEmpty) {
                  return "이메일은 공백이 있을 수 없습니다";
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: gap_s, vertical: gap_xx),
            child: LoginTextFormField(
              controller: _passwordController,
              text: "비밀번호",
              hintText: "패스워드를 입력하세요", // 힌트 텍스트 추가
              obscureText: true,
              validator: (value) {
                if (value!.isEmpty) {
                  return "비밀번호를 입력해주세요";
                } else if (value.length < 8) {
                  return "비밀번호는 8자 이상이어야 합니다";
                }
                return null;
              },
            ),
          ),
          SizedBox(height: gap_xx),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: gap_s, vertical: gap_m),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  Navigator.pushNamed(context, "/home");
                }
              },
              child: Text(
                "로그인",
                style: TextStyle(fontSize: 17, color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: gap_m),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                backgroundColor: Colors.redAccent,
              ),
            ),
          ),
          SizedBox(height: gap_xx),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: gap_s, vertical: gap_xx),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  Navigator.pushNamed(context, "/home");
                }
              },
              child: Text(
                "카카오톡 로그인",
                style: TextStyle(fontSize: 17, color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: gap_m),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                backgroundColor: Colors.yellow,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}

String? validatePassword(String? value) {
  // 비밀번호 유효성 검사 로직 구현
  if (value == null || value.isEmpty) {
    return "비밀번호를 입력해주세요";
  } else if (value.length < 8) {
    return "비밀번호는 8자 이상이어야 합니다";
  }
  return null;
}
