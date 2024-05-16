import 'package:flutter/material.dart';
import 'package:yogi_project/data/dtos/response_dto.dart';
import 'package:yogi_project/data/dtos/user_request.dart';
import 'package:yogi_project/data/repositories/user_repository.dart';

class DuplimentEmailCheck extends StatelessWidget {
  final TextEditingController emailController;

  const DuplimentEmailCheck({
    Key? key,
    required this.emailController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        _checkDuplicateEmail(context);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.redAccent,
      ),
      child: Text(
        '중복 확인',
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  void _checkDuplicateEmail(BuildContext context) async {
    String email = emailController.text;

    // 이메일 유효성 검사
    String? validationResult = validateEmail(email);
    if (validationResult != null) {
      _showErrorDialog(context, validationResult);
      return;
    }

      // 서버와 통신하여 이메일 중복 확인
      DuplimentEmailCheckDTO requestDTO = DuplimentEmailCheckDTO(email: email);
      UserRepository userRepository = UserRepository();
      ResponseDTO responseDTO = await userRepository.fetchEmailSameCheck(requestDTO);

      if (responseDTO.body == false) {
        // 이메일이 중복되지 않았을 경우 처리
        _showSuccessDialog(context, '사용 가능한 이메일입니다.');
      } else if (responseDTO.body == null)  {
        // 이메일이 중복되었을 경우 처리
        _showErrorDialog(context, '중복된 이메일입니다.');
      }
  }

  // 이메일 유효성 검사 함수
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "이메일은 공백이 들어갈 수 없습니다.";
    } else if (!isEmail(value)) {
      return "올바른 이메일 형식이 아닙니다.";
    } else {
      return null;
    }
  }

  // 이메일 형식 검사 함수
  bool isEmail(String? value) {
    final RegExp emailRegex = RegExp(
      r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$',
    );
    return emailRegex.hasMatch(value ?? '');
  }

  // 에러 다이얼로그 표시
  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('중복된 이메일'),
          content: Text('다른 이메일을 입력해주세요.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Center(child: Text('확인')),
            ),
          ],
        );
      },
    );
  }

  // 성공 다이얼로그 표시
  void _showSuccessDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('사용 가능한 이메일'),
          content: Text('이메일이 사용 가능합니다.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('확인'),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
