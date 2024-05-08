import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yogi_project/_core/constants/move.dart';
import 'package:yogi_project/_core/utils/validator_util.dart';
import 'package:yogi_project/_core/constants/size.dart';
import 'package:yogi_project/data/dtos/user_request.dart';
import 'package:yogi_project/data/store/session_store.dart';
import 'package:yogi_project/ui/pages/_main_holder.dart';
import 'package:yogi_project/ui/pages/auth/login/widgets/login_text_form_field.dart';
import 'kakao_login_button.dart';

class LoginForm extends ConsumerWidget {
  final _formKey = GlobalKey<FormState>(); // 글로벌 키
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: gap_xl),
            _buildLogo(),
            _buildEmailField(),
            _buildPasswordField(),
            SizedBox(height: gap_xx),
            _buildLoginButton(ref, context),
            SizedBox(height: gap_xx),
            _buildKakaoLoginButton(),
            SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
          ],
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return LoginLogo();
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

  Widget _buildLoginButton(WidgetRef ref, context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: gap_s, vertical: gap_m),
      child: ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            // 이메일과 비밀번호 가져오기
            String email = _emailController.text;
            String password = _passwordController.text;

            // 로그인 요청 DTO 생성
            LoginReqDTO loginReqDTO =
                LoginReqDTO(email: email, password: password);

            // 로그인 메서드 호출
            final sessionStore = ref.read(sessionProvider);
            sessionStore.login(loginReqDTO);

            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => MainHolder()), (route) => false);
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
    return KakaoLoginButton();
  }
}

class LoginLogo extends StatelessWidget {
  const LoginLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
}
