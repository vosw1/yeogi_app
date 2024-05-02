import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:yogi_project/_core/utils/validator_util.dart';
import 'package:yogi_project/ui/pages/auth/join/join_page.dart';
import 'package:yogi_project/ui/pages/auth/login/widgets/login_text_form_field.dart';
import 'package:yogi_project/_core/constants/size.dart';

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
          _buildLogo(),
          _buildEmailField(),
          _buildPasswordField(),
          SizedBox(height: gap_xx),
          _buildLoginButton(),
          SizedBox(height: gap_xx),
          _buildKakaoLoginButton(),
        ],
      ),
    );
  }

  Widget _buildLogo() {
    return Padding(
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
    );
  }

  Widget _buildEmailField() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: gap_s, vertical: gap_m),
      child: LoginTextFormField(
        controller: _emailController,
        text: "이메일",
        hintText: "이메일을 입력하세요",
        validator: (value) {
          if (value!.isEmpty) {
            return "이메일은 공백이 있을 수 없습니다";
          }
          return null;
        },
      ),
    );
  }

  Widget _buildPasswordField() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: gap_s, vertical: gap_xx),
      child: LoginTextFormField(
        controller: _passwordController,
        text: "비밀번호",
        hintText: "패스워드를 입력하세요",
        obscureText: true,
        validator: validatePassword,
      ),
    );
  }

  Widget _buildLoginButton() {
    return Padding(
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
    );
  }

  Widget _buildKakaoLoginButton() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: gap_s, vertical: gap_s),
      child: Column(
        children: [
          ElevatedButton(
            onPressed: signInWithKakao,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FaIcon(FontAwesomeIcons.comment, color: Colors.black),
                SizedBox(width: 10),
                Text(
                  '카카오로 로그인',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: gap_m),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              backgroundColor: Colors.yellow,
            ),
          ),
          SizedBox(height: gap_l),
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => JoinPage()));
            },
            child: Text(
              '아직 회원이 아니시면 회원가입',
              style: TextStyle(
                color: Colors.redAccent,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      ),
    );
  }


  Future<void> signInWithKakao() async {
    try {
      await UserApi.instance.loginWithKakaoAccount();
    } catch (error) {
      print('카카오 로그인 실패 $error');
    }
  }

  Future<void> logout() async {
    try {
      await UserApi.instance.logout();
      print('로그아웃 성공, SDK에서 토큰 삭제');
    } catch (error) {
      print('로그아웃 실패, SDK에서 토큰 삭제 $error');
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}

